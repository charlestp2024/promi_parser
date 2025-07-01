from sqlalchemy import Column, Integer, ForeignKey, TIMESTAMP
from sqlalchemy.orm import relationship
from models import BaseDrafting  # Base class for Drafting module


class DocketForeignFilingCountryMapping(BaseDrafting):
    __tablename__ = "foreign_filing_countries"

    # ---------------------- Normal Fields ----------------------
    id = Column(Integer, primary_key=True, autoincrement=True)
    created_on = Column(TIMESTAMP)
    modified_on = Column(TIMESTAMP)

    # ---------------------- Relationship Fields ----------------------
    docket_id = Column(Integer, ForeignKey("docket.id"))
    docket = relationship("Docket", back_populates="foreign_filing_countries")

    country_id = Column(Integer, ForeignKey("countries.id"))
    countries = relationship("Countries", back_populates="foreign_filing_countries")
