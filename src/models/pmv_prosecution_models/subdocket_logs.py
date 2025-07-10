# models/pmv_prosecution_models/subdocket_logs.py

from sqlalchemy import Column, Integer, String, TIMESTAMP, ForeignKey
from sqlalchemy.dialects.mysql import CHAR
from sqlalchemy.orm import relationship
from models import BaseProsecution  # Shared declarative base

class SubdocketLogs(BaseProsecution):
    __tablename__ = "subdocket_logs"

    # Primary key
    id = Column(Integer, primary_key=True, autoincrement=True)

    # Log operation
    operation_type = Column(String(255))

    # Timestamps
    created_on = Column(TIMESTAMP)
    modified_on = Column(TIMESTAMP)

    # Foreign key to User (created_by)
    created_by = Column(Integer, ForeignKey("user.uuid"))
    user = relationship("User", back_populates="subdocket_logs")

    # Foreign key to Subdocket
    subdocket_id = Column(Integer, ForeignKey("subdocket.id"))
    subdocket = relationship("Subdocket", back_populates="subdocket_logs")

    # Tenant ID
    tenant_id = Column(CHAR(36), nullable=False)

    # Foreign key to Client
    client_id = Column(CHAR(36), ForeignKey("client.id"))

