# models/pmv_prosecution_models/user_client_mapping.py

from sqlalchemy import Column, Integer, Boolean, ForeignKey
from sqlalchemy.dialects.mysql import CHAR
from sqlalchemy.orm import relationship
from models import BaseProsecution  # Shared declarative base

class UserClientMapping(BaseProsecution):
    __tablename__ = "user_tenant_client_mapping"

    # Primary key
    id = Column(Integer, primary_key=True, autoincrement=True)

    # Foreign key to User
    user_id = Column(CHAR(36), ForeignKey("user.uuid"))
    user = relationship("User", back_populates="user_client_mapping")

    # Foreign key to Client
    client_id = Column(CHAR(36), ForeignKey("client.id"))
    client = relationship("Client", back_populates="user_client_mapping")

    # Tenant
    tenant_id = Column(CHAR(36), nullable=False)

    # Active flag
    active = Column(Boolean, default=True)
