from datetime import datetime, timedelta
from dateutil.relativedelta import relativedelta


def add_date(base_date: datetime, count: float, unit: str) -> datetime:
    """
    Add a given count of years, months, or days to the base_date.
    Supports float values for partial years/months.
    """
    if unit.lower() == "years":
        years = int(count)
        months = round((count - years) * 12)
        return base_date + relativedelta(years=years, months=months)
    elif unit.lower() == "months":
        return base_date + relativedelta(months=int(count))
    elif unit.lower() == "days":
        return base_date + timedelta(days=int(count))
    else:
        raise ValueError(f"Unsupported unit: {unit}")


def is_future_date(date1: datetime, date2: datetime) -> bool:
    """
    Returns True if date2 is before date1.
    """
    return date2 <= date1


def is_past_date(date: datetime) -> bool:
    """
    Check if the given date is in the past.
    """
    return date < datetime.today()


def get_date_difference_count(date1: datetime, date2: datetime, unit: str) -> float:
    """
    Returns the difference between two dates in years, months, or days.
    """
    delta = relativedelta(date1, date2)
    if unit.lower() == "years":
        return delta.years + delta.months / 12 + delta.days / 365.0
    elif unit.lower() == "months":
        return delta.years * 12 + delta.months + delta.days / 30.0
    elif unit.lower() == "days":
        return abs((date1 - date2).days)
    else:
        raise ValueError(f"Unsupported unit: {unit}")


def get_month(date: datetime) -> str:
    """
    Return zero-padded month from a date (e.g., '04').
    """
    return f"{date.month:02d}"


def get_days_and_year(target_date: datetime, base_date: datetime) -> dict:
    """
    Given a target_date and base_date, return the day and year from base_date.
    E.g., base_date = 2015-07-12, target_date = 2023-09-20 => {'days': 12, 'years': 2023}
    """
    return {"days": base_date.day, "years": target_date.year}


def get_yyyymmdd_date(date: datetime) -> str:
    """
    Return a date in 'YYYY-MM-DD' format.
    """
    return date.strftime("%Y-%m-%d")
