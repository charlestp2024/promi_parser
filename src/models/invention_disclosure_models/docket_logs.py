from datetime import datetime
import uuid

from sqlalchemy import (
    Column,
    Integer,
    Text,
    DateTime,
    ForeignKey,
)
from sqlalchemy.dialects.mysql import CHAR
from sqlalchemy.orm import relationship
from sqlalchemy.sql import func

from models.base import BaseInvd


class DocketLogs(BaseInvd):
    __tablename__ = "docket_logs"

    # ---------- Primary Key ----------
    id = Column(Integer, primary_key=True, autoincrement=True)

    # ---------- Simple Columns ----------
    logs = Column(Text, nullable=False)
    tenant_id = Column(CHAR(36), nullable=False)

    created_on = Column(
        DateTime(timezone=True),  # Java: addedDate
        server_default=func.now(),
        nullable=False,
    )
    modified_on = Column(
        DateTime(timezone=True),
        server_default=func.now(),
        onupdate=func.now(),
    )

    # ---------- Foreign‑Key Columns ----------
    docket_id = Column(Integer, ForeignKey("docket.id"), nullable=False)
    added_by = Column(CHAR(36), ForeignKey("user.uuid"), nullable=False)
    client_id = Column(CHAR(36), ForeignKey("client.uuid"), nullable=False)

    # ---------- Relationships ----------
    docket = relationship(
        "Docket",
        back_populates="docket_logs",
        lazy="joined",  # FetchType.EAGER in Java
    )

    added_by_user = relationship(  # explicit name to avoid clash with column
        "User",
        foreign_keys=[added_by],
        lazy="joined",
    )

    client = relationship(
        "Client",
        lazy="joined",
    )

    # ---------- Convenience ----------
    def __repr__(self) -> str:
        return (
            f"<DocketLogs(id={self.id}, docket_id={self.docket_id}, "
            f"added_by={self.added_by})>"
        )
