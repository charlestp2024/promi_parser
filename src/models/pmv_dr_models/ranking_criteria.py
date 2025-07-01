from sqlalchemy import Column, Integer, String, Boolean, ForeignKey
from sqlalchemy.orm import relationship
from sqlalchemy.sql import func
from models import BaseDr

class RankingCriteria(BaseDr):
    __tablename__ = "ranking_criteria"

    id = Column(Integer, primary_key=True, autoincrement=True)
    criteria_name = Column(String(255), nullable=False)
    parent_id = Column(Integer, ForeignKey("ranking_criteria.id"), nullable=True, default=None)
    criteria_points = Column(Integer, nullable=True, default=None)
    visibility = Column(Boolean, default=True)

    parent = relationship("RankingCriteria", remote_side=[id], backref="children")
    department_criteria_mappings = relationship("DepartmentCriteriaMapping", back_populates="ranking_criteria")
    review_ranking_details = relationship("ReviewRankingDetails", back_populates="ranking_criteria")
    outside_agent_rankings = relationship("OutsideAgentRankingDetails", back_populates="ranking_criteria")
