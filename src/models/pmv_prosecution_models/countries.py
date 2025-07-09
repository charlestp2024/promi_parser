# models/pmv_prosecution_models/countries.py

from sqlalchemy import Column, Integer, String, Boolean
from sqlalchemy.orm import relationship
from models import BaseProsecution  # Shared declarative base


class Countries(BaseProsecution):
    __tablename__ = "countries"

    # Primary key
    id = Column(Integer, primary_key=True, autoincrement=True)

    # Country name and ISO code
    country_name = Column(String(255))
    country_code = Column(String(10))

    # Whether country is disabled (TINYINT in DB)
    disabled = Column(Boolean, nullable=False, default=False)

    # Relationships
    subdocket = relationship(
        "Subdocket",
        back_populates="countries",
        cascade="all, delete-orphan",
        lazy="select",
    )

    actions = relationship(
        "Actions",
        back_populates="countries",
        cascade="all, delete-orphan",
        lazy="select",
    )

    reminder_configuration = relationship(
        "ReminderConfiguration",
        back_populates="subdocket_filing_country",
        cascade="all, delete-orphan",
        lazy="select",
    )
