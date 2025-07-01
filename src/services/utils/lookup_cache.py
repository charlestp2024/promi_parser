"""
lookup_cache.py
Loads user_map.json and client_hierarchy_map.json once at import‑time
and exposes fast in‑memory lookup helpers.
"""

from __future__ import annotations
import json
from pathlib import Path
from typing import Dict

# ------- File locations (adjust as you like) -------
DATA_DIR = Path(__file__).resolve().parent / "data"
USER_MAP_FILE = DATA_DIR / "users_map.json"
CLIENT_HIER_FILE = DATA_DIR / "client_hierarchy_map.json"

# ------- Load JSON ------
with USER_MAP_FILE.open() as f:
    _USER_MAP: Dict[str, str] = json.load(f)  # name  →  UUID

with CLIENT_HIER_FILE.open() as f:
    _CLIENT_HIER = json.load(f)  # nested dict structure


# -----------------------------------------------------------------
# Public lookup helpers
# -----------------------------------------------------------------


def uuid_for_user_name(name: str) -> str | None:
    """Return UUID for exact‑match user name (case‑sensitive)."""
    return _USER_MAP.get(name)


def client_entry(client_name: str) -> dict | None:
    """Return the whole client dict (uuid, departments, divisions) or None."""
    return _CLIENT_HIER.get(client_name)


def uuid_for_department(client_name: str, dept_name: str) -> str | None:
    entry = client_entry(client_name)
    if not entry:
        return None
    return entry["departments"].get(dept_name)


def uuid_for_division(client_name: str, div_name: str) -> str | None:
    entry = client_entry(client_name)
    if not entry:
        return None
    return entry["divisions"].get(div_name)
