"""
services/static_cache.py
Loads static lookup tables into memory at start‑up.

Call `preload_all(session)` once, passing any active SQLAlchemy Session.
After that you can do:

    status = status_by_name("Open")
    filing_entity = filing_entity_by_name("Small")
    country = country_by_name("India")

Strict mode: each helper raises ValueError if the key is not found.
"""

from __future__ import annotations
from typing import Dict

from sqlalchemy.orm import Session

from models.invention_disclosure_models.status import Status
from models.invention_disclosure_models.filing_entity_type import FilingEntityType
from models.invention_disclosure_models.filing_type import FilingType
from models.invention_disclosure_models.country import Countries
from models.invention_disclosure_models.role import Role
import logging

logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

# --------------------------------------------------------------------------- #
# Internal storage                                                             #
# --------------------------------------------------------------------------- #
_STATUS_BY_NAME: Dict[str, Status] = {}
_FILING_ENTITY_BY_NAME: Dict[str, FilingEntityType] = {}
_FILING_TYPE_BY_NAME: Dict[str, FilingType] = {}
_COUNTRY_BY_NAME: Dict[str, Countries] = {}

_role_map: dict[str, Role] = {}
_LOADED = False


# --------------------------------------------------------------------------- #
# Pre‑loader                                                                   #
# --------------------------------------------------------------------------- #


def preload_all(session: Session) -> None:
    """Fetch all static rows once; idempotent."""
    global _LOADED
    if _LOADED:
        logger.debug("Static cache already initialized. Skipping reload.")
        return

    status_list = session.query(Status).all()
    filing_entity_list = session.query(FilingEntityType).all()
    filing_type_list = session.query(FilingType).all()
    country_list = session.query(Countries).all()
    global _role_map
    _role_map = {r.role: r for r in session.query(Role).all()}
    logger.info("    • %d Role entries loaded", len(_role_map))

    _STATUS_BY_NAME.update({s.status: s for s in status_list})
    _FILING_ENTITY_BY_NAME.update({f.name: f for f in filing_entity_list})
    _FILING_TYPE_BY_NAME.update({f.name: f for f in filing_type_list})
    _COUNTRY_BY_NAME.update({c.name: c for c in country_list})

    _LOADED = True

    logger.info("✅ Static cache initialized:")
    logger.info(
        "    • Status: %d entries → %s",
        len(_STATUS_BY_NAME),
        list(_STATUS_BY_NAME.keys()),
    )
    logger.info(
        "    • FilingEntityType: %d entries → %s",
        len(_FILING_ENTITY_BY_NAME),
        list(_FILING_ENTITY_BY_NAME.keys()),
    )
    logger.info(
        "    • FilingType: %d entries → %s",
        len(_FILING_TYPE_BY_NAME),
        list(_FILING_TYPE_BY_NAME.keys()),
    )
    logger.info(
        "    • Countries: %d entries → %s",
        len(_COUNTRY_BY_NAME),
        list(_COUNTRY_BY_NAME.keys()),
    )


# --------------------------------------------------------------------------- #
# Public helpers – strict raise‑on‑miss                                        #
# --------------------------------------------------------------------------- #
def status_by_name(name: str) -> Status:
    try:
        return _STATUS_BY_NAME[name]
    except KeyError:
        raise ValueError(f"Status '{name}' not found in static cache")


def filing_entity_by_name(name: str) -> FilingEntityType:
    try:
        return _FILING_ENTITY_BY_NAME[name]
    except KeyError:
        raise ValueError(f"FilingEntityType '{name}' not found in static cache")


def filing_type_by_name(name: str) -> FilingType:
    try:
        return _FILING_TYPE_BY_NAME[name]
    except KeyError:
        raise ValueError(f"FilingType '{name}' not found in static cache")


def country_by_name(name: str) -> Countries:
    """
    Return Countries row given either:
        • full country name  (e.g. "Canada")
        • two‑letter code    (e.g. "CA")
    Raises ValueError if not found in either form.
    """
    # 1) exact name match (fast path)
    if name in _COUNTRY_BY_NAME:
        return _COUNTRY_BY_NAME[name]

    # 2) try code match (case‑insensitive)
    code = (name or "").strip().upper()
    for country in _COUNTRY_BY_NAME.values():
        if country.code and country.code.upper() == code:
            return country

    # 3) still not found
    raise ValueError(f"Country '{name}' not found in static cache (name or code)")


def preload_roles(session: Session):
    global _role_map
    _role_map = {r.name: r for r in session.query(Role).all()}
    logger.info("    • %d Role entries loaded", len(_role_map))


def role_by_name(name: str) -> Role | None:
    return _role_map.get(name)
