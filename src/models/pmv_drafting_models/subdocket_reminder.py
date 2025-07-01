from sqlalchemy import Column, Integer, ForeignKey, TIMESTAMP, Boolean
from sqlalchemy.dialects.mysql import CHAR
from sqlalchemy.orm import relationship
from models import BaseDrafting
import uuid as uuid_pkg


class SubdocketReminder(BaseDrafting):
    __tablename__ = "subdocket_reminder"

    # ---------------------- Normal Fields ----------------------
    id = Column(Integer, primary_key=True, autoincrement=True)
    next_reminder = Column(TIMESTAMP)
    quarter = Column(Integer)
    sent = Column(Boolean)
    archive = Column(Boolean)
    sent_timestamp = Column(TIMESTAMP)
    updated_timestamp = Column(TIMESTAMP)
    tenant_id = Column(CHAR(36), default=lambda: str(uuid_pkg.uuid4()))
    created_on = Column(TIMESTAMP)
    modified_on = Column(TIMESTAMP)

    # ---------------------- Relationships ----------------------
    subdocket_id = Column(Integer, ForeignKey("subdocket.id"))
    subdocket = relationship("SubDocket", back_populates="subdocketReminder")

    actions_id = Column(Integer, ForeignKey("actions.id"))
    actions = relationship("Actions", back_populates="subdocket_reminder")

    client_id = Column(CHAR(36), ForeignKey("client.id"))
    client = relationship("Client")
