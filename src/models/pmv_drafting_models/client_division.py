from sqlalchemy import Column, String, Boolean, ForeignKey, TIMESTAMP
from sqlalchemy.dialects.mysql import CHAR
from sqlalchemy.orm import relationship
from models import BaseDrafting


class ClientDivision(BaseDrafting):
    __tablename__ = "client_division"

    # ---------------------- Normal Fields ----------------------
    id = Column(CHAR(36), primary_key=True, nullable=False)  # UUID as CHAR(36)
    division_name = Column(String)
    tenant_id = Column(CHAR(36))  # UUID as string
    created_on = Column(TIMESTAMP)
    modified_on = Column(TIMESTAMP)
    is_active = Column(Boolean)

    # ---------------------- Relationship Fields ----------------------
    client_id = Column(CHAR(36), ForeignKey("client.id"))
    client = relationship("Client", back_populates="divisions")

    docket = relationship(
        "Docket",
        back_populates="divisions",
        lazy="select",
    )
