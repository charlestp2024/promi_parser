from sqlalchemy import (
    Column, Integer, String, Boolean, TIMESTAMP, ForeignKey, Text
)
from sqlalchemy.dialects.mysql import CHAR, JSON
from sqlalchemy.orm import relationship
from models import BaseCsd


class PartialSubdocket(BaseCsd):
    __tablename__ = "partial_subdocket"

    id = Column(Integer, primary_key=True, autoincrement=True)

    docket_number = Column(String)
    manual_subdocket_number = Column(String)

    client_id = Column(CHAR(36))
    country_of_filing_id = Column(Integer)
    type_of_filing_id = Column(Integer)

    application_number = Column(String)
    department_id = Column(CHAR(36))

    type_of_filing_entity_id = Column(Integer)
    foreign_filing_countries = Column(JSON)

    patent_office_id = Column(Integer)
    status_id = Column(Integer)

    publication_number = Column(String)
    filing_maintenance_cost = Column(String)

    analyst_id = Column(CHAR(36))
    inventors_ids = Column(JSON)
    asignee_json = Column(JSON)

    patent_agent_id = Column(CHAR(36))
    expected_filing_year = Column(TIMESTAMP)
    prior_filing_date = Column(TIMESTAMP)
    tentative_filing_date = Column(TIMESTAMP)
    priority_date = Column(TIMESTAMP)
    filing_date = Column(TIMESTAMP)
    recent_action_recieved_date = Column(TIMESTAMP)
    term_extention = Column(TIMESTAMP)
    created_on = Column(TIMESTAMP)
    modified_on = Column(TIMESTAMP)

    publication_date = Column(TIMESTAMP)
    grant_date = Column(TIMESTAMP)

    docket_uuid = Column(CHAR(36))
    app_uuid = Column(CHAR(36))

    system_generated_subdocket = Column(Boolean)
    deleted = Column(Boolean)

    docket_id = Column(Integer)
    tenant_id = Column(CHAR(36))

    # ---------------------- Relationships ----------------------
    added_by_id = Column(CHAR(36), ForeignKey("user.id"))
    added_by = relationship("User", foreign_keys=[added_by_id], lazy="select")

    modified_by_id = Column(CHAR(36), ForeignKey("user.id"))
    modified_by = relationship("User", foreign_keys=[modified_by_id], lazy="select")
