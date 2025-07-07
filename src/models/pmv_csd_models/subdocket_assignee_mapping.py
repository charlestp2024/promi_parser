from sqlalchemy import Column, Integer, ForeignKey, TIMESTAMP
from sqlalchemy.dialects.mysql import CHAR
from sqlalchemy.orm import relationship
from sqlalchemy.sql import func
from models import BaseCsd


class SubdocketAssigneeMapping(BaseCsd):
    __tablename__ = "subdocket_assignee_mapping"

    id = Column(Integer, primary_key=True, autoincrement=True)

    subdocket_id = Column(Integer, ForeignKey("subdocket.id"))

    assignee_id = Column(Integer, ForeignKey("assignee.id"))
    assignee = relationship("Assignee", back_populates="subd_assignee_mapping")

    added_by = Column(CHAR(36), ForeignKey("user.uuid"))

    created_on = Column(TIMESTAMP, server_default=func.now())
    modified_on = Column(TIMESTAMP, onupdate=func.now())
