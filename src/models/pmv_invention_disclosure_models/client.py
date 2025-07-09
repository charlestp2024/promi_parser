from sqlalchemy import Column, String, Integer, Boolean, DateTime, func
from sqlalchemy.dialects.mysql import CHAR
from sqlalchemy.orm import relationship
from datetime import datetime
import uuid
from models.base import BaseInvd


class Client(BaseInvd):
    __tablename__ = "client"

    uuid = Column(CHAR(36), primary_key=True, default=lambda: str(uuid.uuid4()))
    client_name = Column(String(255), nullable=False)
    client_code = Column(Integer, nullable=True)

    is_active = Column(Boolean, default=True)

    tenant_id = Column(CHAR(36), nullable=False)

    created_on = Column(DateTime(timezone=True), server_default=func.now())
    modified_on = Column(DateTime(timezone=True), onupdate=func.now())

    # Relationships
    docket = relationship(
        "Docket", back_populates="client", cascade="all, delete-orphan", lazy="select"
    )
    client_division = relationship(
        "ClientDivision",
        back_populates="client",
        cascade="all, delete-orphan",
        lazy="select",
    )
