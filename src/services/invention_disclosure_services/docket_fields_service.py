from sqlalchemy.orm import Session
from typing import Dict, List

# ----------------- Centralized Logger ----------------- #
from services.logger import (
    logger,
)  

# ----------------- Internal Imports ----------------- #
from services.utils.lookup_cache import (
    uuid_for_user_name,
    client_entry,
    uuid_for_department,
    uuid_for_division,
)
from excel.ExcelData import ExcelColumns
from services.utils.parser_utils import split_multi
from models.invention_disclosure_models import (
    Client,
    ClientDivision,
    Department,
    User,
)

COLS = ExcelColumns()


def get_existing_user_by_name(session: Session, full_name: str) -> User:
    """
    Fetch a user by name via JSON map and verify existence in the DB.
    """
    logger.debug("Looking up user by name: '%s'", full_name)
    user_uuid = uuid_for_user_name(full_name)
    if not user_uuid:
        logger.error("❌ User name '%s' not found in users_map.json.", full_name)
        raise ValueError(f"User name '{full_name}' not found in users_map.json.")

    user_obj = session.get(User, user_uuid)
    if not user_obj:
        logger.error(
            "❌ User UUID '%s' (for '%s') missing in DB.", user_uuid, full_name
        )
        raise ValueError(f"User UUID '{user_uuid}' (for {full_name}) missing in DB.")

    logger.debug("✓ Found user '%s' with UUID: %s", full_name, user_uuid)
    return user_obj


def get_existing_client(session: Session, name: str, tenant_id: str) -> Client:
    """
    Fetch client by name using JSON UUID and validate against DB and tenant.
    """
    logger.debug("Looking up client: '%s'", name)
    entry = client_entry(name)
    if not entry:
        logger.error("❌ Client '%s' not found in client_hierarchy_map.json.", name)
        raise ValueError(f"Client '{name}' not found in client_hierarchy_map.json.")

    client = session.get(Client, entry["uuid"])
    if not client:
        logger.error(
            "❌ Client UUID '%s' (for '%s') missing in DB.", entry["uuid"], name
        )
        raise ValueError(f"Client UUID '{entry['uuid']}' for '{name}' missing in DB.")

    if str(client.tenant_id) != tenant_id:
        logger.error("❌ Client '%s' does not belong to tenant %s.", name, tenant_id)
        raise ValueError(f"Client '{name}' does not belong to tenant {tenant_id}.")

    logger.debug("✓ Found client '%s' with UUID: %s", name, client.uuid)
    return client


def get_existing_department(session: Session, client: Client, name: str) -> Department:
    """
    Fetch department UUID from JSON and verify in DB.
    """
    logger.debug("Looking up department '%s' for client '%s'", name, client.client_name)
    dept_uuid = uuid_for_department(client.client_name, name)
    if not dept_uuid:
        logger.error(
            "❌ Department '%s' not found in JSON map for client '%s'.",
            name,
            client.client_name,
        )
        raise ValueError(
            f"Department '{name}' not defined for client '{client.client_name}' in JSON map."
        )

    dept = session.get(Department, dept_uuid)
    if not dept:
        logger.error("❌ Department UUID '%s' missing in DB.", dept_uuid)
        raise ValueError(f"Department UUID '{dept_uuid}' missing in DB.")

    logger.debug("✓ Found department '%s' with UUID: %s", name, dept_uuid)
    return dept


def get_existing_client_division(session: Session, client: Client, name: str | None):
    """
    Get client division by name if present; skip if empty.
    """
    if not name:
        logger.debug("No division name provided — skipping.")
        return None

    logger.debug("Looking up division '%s' for client '%s'", name, client.client_name)
    div_uuid = uuid_for_division(client.client_name, name)
    if not div_uuid:
        logger.error(
            "❌ Division '%s' not found in JSON map for client '%s'.",
            name,
            client.client_name,
        )
        raise ValueError(
            f"Division '{name}' not defined for client '{client.client_name}' in JSON map."
        )

    div = session.get(ClientDivision, div_uuid)
    if not div:
        logger.error("❌ Division UUID '%s' missing in DB.", div_uuid)
        raise ValueError(f"Division UUID '{div_uuid}' missing in DB.")

    logger.debug("✓ Found division '%s' with UUID: %s", name, div_uuid)
    return div


def role_map_from_row(session: Session, row: Dict[str, str]) -> Dict[str, List[User]]:
    """
    Parse user roles from a row and return mapping of role name -> List[User].
    """
    rm: Dict[str, List[User]] = {}

    def _add(role_name: str, names: List[str]):
        if not names:
            return
        logger.debug("Parsing role '%s' with user(s): %s", role_name, names)
        try:
            role_users = [get_existing_user_by_name(session, n) for n in names]
            rm[role_name] = role_users
        except ValueError as e:
            logger.error("❌ Error mapping role '%s': %s", role_name, e)
            raise

    # Excel columns where names are comma‑separated
    _add("Patent Agent", split_multi(row.get(COLS.PATENT_AGENT)))
    _add("Drafter", split_multi(row.get(COLS.DRAFTER)))
    _add("Analyst", split_multi(row.get(COLS.ANALYST)))
    _add("Reviewer", split_multi(row.get(COLS.REVIEWER)))
    _add("Manager(Internal)", split_multi(row.get(COLS.MANAGER_INTERNAL)))
    _add("Inventor", split_multi(row.get(COLS.INVENTORS)))

    return rm
