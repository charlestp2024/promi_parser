import uuid

from sqlalchemy import (
    Column,
    String,
    Boolean,
    DateTime,
    ForeignKey,
    CHAR,
    DATETIME,
    func,
)
from sqlalchemy.orm import relationship
from models.base import BaseInvd
from models.pmv_invention_disclosure_models.client import Client


class ClientDivision(BaseInvd):
    __tablename__ = "client_division"

    # ---------- Columns ----------
    id = Column(
        CHAR(36),
        primary_key=True,
        default=lambda: str(uuid.uuid4()),
        nullable=False,
    )

    name = Column("division_name", String(255), nullable=False)

    is_active = Column(Boolean, default=True)

    # FK to parent Client
    client_id = Column(CHAR(36), ForeignKey("client.uuid"), nullable=False)

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
    client = relationship(
        "Client",
        back_populates="client_division",  # matches property defined on Client
        lazy="joined",  # eager loading similar to FetchType.EAGER
    )

    docket = relationship(
        "Docket",
        back_populates="client_division",
        cascade="all, delete-orphan",  # close to CascadeType.DETACH intent
        lazy="select",
    )
