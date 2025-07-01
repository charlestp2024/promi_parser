from sqlalchemy import Column, Integer, Text, ForeignKey, CHAR
from sqlalchemy.orm import relationship
from models import BaseDr


class ReviewDetails(BaseDr):
    __tablename__ = "review_details"

    id = Column(Integer, primary_key=True, autoincrement=True)
    activation_id = Column(Integer, ForeignKey("activation_details.id"), nullable=False)
    reviewer_id = Column(CHAR(36), ForeignKey("users.uuid"), nullable=False)
    comments = Column(Text, nullable=True)

    activation = relationship("ActivationDetails", back_populates="review_details")
    reviewer = relationship("User", foreign_keys=[reviewer_id])
    review_ranking_details = relationship(
        "ReviewRankingDetails",
        back_populates="review_details",
        cascade="all, delete-orphan",
        lazy="select",
    )
