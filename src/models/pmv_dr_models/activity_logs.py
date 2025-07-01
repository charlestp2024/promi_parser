# models/pmv_dr_moels/activity_logs.py


from sqlalchemy import Column, Integer, Text, ForeignKey,CHAR,DateTime, func
from sqlalchemy.orm import relationship
from models import BaseDr 

class ActivityLogs(BaseDr):
    __tablename__ = "activity_logs"

    id = Column(Integer, primary_key=True, autoincrement=True)
    docket_id = Column(Integer, ForeignKey("docket.id"), nullable=False)
    message = Column(Text, nullable=False)
    added_by = Column(CHAR(36), ForeignKey("users.uuid"), nullable=False)
    tenant_id = Column(CHAR(36), nullable=False)
    client_id = Column(CHAR(36), nullable=True)

    created_on = Column(DateTime, nullable=False, server_default=func.now())
    modified_on = Column(DateTime, nullable=False, server_default=func.now(), onupdate=func.now())
    # Relationships
    docket = relationship("Docket", back_populates="activity_logs")
    added_by_user = relationship("User", foreign_keys=[added_by])
