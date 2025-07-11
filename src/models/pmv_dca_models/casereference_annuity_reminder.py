from sqlalchemy import Column, Integer, Boolean, Date, ForeignKey
from sqlalchemy.orm import relationship
from models import BaseDca


class CasereferenceAnnuityReminder(BaseDca):
    __tablename__ = "case_reference_annuity_reminder"

    id = Column(Integer, primary_key=True, autoincrement=True)
    casereference_id = Column(Integer, ForeignKey("casereference.id"), nullable=False)
    annuity = Column(Integer, nullable=False)
    sent = Column(Boolean, default=False)
    template_id = Column(
        Integer, ForeignKey("reminder_mail_template.id"), nullable=False
    )
    reminder_date = Column(Date, nullable=False)

    # Relationships
    casereference = relationship("Casereference", back_populates="case_reference_annuity_reminder")
    
