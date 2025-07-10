from sqlalchemy import Column, String, ForeignKey
from sqlalchemy.dialects.mysql import CHAR
from sqlalchemy.orm import relationship
from models import BaseAnnuity


class Department(BaseAnnuity):
    __tablename__ = "department"

    uuid = Column(CHAR(36), primary_key=True)
    department = Column(String(300), nullable=False)
    tenant_id = Column(CHAR(36), nullable=False)
    client_id = Column(CHAR(36), ForeignKey("client.uuid"), nullable=False)

    # Relationships
    casereferences = relationship("Casereference", back_populates="department")
