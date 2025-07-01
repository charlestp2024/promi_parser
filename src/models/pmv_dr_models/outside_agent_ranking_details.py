# models/pmv_dr_models/outside_agent_ranking_details.py
from __future__ import annotations

from sqlalchemy import Column, Integer, ForeignKey
from sqlalchemy.orm import relationship
from models import BaseDr


class OutsideAgentRankingDetails(BaseDr):

    __tablename__ = "outside_agent_ranking_details"

    # ---------------- Columns ----------------
    id                    = Column(Integer, primary_key=True, autoincrement=True)
    activation_id         = Column(Integer, ForeignKey("activation_details.id"), nullable=False)
    selected_criteria_id  = Column(Integer, ForeignKey("ranking_criteria.id"),  nullable=False)

    # ---------------- Relationships ----------
    activation      = relationship("ActivationDetails", back_populates="outside_agent_rankings")
    ranking_criteria = relationship("RankingCriteria",   back_populates="outside_agent_rankings")

    # ---------------- Convenience ------------
    def __repr__(self) -> str:
        return (
            f"<OutsideAgentRank id={self.id} activation={self.activation_id} "
            f"criteria={self.selected_criteria_id}>"
        )
