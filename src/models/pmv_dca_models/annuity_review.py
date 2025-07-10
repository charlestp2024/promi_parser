from sqlalchemy import Column, Integer, Date, ForeignKey
from sqlalchemy.orm import relationship
from models import BaseAnnuity


class AnnuityReview(BaseAnnuity):
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
    attorney = relationship(
        "User", back_populates="attorney_annuity_reviews", foreign_keys=[attorney_id]
    )

    attorney_decision = relationship(
        "AttorneyDecision", uselist=False, back_populates="annuity_review"
    )
    attorney_checklists = relationship(
        "AttorneyChecklist", back_populates="annuity_review"
    )
    reviewer_decisions = relationship(
        "ReviewerDecision", back_populates="annuity_review"
    )
    reviewer_checklists = relationship(
        "ReviewerChecklist", back_populates="annuity_review"
    )
