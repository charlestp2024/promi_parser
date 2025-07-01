# models/pmv_dr_models/client.py
from __future__ import annotations

import uuid
from sqlalchemy import Column, String, Integer, Boolean, CHAR, Index, ForeignKey
from sqlalchemy.orm import relationship
from models import BaseDr          # shared declarative Base

class Client(BaseDr):
    __tablename__ = "client"

    # --------------- Columns ----------------
    uuid        = Column(CHAR(36), primary_key=True, default=lambda: str(uuid.uuid4()))
    client_name = Column(String(100), nullable=False, unique=True)
    client_code = Column(Integer,       nullable=False, unique=True)
    is_active   = Column(Boolean,       default=True,  nullable=False)
    tenant_id   = Column(CHAR(36),      nullable=False)

    # --------------- Relationships ---------
    dockets                   = relationship(
        "Docket",
        back_populates="client",
        cascade="all, delete-orphan",
        lazy="select",
    )
    user_tenant_client_links  = relationship(
        "UserTenantClientMapping",
        back_populates="client",
        cascade="all, delete-orphan",
        lazy="select",
    )

    # --------------- Convenience ----------
    def __repr__(self) -> str:
        return f"<Client uuid={self.uuid} name={self.client_name}>"

# ---------------- Indexes -----------------
Index("idx_client_name", Client.client_name, unique=True)
Index("idx_client_code", Client.client_code, unique=True)
