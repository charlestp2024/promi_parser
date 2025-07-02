from sqlalchemy import (
    Column,
    Integer,
    String,
    Boolean,
    ForeignKey,
    TIMESTAMP,
    Numeric,
)
from sqlalchemy.dialects.mysql import CHAR
from sqlalchemy.orm import relationship
from sqlalchemy.sql import func
from models import BaseCsd


class Subdocket(BaseCsd):
    __tablename__ = "subdocket"

    id = Column(Integer, primary_key=True, autoincrement=True)
    temp_number = Column(Integer)
    docket_number = Column(String)
    system_generated_subdocket_number = Column(String)

    manual_subdocket_number = Column(String)
    publication_number = Column(String)
    application_number = Column(String)

    filing_maintenance_cost_estimate = Column(Numeric(18, 2))

    tentative_filing_date = Column(TIMESTAMP)
    prior_filing_date = Column(TIMESTAMP)
    priority_date = Column(TIMESTAMP)
    filing_date = Column(TIMESTAMP)
    publication_date = Column(TIMESTAMP)
    grant_date = Column(TIMESTAMP)
    expected_filing_year = Column(TIMESTAMP)
    recent_action_recieved_date = Column(TIMESTAMP)
    term_extention = Column(TIMESTAMP)

    added_date = Column(TIMESTAMP, server_default=func.now())
    modified_on = Column(TIMESTAMP, onupdate=func.now())

    appid = Column(CHAR(36), nullable=True)
    uuid = Column(CHAR(36), nullable=False)
    docket_uuid = Column(CHAR(36), nullable=False)

    archived = Column(Boolean, default=False)
    tenant_id = Column(CHAR(36))

    # ---------------- Foreign Keys & Relationships ----------------

    client_id = Column(CHAR(36), ForeignKey("client.id"))
    client = relationship("Client", back_populates="subdockets")

    department_id = Column(CHAR(36), ForeignKey("department.id"))
    department = relationship("Department", back_populates="subdockets")

    filing_entity_type_id = Column(Integer, ForeignKey("filing_entity_type.id"))
    filing_entity_type = relationship("FilingEntityType", back_populates="subdockets")

    type_of_filing_id = Column(Integer, ForeignKey("filing_type.id"))
    filing_type = relationship("FilingType", back_populates="subdockets")

    status_id = Column(Integer, ForeignKey("status.id"))
    status = relationship("Status", back_populates="subdockets")

    patent_office_id = Column(Integer, ForeignKey("countries.id"))
    patent_office = relationship("Countries", back_populates="patent_office_subdockets")

    country_of_filing_id = Column(Integer, ForeignKey("countries.id"))
    country_of_filing = relationship("Countries", back_populates="filing_country_subdockets")

    added_by = Column(CHAR(36), ForeignKey("user.id"))
    added_by_user = relationship("User", foreign_keys=[added_by], back_populates="subdockets_added")

    archived_by = Column(CHAR(36), ForeignKey("user.id"))
    archived_by_user = relationship("User", foreign_keys=[archived_by], back_populates="subdockets_archived")
