from sqlalchemy import Column, Integer, String, DateTime
from models import BaseDrafting  # Base class for Drafting module
from sqlalchemy.orm import relationship


class FilingType(BaseDrafting):
    __tablename__ = "filing_type"

    id = Column(Integer, primary_key=True, autoincrement=True)
    filing_type = Column(String(255))
    filing_type_code = Column(String(255))
    added_time = Column(DateTime, name="created_on")
    modified_time = Column(DateTime, name="modified_on")

    # Relationship to Docket
    docket = relationship(
        "Docket",
        back_populates="filing_type",
        cascade="all, delete-orphan",
        lazy="select",
    )
