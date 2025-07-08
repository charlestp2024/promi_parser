# In a new file, e.g., services/drafting_subdocket_service.py

from datetime import datetime
from sqlalchemy.orm import Session

# Import your DTO and all required Drafting Models
from services.utils.subdocket_dto import SubdocketDTO
from models.pmv_drafting_models import (
    Docket,
    SubDocket,
    DocketSubdocketRoles,
    Assignee,
    SubdocketAssigneeMapping,
    SubdocketForeignFilingCountryMapping,
    SubdocketLogs,
)

# Import shared utilities
from services.utils.role_constants import RoleEnum
from excel.ExcelData import ExcelColumns  # To get assignee names from the row
from services.logger import logger


def _handle_drafting_roles(
    session: Session,
    dto: SubdocketDTO,
    drafting_docket_id: int,
    drafting_subdocket_id: int,
):
    """Creates the role mappings in the drafting database."""

    roles_to_map = []
    if dto.analyst_id:
        roles_to_map.append((dto.analyst_id, RoleEnum.ANALYST.id))
    if dto.patent_agent_id:
        roles_to_map.append((dto.patent_agent_id, RoleEnum.PATENT_AGENT.id))
    for inventor_id in dto.inventor_ids:
        roles_to_map.append((inventor_id, RoleEnum.INVENTOR.id))

    for user_id, role_id in roles_to_map:
        session.add(
            DocketSubdocketRoles(
                user_id=str(user_id),
                role_id=role_id,
                docket_id=drafting_docket_id,
                subdocket_id=drafting_subdocket_id,
                created_on=datetime.utcnow(),
                modified_on=datetime.utcnow(),
                deleted=False,
            )
        )
    logger.info(
        f"✓ Added {len(roles_to_map)} role mappings for subdocket UUID {dto.uuid}"
    )


def _handle_drafting_assignees(
    session: Session, dto: SubdocketDTO, row: dict, drafting_subdocket_id: int
):
    """Finds or creates assignees and maps them to the drafting subdocket."""

    assignee_names_raw = row.get(ExcelColumns.ASSIGNEE_NAME, "")
    if not assignee_names_raw:
        return

    for name in assignee_names_raw.split(","):
        name = name.strip()
        if not name:
            continue

        # Find assignee by name in the drafting DB
        assignee = (
            session.query(Assignee)
            .filter_by(name=name, tenant_id=dto.tenant_id)
            .first()
        )

        if not assignee:
            # Create if it doesn't exist
            assignee = Assignee(
                name=name,
                client_id=str(dto.client_id),
                tenant_id=dto.tenant_id,
                created_on=datetime.utcnow(),
                modified_on=datetime.utcnow(),
            )
            session.add(assignee)
            session.flush()  # Flush to get the new assignee ID

        # Create the mapping
        mapping = SubdocketAssigneeMapping(
            subdocket_id=drafting_subdocket_id,
            assignee_id=assignee.id,
        )
        session.add(mapping)
    logger.info(f"✓ Mapped assignees for subdocket UUID {dto.uuid}")


def _handle_drafting_foreign_filing(
    session: Session, dto: SubdocketDTO, drafting_subdocket_id: int
):
    """Creates foreign filing country mappings in the drafting database."""

    if not dto.foreign_filing_countries_ids:
        return

    for country_id in dto.foreign_filing_countries_ids:
        session.add(
            SubdocketForeignFilingCountryMapping(
                subdocket_id=drafting_subdocket_id,
                countries_id=country_id,  # Note the model uses 'countries_id'
                created_on=datetime.utcnow(),
                modified_date=datetime.utcnow(),
            )
        )
    logger.info(
        f"✓ Added {len(dto.foreign_filing_countries_ids)} foreign filing mappings for subdocket UUID {dto.uuid}"
    )


# In services/drafting_subdocket_service.py


class DraftingSubdocketService:
    """
    A service class to handle all operations related to subdockets in the drafting module.
    """


