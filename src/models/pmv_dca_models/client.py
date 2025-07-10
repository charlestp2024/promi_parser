from sqlalchemy import Column, String, Integer, Boolean, Index
from sqlalchemy.dialects.mysql import CHAR
from sqlalchemy.orm import relationship
from models import BaseAnnuity


class Client(BaseAnnuity):
    __tablename__ = "client"

    uuid = Column(CHAR(36), primary_key=True)
    client_name = Column(String(50), nullable=False)
    client_code = Column(Integer, nullable=False)
    is_active = Column(Boolean, default=True)
    tenant_id = Column(CHAR(36), nullable=False)

    # Relationships
    casereferences = relationship("Casereference", back_populates="client")

    # Indexes
    __table_args__ = (
        Index("client_name", "client_name", unique=True),
        Index("client_code", "client_code", unique=True),
    )
