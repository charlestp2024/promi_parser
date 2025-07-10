from datetime import datetime
from sqlalchemy.exc import SQLAlchemyError
from sqlalchemy.orm import Session

# ----------------- Models ----------------- #
from models.pmv_drafting_models import (
    Docket,
    DocketLogs,
    DocketSubdocketRoles,
    DocketForeignFilingCountryMapping,
    SourceEnum
)
from services.utils.docket_dto import DocketDTO
from services.utils.role_constants import RoleEnum

# ----------------- Central Logger ----------------- #
from services.logger import logger


class DraftingService:
    @staticmethod
    def save_docket(session: Session, dto: DocketDTO):
        """
        Saves a docket to the Drafting module, given a DocketDTO from Invention Disclosure.
        - Skips duplicates based on UUID
        - Maps roles and foreign countries
        - Adds log entries
        """
        now = datetime.utcnow()

        try:
            # ---------------------- Duplicate Check ---------------------- #
            existing = session.query(Docket).filter_by(uuid=dto.uuid).first()
            if existing:
                logger.info(
                    "[Drafting] Skipped duplicate docket '%s' (uuid=%s)",
                    dto.system_generated_docket_number,
                    dto.uuid,
                )
                return None

            # ---------------------- Create New Docket ---------------------- #
            docket = Docket(
                id=dto.id,
                uuid=dto.uuid,
                docket_number=dto.system_generated_docket_number,
                manual_docket_number=dto.manual_docket_number,
                client_id=dto.client_id,
                title=dto.title,
                department_id=dto.department_id,
                division=dto.division_id,
                added_by=dto.added_by,
                filing_entity_type_id=dto.filing_entity_id,
                tenant_id=dto.tenant_id,
                created_on=dto.created_on or now,
                modified_on=dto.modified_on or now,
                first_filing_date=dto.first_filing_date,
                current_status_date=dto.current_status_date,
                annuity_timeline=dto.annuity_timeline,
                deadline_for_filing=dto.deadline_for_filing,
                public_disclosure_date=dto.date_of_public_disclosure,
                country_of_filing_id=dto.first_filing_country_id,
                foreign_license_required=dto.foreign_license_required,
                current_status=dto.status_id,
                deleted=False,
                first_filing_type_id=dto.filing_type_id,
                filing_maintenance_cost=dto.filing_maintenance_cost_estimate,
                temp_number=dto.temp_number,
            )
            session.add(docket)
            if dto.send_for_review==True:
                docket.source = SourceEnum.PMV_DR
            
            logger.debug("[Drafting] Docket entity prepared and added to session.")

            # ---------------------- Log Entry ---------------------- #
            session.add(
                DocketLogs(
                    tenant_id=dto.tenant_id,
                    client_id=dto.client_id,
                    modified_on=now,
                    docket=docket,
                    created_by=dto.added_by,
                    operation_type="Saved Docket from INVD to Drafting",
                    created_on=now,
                )
            )

            logger.debug("[Drafting] DocketLogs entry added.")

            # ---------------------- Role Mapping ---------------------- #
            def add_role(user_id, role_enum: RoleEnum):
                if user_id:
                    session.add(
                        DocketSubdocketRoles(
                            docket=docket,
                            user_id=user_id,
                            role_id=role_enum.id,
                            created_on=now,
                            modified_on=now,
                            deleted=False,
                        )
                    )
                    logger.debug(
                        "[Drafting] Role '%s' mapped to user %s",
                        role_enum.name,
                        user_id,
                    )

            add_role(dto.patent_agent_id, RoleEnum.PATENT_AGENT)
            add_role(dto.reviewer_id, RoleEnum.REVIEWER)
            for inventor_id in dto.inventor_ids:
                add_role(inventor_id, RoleEnum.INVENTOR)

            # ---------------------- Foreign Filing Countries ---------------------- #
            for country_id in dto.foreign_filing_countries_ids or []:
                session.add(
                    DocketForeignFilingCountryMapping(
                        docket=docket,
                        country_id=country_id,
                        created_on=now,
                        modified_on=now,
                    )
                )
            if dto.foreign_filing_countries_ids:
                logger.debug(
                    "[Drafting] %d foreign countries mapped",
                    len(dto.foreign_filing_countries_ids),
                )

            # ---------------------- Commit This Docket ---------------------- #
            session.flush()
            logger.info(
                "[Drafting] ✓ Successfully saved docket '%s'",
                dto.system_generated_docket_number,
            )

            return docket

        except SQLAlchemyError as e:
            logger.exception(
                "[Drafting] ✗ DB error while saving docket '%s' (uuid=%s)",
                dto.system_generated_docket_number,
                dto.uuid,
            )
            raise RuntimeError(
                f"Drafting save failed for docket '{dto.system_generated_docket_number}' – {str(e)}"
            ) from e

        except Exception as e:
            logger.exception(
                "[Drafting] ✗ Unexpected error while saving docket '%s'",
                dto.system_generated_docket_number,
            )
            raise RuntimeError(
                f"Unexpected error in Drafting save for docket '{dto.system_generated_docket_number}' – {str(e)}"
            ) from e
