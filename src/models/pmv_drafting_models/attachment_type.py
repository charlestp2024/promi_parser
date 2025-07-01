from sqlalchemy import Column, Integer, String, TIMESTAMP
from models import BaseDrafting  # Base class for Drafting module
from sqlalchemy.orm import relationship


class AttachmentType(BaseDrafting):
    __tablename__ = "attachment_type"

    # ---------------------- Normal Fields ----------------------
    id = Column(Integer, primary_key=True, autoincrement=True)
    attachment_type = Column(String)
    created_on = Column(TIMESTAMP)
    modified_on = Column(TIMESTAMP)

    # ---------------------- Relationship Fields ----------------------
    docket_attachments = relationship(
        "DocketAttachment", back_populates="attachment_type"
    )
