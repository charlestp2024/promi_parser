"""
parser_helpers.py
Helpers to support Excel → DB conversion (no DB access here).
"""

import re
import pandas as pd

from typing import Any, Dict
from excel.ExcelData import ExcelColumns

# --------------------------------------------------------------------------- #
# Canonical column mapping setup                                              #
# --------------------------------------------------------------------------- #

COLS = ExcelColumns()

COLUMN_ALIASES: Dict[str, str] = {
    getattr(COLS, field): getattr(COLS, field) for field in COLS.__annotations__
}
COLUMN_ALIASES = {k.lower(): v for k, v in COLUMN_ALIASES.items()}


def normalise_columns(df: pd.DataFrame, alias_map: Dict[str, str] | None = None) -> None:
    """
    Rename DataFrame columns in‑place using alias map.
    Handles non‑string column labels safely.
    """
    if alias_map is None:
        alias_map = COLUMN_ALIASES

    df.rename(
        columns={
            c: alias_map.get(str(c).strip().lower(), c)   # <- wrap with str(...)
            for c in df.columns
        },
        inplace=True,
    )



# --------------------------------------------------------------------------- #
# Parsers                                                                     #
# --------------------------------------------------------------------------- #


def parse_date(val: str):
    ts = pd.to_datetime(val, errors="coerce") if val else None
    return None if ts is pd.NaT else ts


def parse_decimal(val: str):
    if not val:
        return None
    try:
        return float(str(val).replace(",", "").strip())
    except ValueError as err:
        raise ValueError(f"Cannot parse decimal: {val!r}") from err


def parse_bool(val: str) -> bool:
    return str(val).strip().lower()[:1] in {"y", "1", "t"}


def split_multi(val: str):
    if not val:
        return []
    return [p.strip() for p in re.split(r",|;", val) if p.strip()]
