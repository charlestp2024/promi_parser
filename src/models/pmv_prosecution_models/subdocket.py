# models/pmv_prosecution_models/subdocket.py

from sqlalchemy import (
    Column,
    Integer,
    String,
    Boolean,
    TIMESTAMP,
    ForeignKey,
    Enum as PgEnum,
)
from sqlalchemy.dialects.mysql import CHAR
from sqlalchemy.orm import relationship
from models import BaseProsecution
import enum


class Source(enum.Enum):
    INTERNAL = 0
    EXTERNAL = 1


class Subdocket(BaseProsecution):
    __tablename__ = "subdocket"

    id = Column(Integer, primary_key=True)
    uuid = Column(CHAR(36), nullable=False)
    docket_uuid = Column(CHAR(36), nullable=False)

    status_id = Column(Integer, ForeignKey("status.id"))
    status = relationship("Status", back_populates="subdocket")

    subdocket_number = Column(String(255))
    system_generated_subdocket_number = Column(String(255))
    docket_number = Column(String(255))

    country_of_filing = Column(Integer, ForeignKey("countries.id"))
    countries = relationship("Countries", back_populates="subdocket")

    subdocket_filing_type_id = Column(Integer, ForeignKey("subdocket_filing_type.id"))
    subdocket_filing_type = relationship(
        "SubdocketFilingType", back_populates="subdocket"
    )

    filing_entity_type_id = Column(Integer, ForeignKey("filing_entity_type.id"))
    filing_entity_type = relationship("FilingEntityType", back_populates="subdocket")

    prior_filing_year = Column(TIMESTAMP)
    filing_date = Column(TIMESTAMP)
    priority_date = Column(TIMESTAMP)
    publication_date = Column(TIMESTAMP)
    publication_number = Column(String(255))

    client_id = Column(CHAR(36), ForeignKey("client.id"))
    client = relationship("Client", back_populates="subdocket")

    added_time = Column(TIMESTAMP)
    deleted = Column(Boolean, default=False)
    application_number = Column(String(255))

    source = Column(PgEnum(Source), nullable=True)
    send_to_dca = Column(Boolean, default=False)

    department_id = Column(CHAR(36), ForeignKey("department.uuid"))
    department = relationship("Department", back_populates="subdocket")

    added_by = Column(Integer, ForeignKey("user.id"))
    user = relationship("User", back_populates="subdocket")

    tenant_id = Column(CHAR(36), nullable=False)

    modified_on = Column(TIMESTAMP)

    # Relationships
    subdocket_assignee_mapping = relationship(
        "SubdocketAssigneeMapping",
        back_populates="subdocket",
        cascade="all, delete-orphan",
        lazy="select",
    )
    subdocket_comments = relationship(
        "SubdocketComments",
        back_populates="subdocket",
        cascade="all, delete-orphan",
        lazy="select",
    )
    subdocket_user_roles = relationship(
        "SubdocketUserRoles",
        back_populates="subdocket",
        cascade="all, delete-orphan",
        lazy="select",
    )
    subdocket_stage_action = relationship(
        "SubdocketStagedAction",
        back_populates="subdocket",
        cascade="all, delete-orphan",
        lazy="select",
    )
    subdocket_attachment_mapping = relationship(
        "SubdocketAttachmentMapping",
        back_populates="subdocket",
        cascade="all, delete-orphan",
        lazy="select",
    )
    subdocket_logs = relationship(
        "SubdocketLogs",
        back_populates="subdocket",
        cascade="all, delete-orphan",
        lazy="select",
    )
    subdocket_reminder = relationship(
        "SubdocketReminder",
        back_populates="subdocket",
        cascade="all, delete-orphan",
        lazy="select",
    )
    filing_date_reminder = relationship(
        "FilingDateReminder",
        back_populates="subdocket",
        cascade="all, delete-orphan",
        lazy="select",
    )
    subdocket_checklist_additional_details = relationship(
        "SubdocketChecklistAdditionalDetail",
        back_populates="subdocket",
        cascade="all, delete-orphan",
        lazy="select",
    )
    mailing_queue = relationship(
        "MailingQueue",
        back_populates="subdocket",
        cascade="all, delete-orphan",
        lazy="select",
    )
    custom_reminder = relationship(
        "CustomReminder",
        back_populates="subdocket",
        cascade="all, delete-orphan",
        lazy="select",
    )
