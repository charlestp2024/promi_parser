from datetime import datetime
from sqlalchemy.orm import Session

from services.utils.subdocket_dto import SubdocketDTO
from services.logger import logger
from services.utils.role_constants import RoleEnum
from excel.ExcelData import ExcelColumns

# Import prosecution models only (no Docket)
from models.pmv_prosecution_models import (
    Subdocket as ProsecutionSubDocket,
    SubdocketUserRoles as ProsecutionSubdocketRoles,
    Assignee as ProsecutionAssignee,
    SubdocketAssigneeMapping as ProsecutionSubdocketAssigneeMapping,
    SubdocketLogs as ProsecutionSubdocketLogs,
)


def _handle_prosecution_roles(session: Session, dto: SubdocketDTO, subdocket_id: int):
    roles = []
    if dto.analyst_id:
        roles.append((dto.analyst_id, RoleEnum.ANALYST.id))
    if dto.patent_agent_id:
        roles.append((dto.patent_agent_id, RoleEnum.PATENT_AGENT.id))
    for inventor_id in dto.inventor_ids:
        roles.append((inventor_id, RoleEnum.INVENTOR.id))

    for user_id, role_id in roles:
        session.add(
            ProsecutionSubdocketRoles(
                user_id=str(user_id),
                role_id=role_id,
                subdocket_id=subdocket_id,
                created_on=datetime.utcnow(),
                modified_on=datetime.utcnow(),
                deleted=False,
            )
        )
    logger.info(f"✓ Added {len(roles)} role mappings for subdocket UUID {dto.uuid}")


def _handle_prosecution_assignees(session: Session, dto: SubdocketDTO, row: dict, subdocket_id: int):
    assignee_names = row.get(ExcelColumns.ASSIGNEE_NAME, "")
    if not assignee_names:
        return

    for name in assignee_names.split(","):
        name = name.strip()
        if not name:
            continue

        assignee = (
            session.query(ProsecutionAssignee)
            .filter_by(name=name, tenant_id=dto.tenant_id)
            .first()
        )
        if not assignee:
            assignee = ProsecutionAssignee(
                name=name,
                client_id=str(dto.client_id),
                tenant_id=dto.tenant_id,
                created_on=datetime.utcnow(),
                modified_on=datetime.utcnow(),
                added_by=dto.added_by
            )
            session.add(assignee)
            session.flush()

        session.add(
            ProsecutionSubdocketAssigneeMapping(
                subdocket_id=subdocket_id,
                assignee_id=assignee.id,
                created_on=datetime.utcnow(),
                modified_on=datetime.utcnow(),
            )
        )
    logger.info(f"✓ Mapped assignees for subdocket UUID {dto.uuid}")




def save_prosecution_subdocket(session: Session, dto: SubdocketDTO, row: dict):
    """
    Save a prosecution subdocket using only prosecution models — no Docket linkage.

    Args:
        session (Session): SQLAlchemy session.
        dto (SubdocketDTO): Subdocket data.
        row (dict): Excel row for supplemental info (e.g., assignees).
    """
    try:
        # 1. Check if subdocket already exists (idempotency)
        existing_subdocket = (
            session.query(ProsecutionSubDocket)
            .filter_by(uuid=str(dto.uuid))
            .first()
        )
        if existing_subdocket:
            logger.info(f"✓ Skipping: Subdocket UUID {dto.uuid} already exists.")
            return existing_subdocket

        # 2. Create new SubDocket
        subdocket = ProsecutionSubDocket(
            uuid=str(dto.uuid),
            docket_uuid=str(dto.docket_uuid),
            system_generated_subdocket_number=dto.system_generated_subdocket_number,
            subdocket_number=dto.manual_subdocket_number,
            tenant_id=dto.tenant_id,
            client_id=str(dto.client_id),
            department_id=str(dto.department_id),
            docket_number=dto.docket_number,
            country_of_filing=dto.country_of_filing_id,
            added_by=str(dto.added_by),
            status_id=dto.status_id,
            subdocket_filing_type_id=dto.type_of_filing_id,
            filing_entity_type_id=dto.filing_entity_type_id,
            application_number=dto.application_number,
            publication_number=dto.publication_number,
            filing_date=dto.filing_date,
            publication_date=dto.publication_date,
            # grant_date=dto.grant_date,
            priority_date=dto.priority_date,
            prior_filing_year=dto.prior_filing_date,
            # tentative_filing_date=dto.tentative_filing_date,
            # expected_filing_year=dto.expected_filing_year,
            # office_action_recieved_date=dto.recent_action_recieved_date,
            # term_extension=dto.term_extention,
            created_on=dto.created_on,
    
            modified_on=dto.modified_on,
            deleted=False,
        )
        session.add(subdocket)
        session.flush()

        # 3. Map relationships (roles, assignees, countries)
        _handle_prosecution_roles(session, dto, subdocket.id)
        _handle_prosecution_assignees(session, dto, row, subdocket.id)
        
        # 4. Add creation log
        log = ProsecutionSubdocketLogs(
            subdocket_id=subdocket.id,
            client_id=str(dto.client_id),
            tenant_id=dto.tenant_id,
            created_by=str(dto.added_by),
            created_on=datetime.utcnow(),
            modified_on=datetime.utcnow(),
            operation_type="Prosecution Subdocket created",
        )
        session.add(log)

        logger.info(f"✓ Successfully saved prosecution subdocket '{dto.manual_subdocket_number}'")
        return subdocket

    except Exception as e:
        logger.error(f"✗ Failed to save prosecution subdocket UUID {dto.uuid}: {e}")
        raise
