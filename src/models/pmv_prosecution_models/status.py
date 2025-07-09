# models/pmv_prosecution_models/status.py

from sqlalchemy import Column, Integer, String, Boolean
from sqlalchemy.orm import relationship
from models import BaseProsecution  # Shared declarative base


class Status(BaseProsecution):
    __tablename__ = "status"

    # Primary key
    id = Column(Integer, primary_key=True, autoincrement=True)

    # Status fields
    visible = Column(Boolean, default=True)
    status = Column(String(255))

    # One-to-many relationship with Subdocket
    subdocket = relationship(
        "Subdocket",
        back_populates="status",
        cascade="all, delete-orphan",
        lazy="select",
    )
