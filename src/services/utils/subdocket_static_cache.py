from __future__ import annotations
from typing import Dict, Any
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
_SUBDOCKET_STATUS_BY_NAME: Dict[str, Dict[str, Any]] = {}
_SUBDOCKET_ENTITY_BY_NAME: Dict[str, Dict[str, Any]] = {}
_SUBDOCKET_TYPE_BY_NAME: Dict[str, Dict[str, Any]] = {}
_SUBDOCKET_TYPE_BY_CODE: Dict[str, Dict[str, Any]] = {}

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

    _SUBDOCKET_STATUS_BY_NAME.update({
        s.name: {"id": s.id, "name": s.name}
        for s in status_list
    })

    _SUBDOCKET_ENTITY_BY_NAME.update({
        e.name: {"id": e.id, "name": e.name}
        for e in entity_list
    })

    _SUBDOCKET_TYPE_BY_NAME.update({
        t.name: {"id": t.id, "name": t.name, "code": t.code}
        for t in type_list
    })

    _SUBDOCKET_TYPE_BY_CODE.update({
        (t.code or "").upper(): {"id": t.id, "name": t.name, "code": t.code}
        for t in type_list if t.code
    })

    _LOADED = True

    logger.info("✅ Subdocket static cache initialized:")
    logger.info("    • Status: %d entries → %s", len(_SUBDOCKET_STATUS_BY_NAME), list(_SUBDOCKET_STATUS_BY_NAME.keys()))
    logger.info("    • FilingEntityType: %d entries → %s", len(_SUBDOCKET_ENTITY_BY_NAME), list(_SUBDOCKET_ENTITY_BY_NAME.keys()))
    logger.info("    • FilingType: %d entries → %s", len(_SUBDOCKET_TYPE_BY_NAME), list(_SUBDOCKET_TYPE_BY_NAME.keys()))


# --------------------------------------------------------------------------- #
# Public helpers – strict raise‑on‑miss                                        #
# --------------------------------------------------------------------------- #

def subdocket_status_by_name(name: str) -> Dict[str, Any]:
    try:
        return _SUBDOCKET_STATUS_BY_NAME[name]
    except KeyError:
        raise ValueError(f"Subdocket Status '{name}' not found in static cache")


def subdocket_status_id_by_name(name: str) -> int:
    return subdocket_status_by_name(name)["id"]


def subdocket_filing_entity_by_name(name: str) -> Dict[str, Any]:
    try:
        return _SUBDOCKET_ENTITY_BY_NAME[name]
    except KeyError:
        raise ValueError(f"Subdocket FilingEntityType '{name}' not found in static cache")


def subdocket_filing_entity_id_by_name(name: str) -> int:
    return subdocket_filing_entity_by_name(name)["id"]


def subdocket_filing_type_by_name(name: str) -> Dict[str, Any]:
    try:
        return _SUBDOCKET_TYPE_BY_NAME[name]
    except KeyError:
        raise ValueError(f"Subdocket FilingType '{name}' not found in static cache")


def subdocket_filing_type_id_by_name(name: str) -> int:
    return subdocket_filing_type_by_name(name)["id"]


def subdocket_filing_type_by_code(code: str) -> Dict[str, Any]:
    code = (code or "").strip().upper()
    try:
        return _SUBDOCKET_TYPE_BY_CODE[code]
    except KeyError:
        raise ValueError(f"Subdocket FilingType with code '{code}' not found in static cache")

def subdocket_filing_type_code_by_name(name: str) -> str:
    try:
        return _SUBDOCKET_TYPE_BY_NAME[name]["code"]
    except KeyError:
        raise ValueError(f"Subdocket FilingType '{name}' not found in static cache")



def subdocket_filing_type_id_by_code(code: str) -> int:
    return subdocket_filing_type_by_code(code)["id"]

