# models/pmv_prosecution_models/department.py

from sqlalchemy import Column, String, ForeignKey, TIMESTAMP
from sqlalchemy.dialects.mysql import CHAR
from sqlalchemy.orm import relationship
from models import BaseProsecution  # Shared declarative base


class Department(BaseProsecution):
    __tablename__ = "department"

    # UUID primary key
    uuid = Column(CHAR(36), primary_key=True, nullable=False)

    # Department name
    department = Column(String(255))

    # Tenant ID
    tenant_id = Column(CHAR(36), nullable=False)

    # Foreign key to client
    client_id = Column(CHAR(36), ForeignKey("client.id"))
    client = relationship("Client", back_populates="departments")

    # Timestamp fields
    created_on = Column(TIMESTAMP)
    modified_on = Column(TIMESTAMP)

    # One-to-many relationship to Subdocket
    subdocket = relationship(
        "Subdocket",
        back_populates="department",
        cascade="all, delete-orphan",
        lazy="select",
    )
