from sqlalchemy import Column, Integer, String, ForeignKey, TIMESTAMP
from sqlalchemy.dialects.mysql import CHAR
from sqlalchemy.orm import relationship
from models import BaseDrafting
import uuid as uuid_pkg


class SubdocketStageAttachmentMapping(BaseDrafting):
    __tablename__ = "subdocket_stage_attachment_mapping"

    # ---------------------- Columns ----------------------
    id = Column(Integer, primary_key=True, autoincrement=True)
    fileName = Column(String(255))
    fileLocation = Column(String(255))
    tenant_id = Column(CHAR(36), default=lambda: str(uuid_pkg.uuid4()))
    created_on = Column(TIMESTAMP)
    modified_on = Column(TIMESTAMP)

    # ---------------------- Relationships ----------------------
    subdocket_stage_id = Column(Integer, ForeignKey("docket_subdocket_stage_action.id"))
    docket_subdocket_stage_action = relationship(
        "DocketSubdocketStagedAction",
        back_populates="subdocket_stage_attachment_mapping",
    )

    client_id = Column(CHAR(36), ForeignKey("client.id"))
    client = relationship("Client")
