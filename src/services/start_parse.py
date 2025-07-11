# ----------------- Python Standard Imports ----------------- #
import os
import time
import logging
import pandas as pd
from logging.handlers import TimedRotatingFileHandler
from sqlalchemy.orm import Session
import pprint

# ----------------- Internal Imports ----------------- #
from db.session import get_session
from excel.ExcelData import ExcelColumns
from services.utils.parser_utils import normalise_columns, COLUMN_ALIASES
from services.utils.static_cache import preload_all
from services.invention_disclosure_services.docket_service import DocketService
from services.docket_review_service.pmv_dr_docket_review_service import (
    save_from_invention_docket,
    ReviewSaveError,
)
from services.drafting_service.drafting_docket_service import DraftingService
from services.drafting_service.drafting_subdocket_service import (
    save_drafting_subdocket,
)
from services.utils.subdocket_static_cache import preload_all_subdocket_cache
from services.centralize_subdocket_services.centralize_subdocket_service import (
    save_subdocket,
)
from services.prosecution_services.prosecution_subdocket_service import (
    save_prosecution_subdocket,
)
from services.pmv_dca_services.casereference_service import save_casereference

# ----------------- Logging Configuration ----------------- #
from services.logger import logger

# ----------------- Excel Column Definitions ----------------- #
COLS = ExcelColumns()


def import_excel(
    excel_file: str, *, tenant_id: str, import_user: str, header_row: int = 0
):
    """
    Main import function to process an Excel file and populate
    Invention Disclosure, Docket Review, Drafting, and Subdocket modules.

    Args:
        excel_file (str): Path to Excel file to import.
        tenant_id (str): Tenant UUID for ownership.
        import_user (str): User UUID initiating the import.
        header_row (int): Header row index (default: 0).
    """
    start_ts = time.perf_counter()

    try:
        df = pd.read_excel(excel_file, header=0, dtype=str).fillna("")
    except Exception as e:
        logger.error("Failed to read Excel file '%s': %s", excel_file, e, exc_info=True)
        raise RuntimeError(f"Unable to read Excel file: {e}") from e

    normalise_columns(df, COLUMN_ALIASES)
    logger.info("⚙ Columns in DataFrame: %s", list(df.columns))

    ic_session = get_session("pmv_invention_disclosure")
    dr_session = get_session("pmv_dr")
    drafting_session = get_session("pmv_drafting")
    csd_session = get_session("pmv_csd")
    prosecution_session = get_session("pmv_prosecution")
    dca_session = get_session("pmv_dca")
    preload_all(ic_session)
    preload_all_subdocket_cache(csd_session)

    rows_processed = 0
    rows_skipped = 0

    try:
        for idx, row in enumerate(df.to_dict(orient="records"), start=header_row + 2):
            level = row.get(COLS.DOCKET_LEVEL, "").strip().lower()

            try:
                if level == "docket level":
                    docket_number = row.get(COLS.DOCKET_NUMBER)
                    logger.info("Row %s: importing docket '%s'", idx, docket_number)

                    ic_docket_dto = DocketService.create_docket(
                        ic_session,
                        tenant_id=tenant_id,
                        import_user_id=import_user,
                        row=row,
                    )

                    if ic_docket_dto is None:
                        rows_skipped += 1
                        logger.warning("Row %s: Docket skipped (DTO is None)", idx)
                        continue

                    rows_processed += 1
                    logger.info(
                        "[DTO DEBUG] Parsed DocketDTO for row %s: %s",
                        idx,
                        ic_docket_dto,
                    )

                    if ic_docket_dto.send_for_review:
                        try:
                            save_from_invention_docket(
                                dr_session=dr_session,
                                row=row,
                                inv_docket=ic_docket_dto,
                                tenant_id=tenant_id,
                                import_user_id=import_user,
                            )
                        except ReviewSaveError as e:
                            logger.error(" DR save failed row %s: %s", idx, e)

                    if ic_docket_dto.send_for_drafting:
                        try:
                            DraftingService.save_docket(
                                session=drafting_session,
                                dto=ic_docket_dto,
                            )
                            logger.info(
                                "✓ Drafting saved for docket '%s'",
                                ic_docket_dto.manual_docket_number,
                            )
                        except Exception as e:
                            logger.error(
                                " Drafting save failed row %s: %s",
                                idx,
                                e,
                                exc_info=True,
                            )
                            raise RuntimeError(
                                f"Drafting save failed for docket '{ic_docket_dto.manual_docket_number}' – {e}"
                            ) from e

                    ic_session.commit()
                    dr_session.commit()
                    drafting_session.commit()
                    logger.info(
                        "✓ Row %s committed for docket '%s'", idx, docket_number
                    )

                if level == "subdocket level":
                    logger.info(
                        "Row %s: importing subdocket for docket '%s'",
                        idx,
                        row.get(COLS.DOCKET_NUMBER),
                    )

                    # --- Step 1: Save to the primary (CSD) database ---
                    subdocket_dto = save_subdocket(
                        session=csd_session,
                        ict_session=ic_session,
                        row=row,
                        docket_number=row.get(COLS.DOCKET_NUMBER),
                        tenant_id=tenant_id,
                        import_user_id=import_user,
                    )

                    if subdocket_dto is None:
                        rows_skipped += 1
                        logger.warning("Row %s: Subdocket skipped (DTO is None)", idx)
                        continue

                    # --- Step 2: Save to downstream (Drafting) database ---
                    logger.info(
                        "Row %s: Saving corresponding entry to drafting database with DTO:\n%s",
                        idx,
                        pprint.pformat(subdocket_dto),
                    )
                    save_drafting_subdocket(
                        session=drafting_session, dto=subdocket_dto, row=row
                    )

                    # --- Step 3: Optionally save to Prosecution and Annuity ---
                    if row.get(COLS.SENT_FOR_PROSECUTION, "").strip().lower() == "yes":
                        save_prosecution_subdocket(
                            session=prosecution_session,
                            dto=subdocket_dto,
                            row=row,
                        )

                        # # 🟢 Save annuity/casereference from prosecution DTO
                        # save_casereference(
                        #     session=dca_session,
                        #     row=row,
                        #     subdocketDto=subdocket_dto,
                        #     import_user_id=import_user,
                        # )

                    # --- Step 4: Commit transactions ---
                    csd_session.commit()
                    prosecution_session.commit()
                    drafting_session.commit()
                    dca_session.commit()
                    rows_processed += 1
                    logger.info(
                        "✓ Row %s committed for subdocket of '%s'",
                        idx,
                        row.get(COLS.DOCKET_NUMBER),
                    )

            except Exception as exc:
                ic_session.rollback()
                dr_session.rollback()
                drafting_session.rollback()
                csd_session.rollback()
                prosecution_session.rollback()
                logger.error("✗ Row %s failed – %s", idx, exc, exc_info=True)
                raise RuntimeError(
                    f"Excel row {idx} (Docket '{row.get(COLS.DOCKET_NUMBER)}') failed – {exc}"
                ) from exc

        logger.info(
            "✅ Import complete: %d dockets processed, %d rows skipped.",
            rows_processed,
            rows_skipped,
        )
        print("✅ Import succeeded.")

    finally:
        elapsed = time.perf_counter() - start_ts
        logger.info(
            "⏱ Finished in %.2f s — %d processed, %d skipped (%.1f rows/s)",
            elapsed,
            rows_processed,
            rows_skipped,
            rows_processed / elapsed if elapsed else 0.0,
        )

        ic_session.close()
        dr_session.close()
        drafting_session.close()
        csd_session.close()
        prosecution_session.close()
        dca_session.close()
