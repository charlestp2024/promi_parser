from sqlalchemy import Column, Integer, ForeignKey, TIMESTAMP
from sqlalchemy.orm import relationship
from models import BaseCsd  # Base class for Centralized Subdocket


class ForeignFilingCountry(BaseCsd):
    __tablename__ = "foreign_filing_countries"

    # ---------------------- Normal Fields ----------------------
    id = Column(Integer, primary_key=True, autoincrement=True)
    created_on = Column(TIMESTAMP)
    modified_on = Column(TIMESTAMP)

    # ---------------------- Foreign Keys & Relationships ----------------------
    subdocket_id = Column(Integer, ForeignKey("subdocket.id"))

    country_id = Column(Integer, ForeignKey("countries.id"))

    added_by = Column(Integer, ForeignKey("user.uuid"))
    subdocket = relationship(
        "Subdocket", back_populates="subdocket_foreign_filing_country_mappings"
    )
