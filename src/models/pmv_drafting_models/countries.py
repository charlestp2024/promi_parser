from sqlalchemy import Column, Integer, String, TIMESTAMP
from sqlalchemy.orm import relationship
from models import BaseDrafting  # Base class for Drafting module


class Countries(BaseDrafting):
    __tablename__ = "countries"

    # ---------------------- Normal Fields ----------------------
    id = Column(Integer, primary_key=True, autoincrement=True)
    countries = Column(String)
    country_code = Column(String)
    created_on = Column(TIMESTAMP)
    modified_on = Column(TIMESTAMP)

    # ---------------------- Relationship Fields ----------------------
    subdocket = relationship(
        "SubDocket",
        back_populates="countries",
        cascade="all, delete-orphan",
        lazy="select",
    )

    foreign_filing_countries = relationship(
        "DocketForeignFilingCountryMapping",
        back_populates="countries",
        cascade="all, delete-orphan",
        lazy="select",
    )

    reminderConfiguration = relationship(
        "ReminderConfiguration",
        back_populates="subdocket_filing_country",
        cascade="all, delete-orphan",
        lazy="select",
    )
    docket = relationship(
        "Docket",
        back_populates="first_filing_country",
        cascade="all, delete-orphan",
        lazy="select",
    )
