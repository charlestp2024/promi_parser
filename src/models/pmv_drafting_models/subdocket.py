from sqlalchemy import (
    Column,
    Integer,
    String,
    ForeignKey,
    Boolean,
    TIMESTAMP,
    Numeric,
)
from sqlalchemy.dialects.mysql import CHAR
from sqlalchemy.orm import relationship
from models import BaseDrafting


class SubDocket(BaseDrafting):
    __tablename__ = "subdocket"

    # ---------------------- Normal Fields ----------------------
    id = Column(Integer, primary_key=True, nullable=False, unique=True)
    uuid = Column(CHAR(36), nullable=False)
    docket_uuid = Column(CHAR(36), nullable=False)
    subdocket_number = Column(String)
    expected_filing_year = Column(TIMESTAMP)
    prior_filing_year = Column(TIMESTAMP)
    filing_date = Column(TIMESTAMP)
    priority_date = Column(TIMESTAMP)
    office_action_recieved_date = Column(TIMESTAMP)
    publication_date = Column(TIMESTAMP)
    publication_number = Column(String)
    grant_date = Column(TIMESTAMP)
    term_extension = Column(TIMESTAMP)
    filing_maintenance_cost = Column(Numeric(18, 2))
    added_time = Column(TIMESTAMP)
    priorityOfFiling = Column(Boolean)
    deleted = Column(Boolean)
    application_number = Column(String)
    tentative_filing_date = Column(TIMESTAMP)
    prosecution = Column(Boolean)
    prosecutionSubdocketLink = Column(String)
    tenantId = Column(CHAR(36))
    modifiedOn = Column(TIMESTAMP)
    manual_subdocket_number = Column(String)

    # ---------------------- Foreign Keys ----------------------
    country_id = Column(Integer, ForeignKey("countries.id"))
    countries = relationship("Countries", back_populates="subdocket")

    subdocket_filing_type_id = Column(Integer, ForeignKey("subdocket_filing_type.id"))
    subdocket_filing_type = relationship(
        "SubdocketFilingType", back_populates="subdocket"
    )

    filing_entity_type_id = Column(Integer, ForeignKey("filing_entity_type.id"))
    filing_entity_type = relationship("FilingEntityType", back_populates="subdocket")

    status_id = Column(Integer, ForeignKey("status.id"))
    status = relationship("Status", back_populates="subdocket")

    client_id = Column(CHAR(36), ForeignKey("client.id"))
    client = relationship("Client", back_populates="subdocket")

    added_by = Column(CHAR(36), ForeignKey("user.id"))
    user = relationship("User", back_populates="subdocket")

    # ---------------------- Relationship Fields ----------------------
    docket_subdocket_mapping = relationship(
        "DocketSubdocketMapping",
        back_populates="subdocket",
        cascade="all, delete-orphan",
    )
    subdocket_assignee_mapping = relationship(
        "SubdocketAssigneeMapping",
        back_populates="subdocket",
        cascade="all, delete-orphan",
    )
    subdocketForeignFilingCountryMapping = relationship(
        "SubdocketForeignFilingCountryMapping",
        back_populates="subdocket",
        cascade="all, delete-orphan",
    )
    subdocket_comments = relationship(
        "SubdocketComments", back_populates="subdocket", cascade="all, delete-orphan"
    )
    docketSubdocketRoles = relationship(
        "DocketSubdocketRoles", back_populates="subdocket", cascade="all, delete-orphan"
    )
    docket_subdocket_stage_action = relationship(
        "DocketSubdocketStagedAction",
        back_populates="subdocket",
        cascade="all, delete-orphan",
    )
    subdocket_attachment_mapping = relationship(
        "SubdocketAttachmentMapping",
        back_populates="subdocket",
        cascade="all, delete-orphan",
    )
    subdocketReminder = relationship(
        "SubdocketReminder", back_populates="subdocket", cascade="all, delete-orphan"
    )
    subdocket_logs = relationship(
        "SubdocketLogs", back_populates="subdocket", cascade="all, delete-orphan"
    )
    custom_reminders = relationship(
        "CustomReminder", back_populates="subdocket", cascade="all, delete-orphan"
    )
