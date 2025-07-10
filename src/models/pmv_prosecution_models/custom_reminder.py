# models/pmv_prosecution_models/custom_reminder.py

from sqlalchemy import Column, Integer, String, Boolean, TIMESTAMP, ForeignKey
from sqlalchemy.dialects.mysql import CHAR
from sqlalchemy.orm import relationship
from models import BaseProsecution  # Shared declarative base


class CustomReminder(BaseProsecution):
    __tablename__ = "custom_reminder"

    # Primary key
    id = Column(Integer, primary_key=True, autoincrement=True)

    # Reminder details
    next_reminder = Column(TIMESTAMP)
    sent = Column(Boolean, default=False)
    archive = Column(Boolean, default=False)
    sent_timestamp = Column(TIMESTAMP)
    title = Column(String(255))
    cc_address = Column(String(255))

    # Timestamp tracking
    created_on = Column(TIMESTAMP)
    modified_on = Column(TIMESTAMP)

    # Foreign key to subdocket
    subdocket_id = Column(Integer, ForeignKey("subdocket.id"))
    subdocket = relationship("Subdocket", back_populates="custom_reminders")

    # Foreign key to user
    added_by = Column(Integer, ForeignKey("user.uuid"))
    user = relationship("User", back_populates="custom_reminders")

    # Tenant ID
    tenant_id = Column(CHAR(36), nullable=False)

    # Foreign key to client
    client_id = Column(CHAR(36), ForeignKey("client.id"))

