"""
services/subdocket_static_cache.py
Loads static lookup tables for Subdocket into memory at start‑up.

Call `preload_all(session)` once, passing any active SQLAlchemy Session.
After that you can do:

    status = subdocket_status_by_name("Active")
    entity = subdocket_filing_entity_by_name("Small")
    filing_type = subdocket_filing_type_by_name("Provisional")

Strict mode: each helper raises ValueError if the key is not found.
"""

from __future__ import annotations
from typing import Dict
from sqlalchemy.orm import Session
import logging

# Import subdocket models
from models.pmv_csd_models.status import Status as SubdocketStatus
from models.pmv_csd_models.filing_entity_type import (
    FilingEntityType as SubdocketFilingEntityType,
)
from models.pmv_csd_models.filing_type import FilingType

logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

# --------------------------------------------------------------------------- #
# Internal storage                                                             #
# --------------------------------------------------------------------------- #
_SUBDOCKET_STATUS_BY_NAME: Dict[str, SubdocketStatus] = {}
_SUBDOCKET_ENTITY_BY_NAME: Dict[str, SubdocketFilingEntityType] = {}
_SUBDOCKET_TYPE_BY_NAME: Dict[str, FilingType] = {}

_LOADED = False

# --------------------------------------------------------------------------- #
# Pre‑loader                                                                   #
# --------------------------------------------------------------------------- #


def preload_all_subdocket_cache(session: Session) -> None:
    """Fetch all static rows once; idempotent."""
    global _LOADED
    if _LOADED:
        logger.debug("Subdocket static cache already initialized. Skipping reload.")
        return

    status_list = session.query(SubdocketStatus).all()
    entity_list = session.query(SubdocketFilingEntityType).all()
    type_list = session.query(FilingType).all()

    _SUBDOCKET_STATUS_BY_NAME.update({s.name: s for s in status_list})
    _SUBDOCKET_ENTITY_BY_NAME.update({e.name: e for e in entity_list})
    _SUBDOCKET_TYPE_BY_NAME.update({t.name: t for t in type_list})

    _LOADED = True

    logger.info("✅ Subdocket static cache initialized:")
    logger.info(
        "    • Status: %d entries → %s",
        len(_SUBDOCKET_STATUS_BY_NAME),
        list(_SUBDOCKET_STATUS_BY_NAME.keys()),
    )
    logger.info(
        "    • FilingEntityType: %d entries → %s",
        len(_SUBDOCKET_ENTITY_BY_NAME),
        list(_SUBDOCKET_ENTITY_BY_NAME.keys()),
    )
    logger.info(
        "    • FilingType: %d entries → %s",
        len(_SUBDOCKET_TYPE_BY_NAME),
        list(_SUBDOCKET_TYPE_BY_NAME.keys()),
    )


# --------------------------------------------------------------------------- #
# Public helpers – strict raise‑on‑miss                                        #
# --------------------------------------------------------------------------- #


def subdocket_status_by_name(name: str) -> SubdocketStatus:
    try:
        return _SUBDOCKET_STATUS_BY_NAME[name]
    except KeyError:
        raise ValueError(f"Subdocket Status '{name}' not found in static cache")


def subdocket_filing_entity_by_name(name: str) -> SubdocketFilingEntityType:
    try:
        return _SUBDOCKET_ENTITY_BY_NAME[name]
    except KeyError:
        raise ValueError(
            f"Subdocket FilingEntityType '{name}' not found in static cache"
        )


def subdocket_filing_type_by_name(name: str) -> FilingType:
    try:
        return _SUBDOCKET_TYPE_BY_NAME[name]
    except KeyError:
        raise ValueError(f"Subdocket FilingType '{name}' not found in static cache")


def subdocket_filing_type_by_code(code: str) -> FilingType:
    """Case-insensitive lookup by code"""
    code = (code or "").strip().upper()
    for filing_type in _SUBDOCKET_TYPE_BY_NAME.values():
        if filing_type.code and filing_type.code.upper() == code:
            return filing_type
    raise ValueError(
        f"Subdocket FilingType with code '{code}' not found in static cache"
    )
