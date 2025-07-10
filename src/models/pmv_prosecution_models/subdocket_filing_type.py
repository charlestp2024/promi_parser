# models/pmv_prosecution_models/subdocket_filing_type.py

from sqlalchemy import Column, Integer, String
from sqlalchemy.orm import relationship
from models import BaseProsecution  # Shared declarative base

class SubdocketFilingType(BaseProsecution):
    __tablename__ = "subdocket_filing_type"

    # Primary key
    id = Column(Integer, primary_key=True, autoincrement=True)

    # Filing type details
    filing_type = Column(String(255))
    filing_type_code = Column(String(100))

    # One-to-many relationship with Subdocket
    subdocket = relationship(
        "Subdocket",
        back_populates="subdocket_filing_type",
        cascade="all, delete-orphan",
        lazy="select"
    )
