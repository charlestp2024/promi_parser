# models/pmv_prosecution_models/subdocket_attachment_mapping.py

from sqlalchemy import Column, Integer, String, TIMESTAMP, ForeignKey
from sqlalchemy.dialects.mysql import CHAR
from sqlalchemy.orm import relationship
from models import BaseProsecution  # Shared declarative base


class SubdocketAttachmentMapping(BaseProsecution):
    __tablename__ = "subdocket_attachment_mapping"

    # Primary key
    id = Column(Integer, primary_key=True, autoincrement=True)

    # Foreign key to Subdocket
    subdocket_id = Column(Integer, ForeignKey("subdocket.id"))
    subdocket = relationship("Subdocket", back_populates="subdocket_attachment_mapping")

    # File details
    location = Column(String(1000))
    file_name = Column(String(255))

    # Timestamps
    added_date = Column(TIMESTAMP)
    modified_date = Column(TIMESTAMP)

    # Foreign key to User (added_by)
    added_by = Column(Integer, ForeignKey("user.id"))
    user = relationship("User", back_populates="subdocket_attachment_mapping")

    # Foreign key to Client
    client_id = Column(CHAR(36), ForeignKey("client.id"))
    client = relationship("Client", back_populates="subdocket_attachment_mapping")

    # Tenant
    tenant_id = Column(CHAR(36), nullable=False)
