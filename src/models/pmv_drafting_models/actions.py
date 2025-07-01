from sqlalchemy import Column, Integer, String, Boolean, ForeignKey, TIMESTAMP
from sqlalchemy.orm import relationship
from models import BaseDrafting  # Base class for Drafting module


class Actions(BaseDrafting):
    __tablename__ = "actions"

    # ---------------------- Normal Fields ----------------------
    id = Column(Integer, primary_key=True, autoincrement=True)
    messages = Column(String)
    order = Column(Integer)
    created_on = Column(TIMESTAMP)
    modified_on = Column(TIMESTAMP)
    attachment_mandatory = Column(Boolean, nullable=True)
    reminder_config = Column(Boolean)

    # ---------------------- Relationship Fields ----------------------
    staged_id = Column(Integer, ForeignKey("stages.id"))
    stages = relationship("Stages", back_populates="actions")

    docket_subdocket_stage_action = relationship(
        "DocketSubdocketStagedAction",
        back_populates="actions",
        cascade="all, delete-orphan",
        lazy="select",
    )

    subdocket_reminder = relationship(
        "SubdocketReminder",
        back_populates="actions",
        cascade="all, delete-orphan",
        lazy="select",
    )

    action_inputs = relationship(
        "ActionInputConfig",
        back_populates="actions",
        cascade="all, delete-orphan",
        lazy="select",
    )
