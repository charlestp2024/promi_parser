from sqlalchemy import (
    Column,
    Integer,
    String,
    Date,
    Boolean,
    ForeignKey,
    DECIMAL,
    Float,
)
from sqlalchemy.orm import relationship
from models import BaseAnnuity


class CasereferenceAnnuity(BaseAnnuity):
    __tablename__ = "casereference_annuity"

    id = Column(Integer, primary_key=True, autoincrement=True)
    casereferenceid = Column(Integer, ForeignKey("casereference.id"), nullable=False)
    attorneyid = Column(Integer, ForeignKey("user.id"), nullable=True)
    renewaldate = Column(Date, nullable=False)
    annuity = Column(Integer, nullable=True)
    currency = Column(String(3), nullable=True)
    fee = Column(Float, nullable=True)
    eur_to_dollar_rate = Column(DECIMAL(10, 2), nullable=True)
    dollar_fee = Column(DECIMAL(10, 2), nullable=True)
    quarter = Column(Integer, nullable=False)
    financial_year = Column(Integer, nullable=False)
    paid = Column(Boolean, default=False)

    # Relationships
    casereference = relationship(
        "Casereference", back_populates="casereference_annuity"
    )
    user = relationship(
        "User", back_populates="casereference_annuity", foreign_keys=[attorneyid]
    )

    annuity_reviews = relationship(
        "AnnuityReview", back_populates="casereference_annuity"
    )
    annuity_payment_records = relationship(
        "AnnuityPaymentRecord", back_populates="casereference_annuity"
    )
