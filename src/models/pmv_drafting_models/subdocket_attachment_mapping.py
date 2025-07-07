from sqlalchemy import Column, Integer, String, ForeignKey, TIMESTAMP
from sqlalchemy.dialects.mysql import CHAR
from sqlalchemy.orm import relationship
from models import BaseDrafting


class SubdocketAttachmentMapping(BaseDrafting):
    __tablename__ = "subdocket_attachment_mapping"

    # ---------------------- Normal Fields ----------------------
    id = Column(Integer, primary_key=True, autoincrement=True)
    location = Column(String)
    fileName = Column(String)
    created_on = Column(TIMESTAMP)
    modified_date = Column(TIMESTAMP)
    tenantId = Column(CHAR(36))

    # ---------------------- Foreign Keys ----------------------
    subdocket_id = Column(Integer, ForeignKey("subdocket.id"))
    subdocket = relationship("SubDocket", back_populates="subdocket_attachment_mapping")

    added_by = Column(CHAR(36), ForeignKey("user.id"))
    user = relationship("User", back_populates="subdocket_attachment_mapping")

    client_id = Column(CHAR(36), ForeignKey("client.id"))
