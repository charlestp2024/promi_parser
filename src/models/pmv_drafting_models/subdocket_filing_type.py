from sqlalchemy import Column, Integer, String, TIMESTAMP
from sqlalchemy.orm import relationship
from models import BaseDrafting


class SubdocketFilingType(BaseDrafting):
    __tablename__ = "subdocket_filing_type"

    # ---------------------- Normal Fields ----------------------
    id = Column(Integer, primary_key=True, autoincrement=True)
    filing_type = Column(String)
    filing_type_code = Column(String)
    created_on = Column(TIMESTAMP)
    modified_on = Column(TIMESTAMP)

    # ---------------------- Relationships ----------------------
    subdocket = relationship(
        "SubDocket",
        back_populates="subdocket_filing_type",
        cascade="all, delete-orphan",
    )
    reminderConfiguration = relationship(
        "ReminderConfiguration",
        back_populates="subdocket_filing_type",
        cascade="all, delete-orphan",
    )
