# models/pmv_prosecution_models/stages.py

from sqlalchemy import Column, Integer, String
from sqlalchemy.orm import relationship
from models import BaseProsecution  # Shared declarative base


class Stages(BaseProsecution):
    __tablename__ = "stages"

    # Primary key
    id = Column(Integer, primary_key=True, autoincrement=True)

    # Stage name and order
    name = Column(String(255))
    serial_order = Column(Integer)

    # One-to-many relationship with Actions
    actions = relationship(
        "Actions", back_populates="stages", cascade="all, delete-orphan", lazy="select"
    )

    # One-to-many relationship with SubdocketStagedAction
    subdocket_stage_action = relationship(
        "SubdocketStagedAction",
        back_populates="stages",
        cascade="all, delete-orphan",
        lazy="select",
    )
