from sqlalchemy import Column, Integer, String, Boolean, ForeignKey, TIMESTAMP, CHAR
from sqlalchemy.orm import relationship
from models import BaseDrafting  # Base class for Drafting module


class DocketSubdocketStagedAction(BaseDrafting):
    __tablename__ = "docket_subdocket_stage_action"

    # ---------------------- Normal Fields ----------------------
    id = Column(Integer, primary_key=True, autoincrement=True)
    modified_on = Column(TIMESTAMP)
    complete = Column(Boolean)
    comment = Column(String)
    added_timestamp = Column(TIMESTAMP)
    performed_on = Column(TIMESTAMP)
    attachment_mandatory = Column(Boolean)

    # ---------------------- Relationship Fields ----------------------
    docket_id = Column(Integer, ForeignKey("docket.id"))
    docket = relationship(
        "Docket",
        back_populates="docket_subdocket_stage_action",
    )

    subdocket_id = Column(Integer, ForeignKey("subdocket.id"))
    subdocket = relationship(
        "SubDocket", back_populates="docket_subdocket_stage_action"
    )

    stage_id = Column(Integer, ForeignKey("stages.id"))
    stages = relationship("Stages", back_populates="staged_actions")

    performed_by = Column(CHAR(36), ForeignKey("user.id"))

    action_id = Column(Integer, ForeignKey("actions.id"))
    actions = relationship("Actions", back_populates="docket_subdocket_stage_action")

    upload_filetype = Column(Integer, ForeignKey("attachment_type.id"))

    subdocket_stage_attachment_mapping = relationship(
        "SubdocketStageAttachmentMapping",
        back_populates="docket_subdocket_stage_action",
        cascade="all, delete-orphan",
        lazy="select",
    )
