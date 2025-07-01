from dataclasses import dataclass
from typing import Optional, List
from datetime import datetime

@dataclass
class DocketDTO:
    id: int
    uuid: str
    system_generated_docket_number: str
    client_id: str
    title: str
    department_id: str
    added_by: str
    tenant_id: str
    created_on: datetime
    modified_on: datetime
    temp_number: int
    foreign_filing_countries_ids: List[int]
    inventor_ids: List[str]
    send_for_review: bool
    send_for_drafting: bool
    foreign_license_required: bool

    # ---------- Optional fields must come after required ones ----------
    manual_docket_number: Optional[str] = None
    docket_type: Optional[str] = None
    division_id: Optional[str] = None
    status_id: Optional[int] = None
    filing_entity_id: Optional[int] = None
    first_filing_date: Optional[datetime] = None
    current_status_date: Optional[datetime] = None
    annuity_timeline: Optional[datetime] = None
    deadline_for_filing: Optional[datetime] = None
    date_of_public_disclosure: Optional[datetime] = None
    patent_agent_id: Optional[str] = None
    reviewer_id: Optional[str] = None
    first_filing_country_id: Optional[int] = None
    filing_type_id: Optional[int] = None
    filing_maintenance_cost_estimate: Optional[float] = None