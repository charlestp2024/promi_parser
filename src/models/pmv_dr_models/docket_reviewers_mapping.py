# models/pmv_dr_models/docket_reviewers_mapping.py
from __future__ import annotations

from sqlalchemy import Column, Integer, ForeignKey,CHAR,DateTime,func 
from sqlalchemy.orm import relationship
from models import BaseDr


class DocketReviewersMapping(BaseDr):
    __tablename__ = "docket_reviewers_mapping"

    id          = Column(Integer, primary_key=True, autoincrement=True)
    docket_id   = Column(Integer, ForeignKey("docket.id"), nullable=False)
    reviewer_id = Column(CHAR(36), ForeignKey("users.uuid"), nullable=False)

    created_on = Column(DateTime, nullable=False, server_default=func.now())
    modified_on = Column(DateTime, nullable=False, server_default=func.now(), onupdate=func.now())
    # ---------------- Relationships ----------
    docket   = relationship("Docket", back_populates="reviewers")
    reviewer = relationship("User",   back_populates="reviewed_dockets")

    def __repr__(self) -> str:
        return f"<DocketReviewerMap id={self.id} docket={self.docket_id} reviewer={self.reviewer_id}>"
