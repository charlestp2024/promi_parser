from sqlalchemy import Column, Integer, String, ForeignKey
from sqlalchemy.orm import relationship
from models import BaseAnnuity


class SubdocketLogs(BaseAnnuity):
    __tablename__ = "subdocket_logs"

    id = Column(Integer, primary_key=True, autoincrement=True)
    casereference_id = Column(Integer, ForeignKey("casereference.id"), nullable=False)
    message = Column(String(100), nullable=False)
    added_by = Column(Integer, ForeignKey("user.id"), nullable=False)

    # Relationships
    casereference = relationship("Casereference", back_populates="subdocket_logs")
    user = relationship("User", back_populates="subdocket_logs_added")
