from __future__ import annotations
import uuid, os
from datetime import datetime
from typing import List, Optional, Dict
from dotenv import load_dotenv, find_dotenv
import urllib.parse
from sqlalchemy.orm import Session
from sqlalchemy import or_

# ----------------- DTO + Models ----------------- #
from services.utils.docket_dto import DocketDTO
from models.pmv_dr_models import (
    Docket as DRDocket,
    DocketInventorsMapping,
    DocketReviewersMapping,
    DocketAttachmentMapping,
    DocketStatusMapping,
    ActivityLogs,
    Status,
    User,
)
from excel.ExcelData import ExcelColumns

# ----------------- Central Logger ----------------- #
from services.logger import logger  # Reuse centralized rotating logger

COLS = ExcelColumns()


# ----------------- Custom Error ----------------- #
class ReviewSaveError(RuntimeError):
    """Raised when DR docket creation fails due to missing required info."""


def _require(value, message: str):
    if not value:
        logger.error("✗ Requirement failed: %s", message)
        raise ReviewSaveError(message)
    return value


def save_from_invention_docket(
    dr_session: Session,
    row: dict,
    inv_docket: DocketDTO,
    tenant_id: str,
    import_user_id: str,
) -> DRDocket:
    """
    Save DR docket from an invention docket DTO.
    - Uses ONLY fields from the DTO (no ORM model access).
    - Enforces presence of patent agent and inventors.
    """

    logger.info(
        "→ Starting Docket Review save: docket='%s'",
        inv_docket.system_generated_docket_number,
    )

    # ---------------------- Duplicate Check ---------------------- #
    dup = (
        dr_session.query(DRDocket)
        .filter(
            or_(
                DRDocket.manual_docket_number == inv_docket.manual_docket_number,
                DRDocket.system_generated_docket_number
                == inv_docket.system_generated_docket_number,
            )
        )
        .first()
    )
    if dup:
        logger.warning("⏩ DR docket already exists (id=%s)", dup.id)
        return dup

    # ---------------------- Validate Required Roles ---------------------- #
    _require(inv_docket.patent_agent_id, "Patent Agent missing on invention docket")
    _require(
        inv_docket.inventor_ids, "At least one Inventor required on invention docket"
    )

    import_user = dr_session.get(User, import_user_id)

    # ---------------------- Create DR Docket ---------------------- #
    dr_docket = DRDocket(
        id=inv_docket.id,
        uuid=uuid.UUID(inv_docket.uuid),
        manual_docket_number=inv_docket.manual_docket_number,
        system_generated_docket_number=inv_docket.system_generated_docket_number,
        title=inv_docket.title,
        client_id=uuid.UUID(inv_docket.client_id),
        department_id=uuid.UUID(inv_docket.department_id),
        patent_agent_id=uuid.UUID(inv_docket.patent_agent_id),
        first_filing_country_id=inv_docket.first_filing_country_id,
        added_by=uuid.UUID(import_user.uuid),
        first_filing_date=inv_docket.first_filing_date,
        date_of_public_disclosure=inv_docket.date_of_public_disclosure,
        tenant_id=uuid.UUID(tenant_id),
        created_on=datetime.utcnow(),
        modified_on=datetime.utcnow(),
        active=True,
    )
    sent_for_drafting_value = row.get(COLS.SENT_FOR_DRAFTING, "").strip().lower()
    if sent_for_drafting_value == "yes":
        encoded_docket_number = urllib.parse.quote(
            inv_docket.system_generated_docket_number, safe=""
        )
        dr_docket.drafting_link = (
            os.getenv("DRAFTING_REDIRECTION_URL") + encoded_docket_number
        )
    dr_session.add(dr_docket)
    dr_session.flush()

    logger.info("✓ DR docket created: id=%s, title='%s'", dr_docket.id, dr_docket.title)
    status_name = row.get(COLS.SENT_FOR_REVIEW, "").strip()
    # ---------------------- Add Status (optional) ---------------------- #
    if status_name:
        status = dr_session.query(Status).filter_by(status=status_name).first()
        _require(status, f"Status '{status_name}' not found in pmv_dr.status")

        dr_session.add(
            DocketStatusMapping(
                docket_id=dr_docket.id,
                current_status_id=status.id,
                current_status_date=datetime.utcnow(),
                added_by=uuid.UUID(import_user.uuid),
                tenant_id=uuid.UUID(tenant_id),
                client_id=uuid.UUID(inv_docket.client_id),
                is_current=True,
                created_on=datetime.utcnow(),
                modified_on=datetime.utcnow(),
            )
        )
        logger.info("✓ DR docket status set to '%s'", status_name)

    # ---------------------- Add Inventors ---------------------- #
    for inventor_id in inv_docket.inventor_ids:
        dr_session.add(
            DocketInventorsMapping(
                docket_id=dr_docket.id,
                inventor_id=inventor_id,
                created_on=datetime.utcnow(),
                modified_on=datetime.utcnow(),
            )
        )
    logger.debug("✓ %d inventors mapped", len(inv_docket.inventor_ids))

    # ---------------------- Add Reviewer (optional) ---------------------- #
    if inv_docket.reviewer_id:
        dr_session.add(
            DocketReviewersMapping(
                docket_id=dr_docket.id,
                reviewer_id=inv_docket.reviewer_id,
                created_on=datetime.utcnow(),
                modified_on=datetime.utcnow(),
            )
        )
        logger.debug("✓ Reviewer '%s' mapped", inv_docket.reviewer_id)

    # ---------------------- Activity Log ---------------------- #
    dr_session.add(
        ActivityLogs(
            docket_id=dr_docket.id,
            message="Docket moved from Invention Disclosure to Docket Review",
            added_by=uuid.UUID(import_user.uuid),
            tenant_id=uuid.UUID(tenant_id),
            client_id=str(inv_docket.client_id),
            created_on=datetime.utcnow(),
            modified_on=datetime.utcnow(),
        )
    )
    logger.info(
        "✓ DR docket finalized with inventors=%d reviewers=%d",
        len(inv_docket.inventor_ids),
        len(inv_docket.reviewer_id or []),
    )

    return dr_docket
