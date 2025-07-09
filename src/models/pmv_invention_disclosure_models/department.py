import uuid


from sqlalchemy import Column, String, DateTime, ForeignKey
from sqlalchemy.dialects.mysql import CHAR
from sqlalchemy.orm import relationship
from sqlalchemy.sql import func

from models.base import BaseInvd


class Department(BaseInvd):
    __tablename__ = "department"

    # ---------- Columns ----------
    uuid = Column(
        CHAR(36),
        primary_key=True,
        default=lambda: str(uuid.uuid4()),
        nullable=False,
    )

    department = Column(String(255), nullable=False)

    tenant_id = Column(CHAR(36), nullable=False)

    # FK to parent Client
    client_id = Column(CHAR(36), ForeignKey("client.uuid"), nullable=False)

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
    client = relationship(
        "Client"
    )

    docket = relationship(
        "Docket",
        back_populates="department",  # define on Docket
        cascade="all, delete-orphan",
        lazy="select",  # matches FetchType.LAZY
    )

    # ---------- Convenience ----------
    def __repr__(self) -> str:
        return f"<Department(uuid={self.uuid}, department={self.department}, tenant_id={self.tenant_id})>"
