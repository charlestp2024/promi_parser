# models/pmv_prosecution_models/mailing_queue.py

from sqlalchemy import Column, Integer, String, TIMESTAMP, ForeignKey
from sqlalchemy.orm import relationship
from models import BaseProsecution  # Shared declarative base


class MailingQueue(BaseProsecution):
    __tablename__ = "mailing_queue"

    # Primary key
    id = Column(Integer, primary_key=True, autoincrement=True)

    # Foreign key to Subdocket
    subdocket_id = Column(Integer, ForeignKey("subdocket.id"))
    subdocket = relationship("Subdocket", back_populates="mailing_queues")

    # Reminder dates
    old_reminder_date = Column(TIMESTAMP)
    new_reminder_date = Column(TIMESTAMP)

    # Email addresses
    to_address = Column(String(255))
    cc_address = Column(String(255))

    # Timestamps
    added_date = Column(TIMESTAMP)
    modified_on = Column(TIMESTAMP)
