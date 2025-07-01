from sqlalchemy import Column, Integer, ForeignKey, TIMESTAMP
from sqlalchemy.orm import relationship
from models import BaseDrafting


class SubdocketForeignFilingCountryMapping(BaseDrafting):
    __tablename__ = "subdocket_foreign_filing_country"

    # ---------------------- Normal Fields ----------------------
    id = Column(Integer, primary_key=True, autoincrement=True)
    added_date = Column(TIMESTAMP)
    modified_date = Column(TIMESTAMP)

    # ---------------------- Relationships ----------------------
    subdocket_id = Column(Integer, ForeignKey("subdocket.id"))
    subdocket = relationship(
        "SubDocket", back_populates="subdocketForeignFilingCountryMapping"
    )

    countries_id = Column(Integer, ForeignKey("countries.id"))
