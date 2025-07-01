from sqlalchemy import Column, String, ForeignKey, TIMESTAMP
from sqlalchemy.dialects.mysql import CHAR
from sqlalchemy.orm import relationship
from models import BaseDrafting  # Base class for Drafting module


class Department(BaseDrafting):
    __tablename__ = "department"

    # ---------------------- Normal Fields ----------------------
    uuid = Column(CHAR(36), primary_key=True, nullable=False)  # UUID as string
    department = Column(String)
    tenant_id = Column(CHAR(36))  # UUID as string
    created_on = Column(TIMESTAMP)
    modified_on = Column(TIMESTAMP)

    # ---------------------- Relationship Fields ----------------------
    client_id = Column(CHAR(36), ForeignKey("client.id"))
    client = relationship("Client", back_populates="departments")

    docket = relationship(
        "Docket",
        back_populates="department",
        cascade="all, delete-orphan",
        lazy="select",
    )
