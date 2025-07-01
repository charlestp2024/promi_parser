# models/activation_details.py
from __future__ import annotations

import uuid
from datetime import datetime

from sqlalchemy import Column, Integer, Boolean, DateTime, Text, ForeignKey, CHAR
from sqlalchemy.orm import relationship
from models import BaseDr                    # <- your declarative Base

class ActivationDetails(BaseDr):
    __tablename__ = "activation_details"

    # ---------- Columns ---------------------------------------------------
    id               = Column(Integer, primary_key=True, autoincrement=True)
    docket_id        = Column(Integer, ForeignKey("docket.id"), nullable=False)
    activated_by     = Column(CHAR(36), ForeignKey("users.uuid"), nullable=False)
    activation_date  = Column(DateTime(timezone=True), default=datetime.utcnow, nullable=False)
    comments         = Column(Text)

    is_current_review = Column(Boolean, default=True, nullable=False)

    ranking_status_id = Column(
        Integer,
        ForeignKey("ranking_status.id"),
        nullable=False,
        default=1,
        comment="1-YET TO START, 2-IN-PROGRESS, 3-COMPLETED",
    )

    tenant_id = Column(CHAR(36), nullable=False)
    client_id = Column(CHAR(36))   # nullable=True by default

    # ---------- Relationships --------------------------------------------
    docket      = relationship("Docket",              back_populates="activation_details")
    activated_user = relationship("User",             back_populates="activations")
    ranking_status = relationship("RankingStatus",    back_populates="activation_details")

    review_details             = relationship("ReviewDetails",            back_populates="activation")
    docket_status_mappings     = relationship("DocketStatusMapping",      back_populates="activation")
    outside_agent_rankings     = relationship("OutsideAgentRankingDetails", back_populates="activation")

    # ---------- Convenience ----------------------------------------------
    def __repr__(self) -> str:
        return f"<ActivationDetails id={self.id} docket_id={self.docket_id} current={self.is_current_review}>"
