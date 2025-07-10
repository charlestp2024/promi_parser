# models/pmv_prosecution_models/subdocket_comments.py

from sqlalchemy import Column, Integer, String, Boolean, TIMESTAMP, ForeignKey
from sqlalchemy.dialects.mysql import CHAR
from sqlalchemy.orm import relationship
from models import BaseProsecution  # Shared declarative base

class SubdocketComments(BaseProsecution):
    __tablename__ = "subdocket_comments"

    # Primary key
    id = Column(Integer, primary_key=True, autoincrement=True)

    # Foreign key to User (added_by)
    added_by = Column(Integer, ForeignKey("user.uuid"))
    user = relationship("User", back_populates="subdocket_comments")

    # Timestamps
    added_date = Column(TIMESTAMP)
    modified_on = Column(TIMESTAMP)

    # Text comment
    comment = Column(String(1000))

    # Foreign key to Subdocket
    subdocket_id = Column(Integer, ForeignKey("subdocket.id"))
    subdocket = relationship("Subdocket", back_populates="subdocket_comments")

    # Soft delete flag
    deleted = Column(Boolean, default=False)

    # Tenant ID (UUID)
    tenant_id = Column(CHAR(36), nullable=False)

    # Foreign key to Client
    client_id = Column(CHAR(36), ForeignKey("client.id"))
    
