# models/pmv_prosecution_models/filing_date_reminder_config_action_mapping.py

from sqlalchemy import Column, Integer, ForeignKey, TIMESTAMP
from sqlalchemy.orm import relationship
from models import BaseProsecution  # Shared declarative base


class FilingDateReminderConfigActionMapping(BaseProsecution):
    __tablename__ = "filing_date_reminder_config_action_mapping"

    # Primary key
    id = Column(Integer, primary_key=True, autoincrement=True)

    # Foreign key to FilingDateReminderConfig
    filing_date_reminder_config_id = Column(
        Integer, ForeignKey("filing_date_reminder_config.id")
    )
    filing_date_reminder_config = relationship(
        "FilingDateReminderConfig",
        back_populates="filing_date_reminder_config_action_mapping",
    )

    # Foreign key to Actions
    action_id = Column(Integer, ForeignKey("actions.id"))
    actions = relationship(
        "Actions", back_populates="filing_date_reminder_config_action_mapping"
    )

    # Timestamps
    created_on = Column(TIMESTAMP)
    modified_on = Column(TIMESTAMP)

    # Reverse relationship to FilingDateReminder (optional but useful)
    filing_date_reminders = relationship(
        "FilingDateReminder",
        back_populates="filing_date_reminder_config_action_mapping",
        cascade="all, delete-orphan",
        lazy="select",
    )
