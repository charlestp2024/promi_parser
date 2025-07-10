from sqlalchemy import Column, Integer, String, Text, ForeignKey, UniqueConstraint
from sqlalchemy.dialects.mysql import CHAR
from sqlalchemy.orm import relationship
from models import BaseAnnuity


class Docket(BaseAnnuity):
    __tablename__ = "docket"

    id = Column(Integer, primary_key=True, autoincrement=True)
    number = Column(String(100), nullable=False, unique=True)
    combined_grade = Column(Text, nullable=True)
    tenant_id = Column(CHAR(36), nullable=False)
    client_id = Column(CHAR(36), ForeignKey("client.uuid"), nullable=False)

    # Relationships
    casereferences = relationship("Casereference", back_populates="docket")
