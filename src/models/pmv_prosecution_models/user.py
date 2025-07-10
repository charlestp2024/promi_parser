# models/pmv_prosecution_models/user.py

from sqlalchemy import Column, String, Boolean, TIMESTAMP
from sqlalchemy.dialects.mysql import CHAR
from sqlalchemy.orm import relationship
from models import BaseProsecution  # Shared declarative base

class User(BaseProsecution):
    __tablename__ = "user"

    # Primary key
    uuid = Column(CHAR(36), primary_key=True, nullable=False)

    # Basic info
    first_name = Column(String(255))
    last_name = Column(String(255))
    email = Column(String(255))
    full_name = Column(String(255))

    # Tenant ID
    tenant_id = Column(CHAR(36), nullable=False)

    # Status flags and timestamps
    added_date = Column(TIMESTAMP)
    deleted = Column(Boolean, default=False)
    inactive = Column(Boolean, default=False)
    modified_on = Column(TIMESTAMP)

    # Relationships
    user_client_mapping = relationship(
        "UserClientMapping",
        back_populates="user",
        cascade="all, delete-orphan",
        lazy="select"
    )

    subdocket_user_roles = relationship(
        "SubdocketUserRoles",
        back_populates="user",
        cascade="all, delete-orphan",
        lazy="select"
    )

    subdocket_stage_action = relationship(
        "SubdocketStagedAction",
        back_populates="user",
        cascade="all, delete-orphan",
        lazy="select"
    )

    subdocket_comments = relationship(
        "SubdocketComments",
        back_populates="user",
        cascade="all, delete-orphan",
        lazy="select"
    )

    subdocket_logs = relationship(
        "SubdocketLogs",
        back_populates="user",
        cascade="all, delete-orphan",
        lazy="select"
    )

    custom_reminders = relationship(
        "CustomReminder",
        back_populates="user",
        cascade="all, delete-orphan",
        lazy="select"
    )

    subdocket_attachment_mapping = relationship(
        "SubdocketAttachmentMapping",
        back_populates="user",
        cascade="all, delete-orphan",
        lazy="select"
    )
    subdocket = relationship("Subdocket", back_populates="user")