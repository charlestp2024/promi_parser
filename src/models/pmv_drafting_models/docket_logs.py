from sqlalchemy import Column, Integer, String, ForeignKey, TIMESTAMP
from sqlalchemy.dialects.mysql import CHAR
from sqlalchemy.orm import relationship
from models import BaseDrafting  # Base class for Drafting module


class DocketLogs(BaseDrafting):
    __tablename__ = "docket_logs"

    # ---------------------- Normal Fields ----------------------
    id = Column(Integer, primary_key=True, autoincrement=True)
    operation_type = Column(String)
    created_on = Column(TIMESTAMP)
    tenant_id = Column(CHAR(36))  # UUID as string
    modified_on = Column(TIMESTAMP)

    # ---------------------- Relationship Fields ----------------------
    docket_id = Column(Integer, ForeignKey("docket.id"))
    docket = relationship("Docket", back_populates="logs")

    client_id = Column(CHAR(36), ForeignKey("client.id"))

    created_by = Column(CHAR(36), ForeignKey("user.id"))
