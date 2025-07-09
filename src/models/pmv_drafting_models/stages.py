from sqlalchemy import Column, Integer, String, TIMESTAMP
from sqlalchemy.orm import relationship
from models import BaseDrafting  # Base class for Drafting module


class Stages(BaseDrafting):
    __tablename__ = "stages"

    # ---------------------- Normal Fields ----------------------
    id = Column(Integer, primary_key=True, autoincrement=True)
    name = Column(String)
    serial_order = Column(Integer)
    created_on = Column(TIMESTAMP)
    modified_on = Column(TIMESTAMP)

    # ---------------------- Relationship Fields ----------------------
    actions = relationship(
        "Actions", back_populates="stages", cascade="all, delete-orphan"
    )

    staged_actions = relationship(
        "DocketSubdocketStagedAction",
        back_populates="stages",
        cascade="all, delete-orphan",
    )
