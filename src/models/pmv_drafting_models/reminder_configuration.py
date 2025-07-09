from sqlalchemy import Column, Integer, ForeignKey, TIMESTAMP, Numeric
from sqlalchemy.orm import relationship
from models import BaseDrafting  # Base class for Drafting module


class ReminderConfiguration(BaseDrafting):
    __tablename__ = "reminder_config"

    # ---------------------- Normal Fields ----------------------
    id = Column(Integer, primary_key=True, autoincrement=True)
    first_reminder = Column(Integer)
    second_reminder = Column(Integer)
    third_reminder = Column(Integer)
    forth_reminder = Column(Numeric(10, 2))
    priority = Column(Integer)
    created_on = Column(TIMESTAMP)
    modified_on = Column(TIMESTAMP)

    # ---------------------- Relationship Fields ----------------------
    filing_country = Column(Integer, ForeignKey("countries.id"))
    subdocket_filing_country = relationship(
        "Countries", back_populates="reminderConfiguration"
    )

    filing_type = Column(Integer, ForeignKey("subdocket_filing_type.id"))
    subdocket_filing_type = relationship(
        "SubdocketFilingType", back_populates="reminderConfiguration"
    )
