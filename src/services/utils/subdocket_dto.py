# In services/utils/subdocket_dto.py (or wherever your DTO is defined)

from dataclasses import dataclass, field
from datetime import date, datetime
from decimal import Decimal
from typing import Optional, List
import uuid


@dataclass
class SubdocketDTO:
    """A Data Transfer Object representing a saved Subdocket."""

    # --- Group 1: Fields WITHOUT default values (Required) ---
    id: int
    uuid: str
    docket_uuid: str
    tenant_id: str
    client_id: str
    department_id: str
    system_generated_subdocket_number: str
    docket_number: str
    country_of_filing_id: str
    created_on: datetime
    modified_on: datetime
    added_by: str

    # --- Group 2: Fields WITH default values (Optional) ---
    manual_subdocket_number: Optional[str] = None
    application_number: Optional[str] = None
    publication_number: Optional[str] = None
    status_id: Optional[int] = None
    filing_entity_type_id: Optional[int] = None
    type_of_filing_id: Optional[int] = None
    patent_office_id: Optional[str] = None
    filing_maintenance_cost_estimate: Optional[Decimal] = None

    # Dates (also optional)
    filing_date: Optional[date] = None
    publication_date: Optional[date] = None
    grant_date: Optional[date] = None
    priority_date: Optional[date] = None
    prior_filing_date: Optional[date] = None
    tentative_filing_date: Optional[date] = None
    expected_filing_year: Optional[date] = None
    recent_action_recieved_date: Optional[date] = None
    term_extention: Optional[date] = None

    # Related IDs (all have defaults)
    analyst_id: Optional[str] = None
    patent_agent_id: Optional[str] = None
    inventor_ids: List[str] = field(default_factory=list)
    assignee_ids: List[int] = field(default_factory=list)
    foreign_filing_countries_ids: List[str] = field(default_factory=list)
