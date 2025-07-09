from sqlalchemy import Column, Integer, String, ForeignKey, TIMESTAMP
from sqlalchemy.dialects.mysql import CHAR
from sqlalchemy.orm import relationship
from models import BaseDrafting  # Base class for Drafting module


class DocketAttachment(BaseDrafting):
    __tablename__ = "docket_attachment_mapping"

    # ---------------------- Normal Fields ----------------------
    id = Column(Integer, primary_key=True, autoincrement=True)
    location = Column(String)
    file_name = Column(String)
    created_on = Column(TIMESTAMP)
    modified_on = Column(TIMESTAMP)
    tenant_id = Column(CHAR(36))  # UUID stored as string

    # ---------------------- Relationship Fields ----------------------
    attachment_type_id = Column(Integer, ForeignKey("attachment_type.id"))
    attachment_type = relationship(
        "AttachmentType", back_populates="docket_attachments"
    )

    docket_id = Column(Integer, ForeignKey("docket.id"))
    docket = relationship(
        "Docket",
        back_populates="docket_attachment_mapping",
    )

    user_id = Column(CHAR(36), ForeignKey("user.id"))

    client_id = Column(CHAR(36), ForeignKey("client.id"))
