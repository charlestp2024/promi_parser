# models/pmv_dr_models/docket_inventors_mapping.py
from __future__ import annotations

from sqlalchemy import Column, Integer, ForeignKey, UniqueConstraint ,CHAR,DateTime,func  
from sqlalchemy.orm import relationship
from models import BaseDr


class DocketInventorsMapping(BaseDr):
    __tablename__ = "docket_inventors_mapping"

    # ---------------- Columns ----------------
    id          = Column(Integer, primary_key=True, autoincrement=True)
    docket_id   = Column(Integer, ForeignKey("docket.id"), nullable=False)
    inventor_id = Column(CHAR(36), ForeignKey("users.uuid"), nullable=False)

    created_on = Column(DateTime, nullable=False, server_default=func.now())
    modified_on = Column(DateTime, nullable=False, server_default=func.now(), onupdate=func.now())
    # ---------------- Table-level Unique Index ----------------
    __table_args__ = (
        UniqueConstraint("docket_id", "inventor_id", name="uq_docket_inventor"),
    )

    # ---------------- Relationships ----------
    docket   = relationship("Docket", back_populates="inventors")
    inventor = relationship("User",   back_populates="invented_dockets")

    # ---------------- Convenience ------------
    def __repr__(self) -> str:
        return f"<DocketInventorMap id={self.id} docket={self.docket_id} inventor={self.inventor_id}>"
