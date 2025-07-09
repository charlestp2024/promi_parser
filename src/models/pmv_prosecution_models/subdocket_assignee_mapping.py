# models/pmv_prosecution_models/subdocket_assignee_mapping.py

from sqlalchemy import Column, Integer, TIMESTAMP, ForeignKey
from sqlalchemy.orm import relationship
from models import BaseProsecution  # Shared declarative base


class SubdocketAssigneeMapping(BaseProsecution):
    __tablename__ = "subdocket_assignee_mapping"

    # Primary key
    id = Column(Integer, primary_key=True, autoincrement=True)

    # Foreign key to Assignee
    assignee_id = Column(Integer, ForeignKey("assignee.id"))
    assignee = relationship("Assignee", back_populates="subdocket_assignee_mapping")

    # Foreign key to Subdocket
    subdocket_id = Column(Integer, ForeignKey("subdocket.id"))
    subdocket = relationship("Subdocket", back_populates="subdocket_assignee_mapping")

    # Timestamps
    added_time = Column(TIMESTAMP)
    modified_on = Column(TIMESTAMP)
