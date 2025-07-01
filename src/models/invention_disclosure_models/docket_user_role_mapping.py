from datetime import datetime

from sqlalchemy import (
    Column,
    Integer,
    DateTime,
    Boolean,
    ForeignKey,
)
from sqlalchemy.orm import relationship
from sqlalchemy.sql import func

from models.base import BaseInvd


class DocketUserRoleMapping(BaseInvd):
    __tablename__ = "docket_user_role_mapping"

    # ---------- Primary Key ----------
    id = Column(Integer, primary_key=True, autoincrement=True)

    # ---------- Foreign‑Key Columns ----------
    docket_id = Column(Integer, ForeignKey("docket.id"), nullable=False)
    user_id = Column(ForeignKey("user.uuid"), nullable=False)
    role_id = Column(ForeignKey("role.id"), nullable=False)

    # ---------- Timestamps ----------
    created_on = Column(  # Java: added_date
        DateTime(timezone=True),
        server_default=func.now(),
        nullable=False,
    )
    modified_on = Column(  # Java: modified_date
        DateTime(timezone=True),
        server_default=func.now(),
        onupdate=func.now(),
    )

    # ---------- Flags ----------
    deleted = Column(Boolean, default=False)

    # ---------- Relationships ----------
    docket = relationship(
        "Docket",
        back_populates="docket_user_role_mappings",
        lazy="joined",  # FetchType.EAGER in Java
    )
    user = relationship(
        "User",
        lazy="joined",
    )
    role = relationship(
        "Role",
        lazy="joined",
    )

    # ---------- Convenience ----------
    def __repr__(self) -> str:
        return (
            f"<DocketUserRoleMapping(id={self.id}, docket_id={self.docket_id}, "
            f"user_id={self.user_id}, role_id={self.role_id}, deleted={self.deleted})>"
        )
