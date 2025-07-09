# models/pmv_prosecution_models/filing_entity_type.py

from sqlalchemy import Column, Integer, String
from sqlalchemy.orm import relationship
from models import BaseProsecution  # Shared declarative base


class FilingEntityType(BaseProsecution):
    __tablename__ = "filing_entity_type"

    # Primary key
    id = Column(Integer, primary_key=True, autoincrement=True)

    # Filing entity type string
    filing_entity_type = Column(String(255))

    # Optional: reverse mapping if Subdocket refers to this
    subdockets = relationship(
        "Subdocket",
        back_populates="filing_entity_type",
        cascade="all, delete-orphan",
        lazy="select",
    )
