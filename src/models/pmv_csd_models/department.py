from sqlalchemy import Column, String, ForeignKey
from sqlalchemy.dialects.mysql import CHAR
from sqlalchemy.orm import relationship
from models import BaseCsd  # Base class for CSD module


class Department(BaseCsd):
    __tablename__ = "department"

    # ---------------------- Normal Fields ----------------------
    uuid = Column(CHAR(36), primary_key=True)
    department = Column(String)
    tenant_id = Column(CHAR(36))

    # ---------------------- Foreign Keys ----------------------
    client_id = Column(CHAR(36), ForeignKey("client.uuid"))

    # ---------------------- Relationships ----------------------

    subdocket = relationship(
        "Subdocket",
        back_populates="department",
        cascade="all, delete-orphan",
        lazy="select",
    )
