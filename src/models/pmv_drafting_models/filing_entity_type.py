from sqlalchemy import Column, Integer, String, TIMESTAMP
from models import BaseDrafting  # Base class for Drafting module
from sqlalchemy.orm import relationship


class FilingEntityType(BaseDrafting):
    __tablename__ = "filing_entity_type"

    # ---------------------- Normal Fields ----------------------
    id = Column(Integer, primary_key=True, autoincrement=True)
    filing_entity_type = Column(String)
    added_time = Column(TIMESTAMP)
    modified_time = Column(TIMESTAMP)

    docket = relationship(
        "Docket", back_populates="filing_entity_type", cascade="all, delete-orphan"
    )

    subdocket = relationship(
        "SubDocket", back_populates="filing_entity_type", cascade="all, delete-orphan"
    )
