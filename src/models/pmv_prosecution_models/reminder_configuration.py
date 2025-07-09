# models/pmv_prosecution_models/reminder_configuration.py

from sqlalchemy import Column, Integer, String, Numeric, ForeignKey
from sqlalchemy.orm import relationship
from models import BaseProsecution  # Shared declarative base


class ReminderConfiguration(BaseProsecution):
    __tablename__ = "reminder_config"

    # Primary key
    id = Column(Integer, primary_key=True, autoincrement=True)

    # Foreign key to Countries (filing_country)
    filing_country = Column(Integer, ForeignKey("countries.id"))
    subdocket_filing_country = relationship(
        "Countries", back_populates="reminder_configuration"
    )

    # Reminder month offsets
    first_reminder = Column(Numeric(10, 2))
    second_reminder = Column(Numeric(10, 2))
    third_reminder = Column(Numeric(10, 2))

    # Email template
    template = Column(String(1000))

    # One-to-many: Actions
    actions = relationship(
        "Actions",
        back_populates="reminder_config",
        cascade="all, delete-orphan",
        lazy="select",
    )
