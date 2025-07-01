from datetime import datetime
from sqlalchemy import (
    Column,
    Integer,
    Boolean,
    DateTime,
    ForeignKey,
)
from sqlalchemy.dialects.mysql import CHAR
from sqlalchemy.orm import relationship
from sqlalchemy.sql import func
from models.base import BaseInvd


class UserClientMapping(BaseInvd):
    __tablename__ = "user_tenant_client_mapping"

    # ---------- Columns ----------
    id = Column(Integer, primary_key=True, autoincrement=True)

    user_id = Column(CHAR(36), ForeignKey("user.uuid"), nullable=False)
    tenant_id = Column(CHAR(36), nullable=False)
    client_id = Column(CHAR(36), ForeignKey("client.uuid"), nullable=False)

    active = Column(Boolean, default=True)

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
    user = relationship(
        "User",
        back_populates="user_client_mapping",
        lazy="joined",  # FetchType.EAGER in Java
    )

    client = relationship(
        "Client",
        lazy="joined",
    )

    # ---------- Convenience ----------
    def __repr__(self) -> str:
        return (
            f"<UserClientMapping(id={self.id}, user_id={self.user_id}, "
            f"client_id={self.client_id}, active={self.active})>"
        )
