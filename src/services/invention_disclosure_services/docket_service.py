from __future__ import annotations
import uuid,os
from datetime import datetime
from typing import List
from dotenv import load_dotenv,find_dotenv
from sqlalchemy import func
from sqlalchemy.orm import Session

load_dotenv(find_dotenv(filename=".env.local"))

# ----------------- Models ----------------- #
from models.invention_disclosure_models import (
    Docket,
    Client,
    ClientDivision,
    Department,
    FilingEntityType,
    FilingType,
    Countries,
    Status,
    User,
    Role,
    DocketAttachmentMapping,
    DocketForeignFilingCountryMapping,
    DocketUserRoleMapping,
    DocketLogs,
)

# ----------------- Utility Constants ----------------- #
from services.utils.role_constants import RoleEnum
from services.utils.docket_dto import DocketDTO
from services.utils.parser_utils import (
    parse_date,
    parse_decimal,
    parse_bool,
    split_multi,
)
from services.invention_disclosure_services.docket_fields_service import (
    get_existing_client,
    get_existing_department,
    get_existing_client_division,
    role_map_from_row,
)
from services.utils.static_cache import (
    status_by_name,
    country_by_name,
    filing_entity_by_name,
    filing_type_by_name,
    role_by_name,
)
from excel.ExcelData import ExcelColumns

# ----------------- Use Centralized Logger ----------------- #
from services.logger import logger

COLS = ExcelColumns()


def _next_temp_number(session: Session) -> int:
    """
    Fetch the next available temp docket number.
    """
    return session.query(func.coalesce(func.max(Docket.temp_number), 0)).scalar() + 1


def _autogen_docket_no(client: Client, temp: int) -> str:
    """
    Auto-generate docket number in format: YY<client_code>/<temp>
    """
    year = datetime.now().strftime("%y")
    client_code = getattr(client, "client_code", "CL")
    return f"{year}{str(client_code).zfill(4)}/{str(temp).zfill(4)}"


class DocketService:
    @staticmethod
    def create_docket(
        session: Session, *, tenant_id: str, import_user_id: str, row: dict
    ) -> Docket | None:
        """
        Main method to create a docket from a parsed Excel row.
        Performs lookups, validates duplicates, maps roles, and returns a DocketDTO.
        """
        logger.debug(
            "Creating docket for row with manual number: %s",
            row.get(COLS.DOCKET_NUMBER),
        )

        # ----------------- Lookups ----------------- #
        import_user = session.get(User, import_user_id)
        client = get_existing_client(session, row[COLS.CLIENT], tenant_id)
        department = get_existing_department(session, client, row[COLS.DEPARTMENT])
        division = get_existing_client_division(
            session, client, row.get(COLS.CLIENT_DIVISION, "")
        )
        status = status_by_name(row.get(COLS.CURRENT_STATUS))
        filing_entity = filing_entity_by_name(row.get(COLS.FILING_ENTITY_TYPE))
        filing_type = filing_type_by_name(row.get(COLS.FIRST_FILING_TYPE))
        first_country = country_by_name(row.get(COLS.FIRST_FILING_COUNTRY))
        foreign_country_objs = [
            country_by_name(c)
            for c in split_multi(row.get(COLS.FOREIGN_FILING_COUNTRIES))
            if c
        ]

        # ----------------- Check for Duplicates ----------------- #
        manual_docket_number = row.get(COLS.DOCKET_NUMBER, "").replace(" ", "")
        existing = (
            session.query(Docket)
            .filter_by(
                manual_docket_number=manual_docket_number,
                client_id=client.uuid,
                tenant_id=tenant_id,
            )
            .first()
        )
        if existing:
            logger.info(
                "⏩ Skipped duplicate docket '%s' (id=%s, client='%s')",
                manual_docket_number,
                existing.id,
                client.client_name,
            )
            return convert_docket_to_dto(existing, row=row)

        # ----------------- Create New Docket ----------------- #
        temp_number = _next_temp_number(session)
        autogen_number = _autogen_docket_no(client, temp_number)

        docket = Docket(
            uuid=uuid.uuid4(),
            tenant_id=tenant_id,
            temp_number=temp_number,
            title=row.get(COLS.TITLE),
            client=client,
            client_division=division,
            department=department,
            status=status,
            user=import_user,
            system_generated_docket_number=autogen_number,
            manual_docket_number=manual_docket_number,
            filing_entity_type=filing_entity,
            filing_type=filing_type,
            first_filing_country=first_country,
            filing_maintenance_cost=parse_decimal(
                row.get(COLS.FILING_MAINTENANCE_COST_ESTIMATE)
            ),
            foreign_license_required=parse_bool(row.get(COLS.FOREIGN_FILING_COUNTRIES)),
            created_on=func.now(),
            modified_on=func.now(),
            added_by=str(import_user.uuid),
            appid=str(os.getenv("ININVENTION_CENTRE_APP_ID")),
            deleted=False,
        )

        # ----------------- Assign Dates ----------------- #
        docket.first_filing_date = parse_date(row.get(COLS.FIRST_FILING_DATE))
        docket.current_status_date = parse_date(row.get(COLS.CURRENT_STATUS_DATE))
        docket.annuity_timeline = parse_date(row.get(COLS.ANNUITY_TIMELINE))
        docket.deadline_for_filing = parse_date(row.get(COLS.DEADLINE_FOR_FILING))
        docket.date_of_public_disclosure = parse_date(row.get(COLS.CURRENT_STATUS_DATE))

        docket.send_for_review = parse_bool(row.get(COLS.SENT_FOR_REVIEW))
        docket.send_for_drafting = parse_bool(row.get(COLS.SENT_FOR_DRAFTING))

        session.add(docket)

        # ----------------- Foreign Filing Countries ----------------- #
        for country in foreign_country_objs:
            session.add(
                DocketForeignFilingCountryMapping(docket=docket, countries=country)
            )

        # ----------------- User Role Mapping ----------------- #
        role_map = role_map_from_row(session, row)
        seen = set()
        for role_name, users in role_map.items():
            role = role_by_name(role_name)
            for user in users:
                key = (user.uuid, role.id)
                if key in seen:
                    continue
                seen.add(key)
                session.add(DocketUserRoleMapping(docket=docket, user=user, role=role))

        # ----------------- Add Initial Docket Log ----------------- #
        session.add(
            DocketLogs(
                docket=docket,
                added_by=str(import_user.uuid),
                tenant_id=tenant_id,
                client=client,
                created_on=func.now(),
                logs="Invention created successfully.",
            )
        )

        session.flush()

        logger.info(
            "✅ Created docket id=%s, auto_no='%s', client='%s'",
            docket.id,
            docket.system_generated_docket_number,
            client.client_name,
        )
        return convert_docket_to_dto(docket, row=row)


