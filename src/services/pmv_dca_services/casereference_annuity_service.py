from sqlalchemy.orm import Session
from models.pmv_dca_models import   Casereference,CasereferenceAnnuity
from services.utils.static_cache import country_name_by_id
from services.pmv_dca_services.annuity_calculator import annuity_calculation


SUPPORTED_COUNTRIES = {"india", "united states", "singapore"}


def save_annuity_dates_if_applicable(session: Session, case_ref: Casereference):
    try:
        country_name = country_name_by_id(case_ref.countryid).lower()

        if country_name not in SUPPORTED_COUNTRIES:
            return  # Skip annuity save for unsupported countries

        annuity_dates = annuity_calculation(
            grant_date=case_ref.grant_date,
            filing_date=case_ref.filing_date,
            country=country_name,
        )

        for idx, annuity_date in enumerate(annuity_dates, start=1):
            annuity_obj = CasereferenceAnnuity(
                casereferenceid=case_ref.id,
                annuity=idx,
                renewaldate=annuity_date,
                added_by=case_ref.added_by,
                added_date=case_ref.added_date,
            )
            session.add(annuity_obj)

        case_ref.has_annuity_data = True

    except Exception as e:
        # Log the error but do not break CaseReference saving
        print(f"Error calculating/saving annuity: {e}")
