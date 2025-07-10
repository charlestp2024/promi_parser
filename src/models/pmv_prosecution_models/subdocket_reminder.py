# models/pmv_prosecution_models/subdocket_reminder.py

from sqlalchemy import Column, Integer, Boolean, TIMESTAMP, ForeignKey
from sqlalchemy.dialects.mysql import CHAR
from sqlalchemy.orm import relationship
from models import BaseProsecution  # Shared declarative base

class SubdocketReminder(BaseProsecution):
    __tablename__ = "subdocket_reminder"

    # Primary key
    id = Column(Integer, primary_key=True, autoincrement=True)

    # Foreign key to Subdocket
    subdocket_id = Column(Integer, ForeignKey("subdocket.id"))
    subdocket = relationship("Subdocket", back_populates="subdocket_reminder")

    # Reminder info
    next_reminder = Column(TIMESTAMP)
    sent = Column(Boolean, default=False)

    # Foreign key to Actions
    action_id = Column(Integer, ForeignKey("action.id"))
   

    # Timestamps
    created_on = Column(TIMESTAMP)
    sent_timestamp = Column(TIMESTAMP)
    updated_timestamp = Column(TIMESTAMP)
    modified_on = Column(TIMESTAMP)

    # Archival and quarter
    archive = Column(Boolean, default=False)
    quarter = Column(Integer)

    # Tenant
    tenant_id = Column(CHAR(36), nullable=False)

    # Foreign key to Client
    client_id = Column(CHAR(36), ForeignKey("client.id"))
    