def convert_docket_to_dto(docket: Docket, row: dict) -> DocketDTO:
    """
    Convert a saved Docket SQLAlchemy model instance to a DocketDTO for downstream use.
    """
    role_map = {ur.role.role: ur.user_id for ur in docket.docket_user_role_mappings}
    inventor_ids = [
        ur.user_id
        for ur in docket.docket_user_role_mappings
        if ur.role.role == RoleEnum.INVENTOR.label
    ]
    foreign_country_ids = [
        mapping.country_id for mapping in docket.docket_foreign_filing_country_mappings
    ]

    return DocketDTO(
        id=docket.id,
        uuid=str(docket.uuid),
        system_generated_docket_number=docket.system_generated_docket_number,
        manual_docket_number=docket.manual_docket_number,
        client_id=docket.client_id,
        docket_type="docket",
        title=docket.title,
        department_id=docket.department_id,
        division_id=docket.client_division_id,
        added_by=docket.added_by,
        tenant_id=docket.tenant_id,
        created_on=docket.created_on,
        status_id=docket.status.id if docket.status else None,
        filing_entity_id=(
            docket.filing_entity_type.id if docket.filing_entity_type else None
        ),
        modified_on=docket.modified_on,
        first_filing_date=docket.first_filing_date,
        current_status_date=docket.current_status_date,
        annuity_timeline=docket.annuity_timeline,
        deadline_for_filing=docket.deadline_for_filing,
        date_of_public_disclosure=docket.date_of_public_disclosure,
        patent_agent_id=role_map.get(RoleEnum.PATENT_AGENT.label),
        reviewer_id=role_map.get(RoleEnum.REVIEWER.label),
        inventor_ids=inventor_ids,
        send_for_review=docket.send_for_review,
        send_for_drafting=parse_bool(row.get(COLS.SENT_FOR_DRAFTING)),
        first_filing_country_id=docket.first_filing_country_id,
        foreign_license_required=docket.foreign_license_required,
        foreign_filing_countries_ids=foreign_country_ids,
        filing_maintenance_cost_estimate=docket.filing_maintenance_cost,
        filing_type_id=docket.filing_type.id if docket.filing_type else None,
        temp_number=docket.temp_number,
    )
