from sqlalchemy import Column, Integer, ForeignKey
from sqlalchemy.orm import relationship
from models import BaseDr


class StatusHistory(BaseDr):
    __tablename__ = "status_history"

    id = Column(Integer, primary_key=True, autoincrement=True)
    docket_id = Column(Integer, ForeignKey("docket.id"), nullable=False)
    status_id = Column(Integer, ForeignKey("status.id"), nullable=False)

    docket = relationship("Docket", back_populates="status_histories")
    status = relationship("Status", back_populates="status_histories")
