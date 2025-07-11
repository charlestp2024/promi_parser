from sqlalchemy import Column, Integer, Date, ForeignKey
from sqlalchemy.orm import relationship
from models import BaseDca


class AnnuityReview(BaseDca):
    __tablename__ = "annuity_review"

    id = Column(Integer, primary_key=True, autoincrement=True)
    casereference_annuity_id = Column(
        Integer, ForeignKey("casereference_annuity.id"), nullable=False
    )
    attorney_id = Column(Integer, ForeignKey("user.id"), nullable=True)

    decision_due_date = Column(Date, nullable=True)

    decision_keep_count = Column(Integer, nullable=True, default=0)
    decision_drop_count = Column(Integer, nullable=True, default=0)
    decision_tentative_drop_count = Column(Integer, nullable=True, default=0)
    assigned_reviewer_count = Column(Integer, nullable=True, default=0)

    # Relationships
    casereference_annuity = relationship(
        "CasereferenceAnnuity", back_populates="annuity_reviews"
    )
   

    