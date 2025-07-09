from sqlalchemy import Column, Integer, String, ForeignKey, TIMESTAMP
from sqlalchemy.dialects.mysql import CHAR
from sqlalchemy.orm import relationship
from models import BaseDrafting  # Base class for Drafting module


class SubdocketLogs(BaseDrafting):
    __tablename__ = "subdocket_logs"

    # ---------------------- Normal Fields ----------------------
    id = Column(Integer, primary_key=True, autoincrement=True)
    operation_type = Column(String)
    created_on = Column(TIMESTAMP)
    modified_on = Column(TIMESTAMP)
    tenant_id = Column(CHAR(36))

    # ---------------------- Relationship Fields ----------------------
    created_by = Column(CHAR(36), ForeignKey("user.id"))

    subdocket_id = Column(Integer, ForeignKey("subdocket.id"))
    subdocket = relationship("SubDocket", back_populates="subdocket_logs")

    client_id = Column(CHAR(36), ForeignKey("client.id"))
