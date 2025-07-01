from sqlalchemy import Column, String, Boolean, TIMESTAMP, CHAR

from sqlalchemy.orm import relationship
from models import BaseDrafting
import uuid as uuid_pkg


class User(BaseDrafting):
    __tablename__ = "user"

    # ---------------------- Columns ----------------------
    id = Column(
        CHAR(36),
        primary_key=True,
        nullable=False,
    )
    deleted = Column(Boolean, default=False)
    inactive = Column(Boolean, default=False)

    firstName = Column(String(255))
    middleName = Column(String(255))
    lastName = Column(String(255))
    fullName = Column(String(255))
    email = Column(String(255))
    contactNumber = Column(String(255))

    tenantId = Column(CHAR(36))
    createdOn = Column(TIMESTAMP)
    modifiedOn = Column(TIMESTAMP)

    # ---------------------- Relationships ----------------------
    subdocket = relationship("SubDocket", back_populates="user")
    docket_comments = relationship("DocketComments", back_populates="user")
    subdocket_comments = relationship("SubdocketComments", back_populates="user")
    subdocket_attachment_mapping = relationship(
        "SubdocketAttachmentMapping", back_populates="user"
    )
    docket = relationship("Docket", back_populates="user")
    custom_reminders = relationship("CustomReminder", back_populates="user")
    user_tenant_client_mappings = relationship(
        "UserTenantClientMapping", back_populates="user"
    )
