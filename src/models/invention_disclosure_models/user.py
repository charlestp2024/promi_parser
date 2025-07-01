import uuid
from datetime import datetime

from sqlalchemy import (
    Column,
    String,
    Boolean,
    DateTime,
    ForeignKey,
)
from sqlalchemy.dialects.mysql import CHAR
from sqlalchemy.orm import relationship
from sqlalchemy.sql import func

from models.base import BaseInvd


class User(BaseInvd):
    __tablename__ = "user"

    # ---------- Columns ----------
    uuid = Column(
        CHAR(36),
        primary_key=True,
        default=lambda: str(uuid.uuid4()),
        nullable=False,
    )

    first_name = Column(String(255))
    last_name = Column(String(255))
    full_name = Column(String(511))

    tenant_id = Column(CHAR(36), nullable=False)

    address = Column(String(500))
    contact = Column(String(100))
    email = Column(String(255))

    deleted = Column(Boolean, default=False)
    inactive = Column(Boolean, default=False)

    created_on = Column(
        DateTime(timezone=True),
        server_default=func.now(),
        nullable=False,
    )
    modified_on = Column(
        DateTime(timezone=True),
        onupdate=func.now(),
    )

    # ---------- Relationships ----------
    # 1) Dockets where this user is the "added_by"
    dockets_added = relationship(
        "Docket",
        foreign_keys="Docket.added_by",
        back_populates="user",  # property defined in Docket
        lazy="select",
    )

    # 2) Dockets where this user is the "archived_by"
    dockets_archived = relationship(
        "Docket",
        foreign_keys="Docket.archived_by",
        back_populates="archived_by_user",
        lazy="select",
    )

    # 3) User–Role mappings
    docket_user_role = relationship(
        "DocketUserRoleMapping",
        back_populates="user",
        cascade="all, delete-orphan",
        lazy="select",
    )

    # 4) File attachments uploaded by this user
    docket_attachment_mapping = relationship(
        "DocketAttachmentMapping",
        back_populates="user",
        cascade="all, delete-orphan",
        lazy="select",
    )

    # 5) Optional: client associations
    user_client_mapping = relationship(
        "UserClientMapping",
        back_populates="user",
        cascade="all, delete-orphan",
        lazy="select",
    )

    # ---------- Convenience ----------
    def __repr__(self) -> str:
        return (
            f"<User(uuid={self.uuid}, full_name={self.full_name}, email={self.email})>"
        )
