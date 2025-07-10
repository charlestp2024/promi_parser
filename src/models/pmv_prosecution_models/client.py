# models/pmv_prosecution_models/client.py

from sqlalchemy import Column, String, Integer, TIMESTAMP
from sqlalchemy.orm import relationship
from sqlalchemy.dialects.mysql import CHAR
from models import BaseProsecution  # Shared declarative base


class Client(BaseProsecution):
    __tablename__ = "client"

    # UUID primary key (VARCHAR(255) in DB, CHAR(36) for standard UUID format)
    id = Column(CHAR(36), primary_key=True, nullable=False)

    client_name = Column(String(255))
    client_code = Column(Integer)
    email = Column(String(255))

    # Tenant UUID
    tenant_id = Column(CHAR(36), nullable=False)

    created_on = Column(TIMESTAMP)
    modified_on = Column(TIMESTAMP)

    departments = relationship("Department", back_populates="client")
    subdocket = relationship("Subdocket", back_populates="client")
    user_client_mapping = relationship(
    "UserClientMapping",
    back_populates="client",
    cascade="all, delete-orphan",
    lazy="select"
)