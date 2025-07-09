import uuid
from datetime import datetime

from sqlalchemy import (
    Column,
    Integer,
    String,
    DateTime,
    ForeignKey,
)
from sqlalchemy.dialects.mysql import CHAR
from sqlalchemy.orm import relationship
from sqlalchemy.sql import func

from models.base import BaseInvd


class DocketAttachmentMapping(BaseInvd):
    __tablename__ = "docket_attachment_mapping"

    # ---------- Primary Key ----------
    id = Column(Integer, primary_key=True, autoincrement=True)

    # ---------- Foreign‑Key Columns ----------
    docket_id = Column(Integer, ForeignKey("docket.id"), nullable=False)
    uploaded_by = Column(CHAR(36), ForeignKey("user.uuid"), nullable=False)
    client_id = Column(CHAR(36), ForeignKey("client.uuid"), nullable=False)

    # ---------- Simple Columns ----------
    location = Column(String(1000))
    file_name = Column(String(255))
    tenant_id = Column(CHAR(36), nullable=False)

    created_on = Column(
        DateTime(timezone=True),
        server_default=func.now(),
        nullable=False,
    )
    modified_on = Column(
        DateTime(timezone=True),
        onupdate=func.now(),
    )

    # ---------- Relationships ----------
    docket = relationship(
        "Docket",
        back_populates="docket_attachment_mapping",
        lazy="joined",  # FetchType.EAGER in Java
    )

    user = relationship(
        "User",
        foreign_keys=[uploaded_by],
        lazy="joined",
    )

    client = relationship(
        "Client",
        lazy="joined",
    )

    # ---------- Convenience ----------
    def __repr__(self) -> str:
        return (
            f"<DocketAttachmentMapping(id={self.id}, file={self.file_name}, "
            f"docket_id={self.docket_id}, uploaded_by={self.uploaded_by})>"
        )
