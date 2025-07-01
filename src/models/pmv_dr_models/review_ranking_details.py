from sqlalchemy import Column, Integer, ForeignKey
from sqlalchemy.orm import relationship
from models import BaseDr


class ReviewRankingDetails(BaseDr):
    __tablename__ = "review_ranking_details"

    id = Column(Integer, primary_key=True, autoincrement=True)
    review_details_id = Column(Integer, ForeignKey("review_details.id"), nullable=False)
    selected_criteria_id = Column(Integer, ForeignKey("ranking_criteria.id"), nullable=False)

    review_details = relationship("ReviewDetails", back_populates="review_ranking_details")
    ranking_criteria = relationship("RankingCriteria")
