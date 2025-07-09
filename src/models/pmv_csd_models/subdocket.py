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

    created_on = Column(TIMESTAMP, server_default=func.now())
    modified_on = Column(TIMESTAMP, onupdate=func.now())

    appid = Column(CHAR(36), nullable=True)
    uuid = Column(CHAR(36), nullable=False)
    docket_uuid = Column(CHAR(36), nullable=False)

    archived = Column(Boolean, default=False)
    tenant_id = Column(CHAR(36))

    # ---------------- Foreign Keys & Relationships ----------------

    client_id = Column(CHAR(36), ForeignKey("client.uuid"))
    client = relationship("Client", back_populates="subdocket")

    department_id = Column(CHAR(36), ForeignKey("department.uuid"))
    department = relationship("Department", back_populates="subdocket")

    filing_entity_type_id = Column(Integer, ForeignKey("filing_entity_type.id"))

    type_of_filing_id = Column(Integer, ForeignKey("subdocket_filing_type.id"))

    status_id = Column(Integer, ForeignKey("status.id"))

    patent_office_id = Column(Integer, ForeignKey("countries.id"))

    country_of_filing_id = Column(Integer, ForeignKey("countries.id"))

    added_by = Column(CHAR(36), ForeignKey("user.uuid"))

    archived_by = Column(CHAR(36), ForeignKey("user.uuid"))

    subdocket_user_role_mappings = relationship(
        "SubdocketUserRolesMapping",
        back_populates="subdocket",
        cascade="all, delete-orphan",
    )

    subdocket_foreign_filing_country_mappings = relationship(
        "ForeignFilingCountry",
        back_populates="subdocket",
        cascade="all, delete-orphan",
    )
    