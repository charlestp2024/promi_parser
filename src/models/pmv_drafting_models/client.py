from sqlalchemy import Column, String, Integer, Boolean, TIMESTAMP
from sqlalchemy.dialects.mysql import CHAR
from sqlalchemy.orm import relationship
from models import BaseDrafting  # Base class for Drafting module


class Client(BaseDrafting):
    __tablename__ = "client"

    # ---------------------- Normal Fields ----------------------
    id = Column(CHAR(36), primary_key=True, nullable=False)  # UUID as string
    client_name = Column(String)
    client_code = Column(Integer)
    email = Column(String)
    is_active = Column(Boolean)
    tenant_id = Column(CHAR(36))  # UUID as string
    created_on = Column(TIMESTAMP)
    modified_on = Column(TIMESTAMP)

    # ---------------------- Relationship Fields ----------------------
    docket = relationship(
        "Docket", back_populates="client", cascade="all, delete-orphan", lazy="select"
    )
    subdocket = relationship(
        "SubDocket",
        back_populates="client",
        cascade="all, delete-orphan",
        lazy="select",
    )

    divisions = relationship(
        "ClientDivision",
        back_populates="client",
        cascade="all, delete-orphan",
        lazy="select",
    )

    departments = relationship(
        "Department",
        back_populates="client",
        cascade="all, delete-orphan",
        lazy="select",
    )
    user_tenant_client_mappings = relationship(
        "UserTenantClientMapping", back_populates="client"
    )
