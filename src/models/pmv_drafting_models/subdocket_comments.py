from sqlalchemy import Column, Integer, String, ForeignKey, Boolean, TIMESTAMP
from sqlalchemy.dialects.mysql import CHAR
from sqlalchemy.orm import relationship
from models import BaseDrafting


class SubdocketComments(BaseDrafting):
    __tablename__ = "subdocket_comments"

    # ---------------------- Normal Fields ----------------------
    id = Column(Integer, primary_key=True, autoincrement=True)
    created_on = Column(TIMESTAMP)
    modified_date = Column(TIMESTAMP)
    comment = Column(String)
    deleted = Column(Boolean)
    tenantId = Column(CHAR(36))

    # ---------------------- Foreign Keys ----------------------
    added_by = Column(CHAR(36), ForeignKey("user.id"))
    user = relationship("User", back_populates="subdocket_comments")

    subdocket_id = Column(Integer, ForeignKey("subdocket.id"))
    subdocket = relationship("SubDocket", back_populates="subdocket_comments")

    client_id = Column(CHAR(36), ForeignKey("client.id"))
