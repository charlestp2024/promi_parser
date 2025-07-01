from sqlalchemy import Column, Integer, String, ForeignKey, TIMESTAMP
from sqlalchemy.dialects.mysql import CHAR
from sqlalchemy.orm import relationship
from models import BaseDrafting  # Base class for Drafting module
import uuid


class Assignee(BaseDrafting):
    __tablename__ = "assignee"

    # ---------------------- Normal Fields ----------------------
    id = Column(Integer, primary_key=True, autoincrement=True)
    name = Column(String)
    tenant_id = Column(CHAR(36), nullable=True)  # UUID stored as string
    created_on = Column(TIMESTAMP)
    modified_on = Column(TIMESTAMP)

    # ---------------------- Relationship Fields ----------------------
    client_id = Column(CHAR(36), ForeignKey("client.id"))

    subdocket_assignee_mapping = relationship(
        "SubdocketAssigneeMapping",
        back_populates="assignee",
        cascade="all, delete-orphan",
        lazy="select",
    )
