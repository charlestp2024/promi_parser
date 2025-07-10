# models/assignee.py

from sqlalchemy import Column, Integer, String, ForeignKey, TIMESTAMP
from sqlalchemy.dialects.mysql import CHAR
from sqlalchemy.orm import relationship
from models import BaseProsecution  

class Assignee(BaseProsecution):
    __tablename__ = "assignee"

    # Primary key
    id = Column(Integer, primary_key=True, autoincrement=True)

    # Assignee name
    name = Column(String(255))

    # Tenant ID (UUID stored as CHAR(36))
    tenant_id = Column(CHAR(36), nullable=False)

    # Foreign key to client table
    client_id = Column(Integer, ForeignKey("client.id"))
    

    # Reverse mapping to subdocket_assignee_mapping
    subdocket_assignee_mapping = relationship(
        "SubdocketAssigneeMapping",
        back_populates="assignee",
        cascade="all, delete-orphan",
        lazy="select",
    )

    # Timestamps
    created_on = Column(TIMESTAMP)
    modified_on = Column(TIMESTAMP)

    # Foreign key to user who added this entry
    added_by = Column(Integer, ForeignKey("user.uuid"))
   
