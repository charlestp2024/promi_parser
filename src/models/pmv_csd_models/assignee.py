from sqlalchemy import Column, Integer, String, ForeignKey, TIMESTAMP
from sqlalchemy.dialects.mysql import CHAR
from sqlalchemy.orm import relationship
from models import BaseCsd  # Use BaseCsd for Centralized Subdocket models


class Assignee(BaseCsd):
    __tablename__ = "assignee"

    # ---------------------- Normal Fields ----------------------
    id = Column(Integer, primary_key=True, autoincrement=True)
    name = Column(String)

    tenant_id = Column(CHAR(36), nullable=True)

    created_on = Column(TIMESTAMP)
    modified_on = Column(TIMESTAMP)

    # ---------------------- Foreign Keys ----------------------
    client_id = Column(CHAR(36), ForeignKey("client.id"))
    added_by = Column(CHAR(36), ForeignKey("user.id"))

    # ---------------------- Relationships ----------------------
    client = relationship("Client", back_populates="assignees")
    user = relationship("User", back_populates="assignees")

    subd_assignee_mapping = relationship(
        "SubdocketAssigneeMapping",
        back_populates="assignee",
        cascade="all, delete-orphan",
        lazy="select",
    )
