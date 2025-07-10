# models/pmv_prosecution_models/filing_date_reminder.py

from sqlalchemy import Column, Integer, String, Boolean, TIMESTAMP, ForeignKey
from sqlalchemy.orm import relationship
from models import BaseProsecution  # Shared declarative base


class FilingDateReminder(BaseProsecution):
    __tablename__ = "filing_date_reminder"

    # Primary key
    id = Column(Integer, primary_key=True, autoincrement=True)

    # Foreign key to subdocket
    subdocket_id = Column(Integer, ForeignKey("subdocket.id"))
    subdocket = relationship("Subdocket", back_populates="filing_date_reminders")

    # Foreign key to filing_date_reminder_config_action_mapping
    filing_date_reminder_config_action_mapping_id = Column(
        Integer, ForeignKey("filing_date_reminder_config_action_mapping.id")
    )
    filing_date_reminder_config_action_mapping = relationship(
        "FilingDateReminderConfigActionMapping", back_populates="filing_date_reminders"
    )

    # Foreign key to subdocket_stage_action
    subdocket_stage_action_id = Column(
        Integer, ForeignKey("subdocket_staged_action.id")
    )
    

    # Reminder details
    reminder_date = Column(TIMESTAMP)
    sent = Column(Boolean, default=False)
    need_to_send = Column(Boolean, default=False)
    to_address = Column(String(255))
    cc_address = Column(String(255))

    # Timestamps
    added_date = Column(TIMESTAMP)
    modifiedOn = Column(TIMESTAMP)
    sent_timestamp = Column(TIMESTAMP)
    updated_timestamp = Column(TIMESTAMP)

    # Flags
    archive = Column(Boolean, default=False)
    latest = Column(Boolean, default=False)
