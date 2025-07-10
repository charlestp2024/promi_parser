from datetime import datetime
from services.pmv_dca_services.utils.date_utils import (
    add_date,
    is_future_date,
    is_past_date,
    get_date_difference_count,
    get_month,
    get_days_and_year,
)
from services.pmv_dca_services.enums.annuity_config import (
    annuity_dates_for_india,
    annuity_dates_for_singapore,
    annuity_dates_for_us,
)


def annuity_calculation(grant_date: datetime, filing_date: datetime, country: str):
    if not grant_date or not filing_date:
        raise ValueError("Both grant_date and filing_date are required")

    if country.lower() == "india":
        return annuity_calculation_for_india(grant_date, filing_date)
    elif country.lower() == "singapore":
        return annuity_calculation_for_singapore(grant_date, filing_date)
    elif country.lower() == "us":
        return annuity_calculation_for_us(grant_date, filing_date)
    else:
        raise ValueError(f"Annuity calculation not supported for country: {country}")


def annuity_calculation_for_india(grant_date: datetime, filing_date: datetime):
    annuity_dates = []
    temp_pay_date = filing_date

    final_year = annuity_dates_for_india["annuityFinalYear"]
    first_diff = annuity_dates_for_india["eachAnnuityDifferenceFirstTime"]
    normal_diff = annuity_dates_for_india["eachAnnuityDifference"]

    annuity_final_date = add_date(filing_date, final_year["count"], final_year["type"])

    for i in range(final_year["count"]):
        if i == 0:
            temp_date = add_date(grant_date, first_diff["count"], first_diff["type"])
        else:
            last_date = annuity_dates[-1]
            temp_date = add_date(last_date, normal_diff["count"], normal_diff["type"])
            month = get_month(filing_date)
            days_and_year = get_days_and_year(temp_date, filing_date)
            temp_date = datetime.strptime(
                f"{days_and_year['years']}-{month}-{days_and_year['days']}", "%Y-%m-%d"
            )

        if is_future_date(temp_date, annuity_final_date):
            annuity_dates.append(temp_date)
        else:
            break

    return annuity_dates


def annuity_calculation_for_singapore(grant_date: datetime, filing_date: datetime):
    annuity_dates = []
    temp_pay_date = filing_date

    final_year = annuity_dates_for_singapore["annuityFinalYear"]
    first_diff = annuity_dates_for_singapore["eachAnnuityDifferenceFirstTime"]
    normal_diff = annuity_dates_for_singapore["eachAnnuityDifference"]
    after_5y_diff = annuity_dates_for_singapore["eachAnnuityDifferenceForMoreThan5Year"]

    tenure_in_years = get_date_difference_count(
        grant_date, filing_date, final_year["type"]
    )
    annuity_final_date = add_date(filing_date, final_year["count"], final_year["type"])

    if tenure_in_years >= after_5y_diff["count"]:
        for i in range(final_year["count"]):
            if i == 0:
                temp_date = add_date(
                    grant_date, first_diff["count"], first_diff["type"]
                )
            else:
                last_date = annuity_dates[-1]
                temp_date = add_date(
                    last_date, normal_diff["count"], normal_diff["type"]
                )
                month = get_month(filing_date)
                days_and_year = get_days_and_year(temp_date, filing_date)
                temp_date = datetime.strptime(
                    f"{days_and_year['years']}-{month}-{days_and_year['days']}",
                    "%Y-%m-%d",
                )

            if is_future_date(temp_date, annuity_final_date):
                annuity_dates.append(temp_date)
            else:
                break
    else:
        for i in range(final_year["count"]):
            if i == 0:
                temp_date = add_date(
                    temp_pay_date, after_5y_diff["count"], after_5y_diff["type"]
                )
            else:
                last_date = annuity_dates[-1]
                temp_date = add_date(
                    last_date, normal_diff["count"], normal_diff["type"]
                )
                month = get_month(filing_date)
                days_and_year = get_days_and_year(temp_date, filing_date)
                temp_date = datetime.strptime(
                    f"{days_and_year['years']}-{month}-{days_and_year['days']}",
                    "%Y-%m-%d",
                )

            if is_future_date(temp_date, annuity_final_date):
                annuity_dates.append(temp_date)
            else:
                break

    return annuity_dates


def annuity_calculation_for_us(grant_date: datetime, filing_date: datetime):
    annuity_dates = []

    final_year = annuity_dates_for_us["annuityFinalYear"]
    first_diff = annuity_dates_for_us["eachAnnuityDifferenceFirstTime"]
    normal_diff = annuity_dates_for_us["eachAnnuityDifference"]

    annuity_final_date = add_date(filing_date, final_year["count"], final_year["type"])

    temp_date = None
    for i in range(final_year["count"]):
        if i == 0:
            temp_date = add_date(grant_date, first_diff["count"], first_diff["type"])
        else:
            temp_date = add_date(temp_date, normal_diff["count"], normal_diff["type"])
            month = get_month(grant_date)
            days_and_year = get_days_and_year(temp_date, grant_date)
            temp_date = datetime.strptime(
                f"{days_and_year['years']}-{month}-{days_and_year['days']}", "%Y-%m-%d"
            )

        if is_future_date(temp_date, annuity_final_date):
            annuity_dates.append(temp_date)
        else:
            break

    return annuity_dates
