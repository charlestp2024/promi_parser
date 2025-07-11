from sqlalchemy.orm import Session
from datetime import datetime
from models.pmv_dca_models import Casereference
from services.pmv_dca_services.casereference_annuity_service import (
    save_annuity_dates_if_applicable,
)
from services.utils.subdocket_dto import SubdocketDTO
from services.pmv_dca_services.casereference_reminder_service import (
    generate_annuity_reminders_for_case,    )

def save_casereference(
    session: Session, subdocketDto: SubdocketDTO, row: dict, import_user_id: str
) -> Casereference:
    """
    Saves the CaseReference and its annuity dates if applicable.
    Expects a fully populated SubdocketDTO.
    """
    filing_date = subdocketDto.filing_date
    grant_date = subdocketDto.grant_date
    country_id = subdocketDto.country_of_filing_id

    if not (filing_date and grant_date and country_id):
        raise ValueError(
            "Missing filing_date, grant_date, or country_of_filing_id in SubdocketDTO"
        )

    case_ref = Casereference(
        casenumber=subdocketDto.system_generated_subdocket_number,
        docketid=subdocketDto.docket_uuid,
        client_id=subdocketDto.client_id,
        department_id=subdocketDto.department_id,
        countryid=country_id,
        filingtypeid=subdocketDto.type_of_filing_id,
        inforce=True,  # defaulted to True, or could be a field in DTO if added
        filing_date=filing_date,
        grant_date=grant_date,
        added_date=datetime.now(),
        
        latest_annuity_number=None,  # Not available in DTO
        current_attorney=None,  # Not available in DTO
        current_annuity_decision=None,  # Not available in DTO
        current_annuity_decision_date=None,  # Not available in DTO
        system_generated_subdocket_number=subdocketDto.system_generated_subdocket_number,
        tenant_id=subdocketDto.tenant_id,
        
    )

    session.add(case_ref)
    session.flush()  # Ensures case_ref.id is populated

    # Save annuity dates only for specific countries
    save_annuity_dates_if_applicable(session, case_ref)

    generate_annuity_reminders_for_case(session, case_ref.id)

    return case_ref