@staticmethod
def save_drafting_subdocket(session: Session, dto: SubdocketDTO, row: dict):
    """
    Saves a subdocket from a DTO into the drafting database.

    This function is idempotent and follows these rules:
    1. It first verifies the parent Docket exists in the drafting DB.
    2. It checks if the SubDocket (by UUID) already exists to prevent duplicates.
    3. If new, it creates the SubDocket and all its related mappings (roles, assignees, etc.).

    Args:
        session: The SQLAlchemy session for the drafting database.
        dto: The SubdocketDTO containing data from the main CSD system.
        row: The original Excel row data, needed for fields not in the DTO (like assignee names).
    """
    try:
        # 1. Find parent Docket in the Drafting DB. This is a hard requirement.
        parent_docket = (
            session.query(Docket)
            .filter_by(manual_docket_number=dto.docket_number, tenant_id=dto.tenant_id)
            .first()
        )
        if not parent_docket:
            raise ValueError(
                f"Parent docket '{dto.docket_number}' not found in the drafting database. "
                "Ensure parent dockets are processed first."
            )
        drafting_docket_id = parent_docket.id

        # 2. Check if this Subdocket already exists to ensure idempotency.
        existing_subdocket = (
            session.query(SubDocket).filter_by(uuid=str(dto.uuid)).first()
        )
        if existing_subdocket:
            logger.info(
                f"Skipping save. Subdocket with UUID '{dto.uuid}' already exists in drafting DB."
            )
            return existing_subdocket

        # 3. Create the new SubDocket instance by mapping DTO fields
        new_subdocket = SubDocket(
            uuid=str(dto.uuid),
            docket_uuid=str(dto.docket_uuid),
            subdocket_number=dto.system_generated_subdocket_number,  # Or another primary identifier
            manual_subdocket_number=dto.manual_subdocket_number,
            tenantId=dto.tenant_id,
            client_id=str(dto.client_id),
            added_by=str(dto.added_by),
            country_id=dto.country_of_filing_id,
            status_id=dto.status_id,
            subdocket_filing_type_id=dto.type_of_filing_id,
            filing_entity_type_id=dto.filing_entity_type_id,
            application_number=dto.application_number,
            publication_number=dto.publication_number,
            filing_maintenance_cost=dto.filing_maintenance_cost_estimate,
            # Dates
            filing_date=dto.filing_date,
            publication_date=dto.publication_date,
            grant_date=dto.grant_date,
            priority_date=dto.priority_date,
            prior_filing_year=dto.prior_filing_date,  # Mapping names
            tentative_filing_date=dto.tentative_filing_date,
            expected_filing_year=dto.expected_filing_year,
            office_action_recieved_date=dto.recent_action_recieved_date,
            term_extension=dto.term_extention,
            # Timestamps
            added_time=dto.created_on,
            modifiedOn=dto.modified_on,
            deleted=False,
        )

        session.add(new_subdocket)
        session.flush()  # Flush to get the new_subdocket.id for relationships

        # 4. Handle all related mappings using the helper functions
        drafting_subdocket_id = new_subdocket.id
        _handle_drafting_roles(session, dto, drafting_docket_id, drafting_subdocket_id)
        _handle_drafting_assignees(session, dto, row, drafting_subdocket_id)
        _handle_drafting_foreign_filing(session, dto, drafting_subdocket_id)

        # 5. Create a log entry
        log = SubdocketLogs(
            subdocket_id=drafting_subdocket_id,
            client_id=str(dto.client_id),
            tenant_id=dto.tenant_id,
            created_by=str(dto.added_by),
            added_time=datetime.utcnow(),
            modified_on=datetime.utcnow(),
            operation_type="Subdocket created successfully",
        )
        session.add(log)

        logger.info(
            f"✓ Successfully prepared drafting subdocket '{dto.manual_subdocket_number}' for commit."
        )
        return new_subdocket

    except Exception as e:
        logger.error(f"✗ Failed to save drafting subdocket for UUID {dto.uuid}: {e}")
        # Re-raise to allow the calling process to handle the transaction rollback
        raise
