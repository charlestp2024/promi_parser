# models/pmv_prosecution_models/subdocket_checklist_additional_detail.py

from sqlalchemy import Column, Integer, String, Boolean, TIMESTAMP, ForeignKey
from sqlalchemy.orm import relationship
from models import BaseProsecution  # Shared declarative base

class SubdocketChecklistAdditionalDetail(BaseProsecution):
    __tablename__ = "subdocket_checklist_additional_details"

    # Primary key
    id = Column(Integer, primary_key=True, autoincrement=True)

    # Name and value fields
    name = Column(String(255))
    value = Column(String(1000))

    # Foreign key to Subdocket
    subdocket_id = Column(Integer, ForeignKey("subdocket.id"))
    subdocket = relationship("Subdocket", back_populates="subdocket_checklist_additional_details")

    # Timestamps
    added_date = Column(TIMESTAMP)
    modified_on = Column(TIMESTAMP)

    # File flag
    file = Column(Boolean, nullable=True)
