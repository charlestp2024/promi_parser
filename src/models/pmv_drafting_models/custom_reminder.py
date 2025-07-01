from sqlalchemy import Column, Integer, String, Boolean, ForeignKey, TIMESTAMP
from sqlalchemy.dialects.mysql import CHAR
from sqlalchemy.orm import relationship
from models import BaseDrafting  # Base class for Drafting module


class CustomReminder(BaseDrafting):
    __tablename__ = "custom_reminder"

    # ---------------------- Normal Fields ----------------------
    id = Column(Integer, primary_key=True)
    next_reminder = Column(TIMESTAMP)
    sent = Column(Boolean)
    archive = Column(Boolean)
    sent_timestamp = Column(TIMESTAMP)
    custom = Column(Boolean)
    title = Column(String)
    cc_address = Column(String)
    tenant_id = Column(CHAR(36))  # UUID stored as string
    created_on = Column(TIMESTAMP)
    modified_on = Column(TIMESTAMP)

    # ---------------------- Relationship Fields ----------------------
    docket_id = Column(Integer, ForeignKey("docket.id"))
    docket = relationship("Docket", back_populates="custom_reminders")

    subdocket_id = Column(Integer, ForeignKey("subdocket.id"))
    subdocket = relationship("SubDocket", back_populates="custom_reminders")

    added_by = Column(CHAR(36), ForeignKey("user.id"))
    user = relationship("User", back_populates="custom_reminders")

    client_id = Column(CHAR(36), ForeignKey("client.id"))
