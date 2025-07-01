from sqlalchemy import (
    Column,
    Integer,
    String,
    Boolean,
    ForeignKey,
    TIMESTAMP,
    Enum,
    Numeric,
)
from sqlalchemy.dialects.mysql import CHAR
from sqlalchemy.orm import relationship
from models import BaseDrafting  # Base class for Drafting module
from enum import IntEnum  # for source Enum


class Docket(BaseDrafting):
    __tablename__ = "docket"

    # ---------------------- Normal Fields ----------------------
    id = Column(Integer, primary_key=True, nullable=False)
    docket_number = Column(String)
    tenant_id = Column(CHAR(36))  # UUID as string
    modified_on = Column(TIMESTAMP)
    uuid = Column(CHAR(36), nullable=False)
    title = Column(String)
    first_filing_date = Column(TIMESTAMP)
    current_status_date = Column(TIMESTAMP)
    public_disclosure_date = Column(TIMESTAMP)
    deadline_for_filing = Column(TIMESTAMP)
    temp_number = Column(Integer)
    annuity_timeline = Column(TIMESTAMP)
    filing_maintenance_cost = Column(Numeric(18, 2))
    deleted = Column(Boolean)
    foreign_license_required = Column(Boolean)
    manual_docket_number = Column(String)
    source = Column(Integer, nullable=True)
    modified_on = Column(TIMESTAMP)
    created_on = Column(TIMESTAMP)
    # ---------------------- Relationship Fields ----------------------
    client_id = Column(CHAR(36), ForeignKey("client.id"))
    client = relationship("Client", back_populates="docket")

    current_status = Column(Integer, ForeignKey("status.id"))
    status = relationship("Status", back_populates="docket")

    filing_entity_type_id = Column(Integer, ForeignKey("filing_entity_type.id"))
    filing_entity_type = relationship("FilingEntityType", back_populates="docket")

    first_filing_type_id = Column(Integer, ForeignKey("filing_type.id"))
    filing_type = relationship("FilingType", back_populates="docket")

    country_of_filing_id = Column(Integer, ForeignKey("countries.id"))
    first_filing_country = relationship("Countries", back_populates="docket")

    added_by = Column(CHAR(36), ForeignKey("user.id"))
    user = relationship("User", back_populates="docket")

    division = Column(CHAR(36), ForeignKey("client_division.id"))
    divisions = relationship("ClientDivision", back_populates="docket")

    department_id = Column(CHAR(36), ForeignKey("department.uuid"))
    department = relationship("Department", back_populates="docket")

    # ---------------------- One-to-Many Relationships ----------------------
    docket_subdocket_mapping = relationship(
        "DocketSubdocketMapping",
        back_populates="docket",
        cascade="all, delete-orphan",
        lazy="select",
    )

    foreign_filing_countries = relationship(
        "DocketForeignFilingCountryMapping",
        back_populates="docket",
        cascade="all, delete-orphan",
        lazy="select",
    )

    docket_attachment_mapping = relationship(
        "DocketAttachment",
        back_populates="docket",
        cascade="all, delete-orphan",
        lazy="select",
    )

    docketSubdocketRoles = relationship(
        "DocketSubdocketRoles",
        back_populates="docket",
        cascade="all, delete-orphan",
        lazy="select",
    )

    docket_comments = relationship(
        "DocketComments",
        back_populates="docket",
        cascade="all, delete-orphan",
        lazy="select",
    )

    docket_subdocket_stage_action = relationship(
        "DocketSubdocketStagedAction",
        back_populates="docket",
        cascade="all, delete-orphan",
        lazy="select",
    )

    logs = relationship(
        "DocketLogs",
        back_populates="docket",
        cascade="all, delete-orphan",
        lazy="select",
    )

    custom_reminders = relationship(
        "CustomReminder",
        back_populates="docket",
        cascade="all, delete-orphan",
        lazy="select",
    )


class SourceEnum(IntEnum):
    PMV_OWN = 0
    PMV_DR = 1
