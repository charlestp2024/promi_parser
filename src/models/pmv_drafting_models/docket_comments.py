from sqlalchemy import Column, Integer, String, Boolean, ForeignKey, TIMESTAMP
from sqlalchemy.dialects.mysql import CHAR
from sqlalchemy.orm import relationship
from models import BaseDrafting  # Base class for Drafting module


class DocketComments(BaseDrafting):
    __tablename__ = "docket_comments"

    # ---------------------- Normal Fields ----------------------
    id = Column(Integer, primary_key=True, autoincrement=True)
    added_date = Column(TIMESTAMP)
    comment = Column(String)
    deleted = Column(Boolean)
    tenant_id = Column(CHAR(36))  # UUID stored as string
    modified_on = Column(TIMESTAMP)

    # ---------------------- Relationship Fields ----------------------
    added_by = Column(Integer, ForeignKey("user.id"))
    user = relationship("User", back_populates="docket_comments")

    docket_id = Column(Integer, ForeignKey("docket.id"))
    docket = relationship(
        "Docket",
        back_populates="docket_comments",
    )

    client_id = Column(Integer, ForeignKey("client.id"))
