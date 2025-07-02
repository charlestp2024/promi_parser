from sqlalchemy import Column, Integer, String, Boolean, ForeignKey
from sqlalchemy.dialects.mysql import CHAR
from sqlalchemy.orm import relationship
from models import BaseCsd  # CSD base class


class Client(BaseCsd):
    __tablename__ = "client"

    # ---------------------- Normal Fields ----------------------
    uuid = Column(CHAR(36), primary_key=True)
    client_name = Column(String)
    client_code = Column(Integer)
    active = Column(Boolean)

    tenant_id = Column(CHAR(36))

    # ---------------------- Relationships ----------------------
    subdocket = relationship(
        "Subdocket",
        back_populates="client",
        cascade="all, delete-orphan",
        lazy="select",
    )

    user_client_mapping = relationship(
        "UserClientMapping",
        back_populates="client",
        cascade="all, delete-orphan",
        lazy="select",
    )
