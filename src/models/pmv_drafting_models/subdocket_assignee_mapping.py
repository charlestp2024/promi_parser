from sqlalchemy import Column, Integer, ForeignKey, TIMESTAMP
from sqlalchemy.orm import relationship
from models import BaseDrafting  # Base class for Drafting module


class SubdocketAssigneeMapping(BaseDrafting):
    __tablename__ = "subdocket_assignee_mapping"

    # ---------------------- Normal Fields ----------------------
    id = Column(Integer, primary_key=True, autoincrement=True)
    created_on = Column(TIMESTAMP)
    modified_on = Column(TIMESTAMP)

    # ---------------------- Relationship Fields ----------------------
    assignee_id = Column(Integer, ForeignKey("assignee.id"))
    assignee = relationship("Assignee", back_populates="subdocket_assignee_mapping")

    subdocket_id = Column(Integer, ForeignKey("subdocket.id"))
    subdocket = relationship("SubDocket", back_populates="subdocket_assignee_mapping")
