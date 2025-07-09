# models/pmv_prosecution_models/filing_date_reminder_config.py

from sqlalchemy import Column, Integer, String, Boolean, Numeric
from sqlalchemy.orm import relationship
from models import BaseProsecution  # Shared declarative base


class FilingDateReminderConfig(BaseProsecution):
    __tablename__ = "filing_date_reminder_config"

    # Primary key
    id = Column(Integer, primary_key=True, autoincrement=True)

    # Configuration fields
    country = Column(String(255))
    months = Column(Numeric(10, 2))
    reminder_unique_name = Column(String(255))
    deleted = Column(Boolean, default=False)

    # One-to-many relationship
    filing_date_reminder_config_action_mapping = relationship(
        "FilingDateReminderConfigActionMapping",
        back_populates="filing_date_reminder_config",
        cascade="all, delete-orphan",
        lazy="select",
    )
