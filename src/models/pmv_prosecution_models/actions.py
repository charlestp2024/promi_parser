# models/pmv_prosecution_models/actions.py

from sqlalchemy import Column, Integer, String, Boolean, ForeignKey
from sqlalchemy.orm import relationship
from models import BaseProsecution  # Shared base from models/__init__.py


class Actions(BaseProsecution):
    __tablename__ = "actions"

    # Primary key
    id = Column(Integer, primary_key=True, autoincrement=True)

    # Foreign key to stages table
    staged_id = Column(Integer, ForeignKey("stages.id"))
    stages = relationship("Stages", back_populates="actions")

    # Foreign key to countries table
    country_id = Column(Integer, ForeignKey("countries.id"))
    countries = relationship("Countries", back_populates="actions")

    # Optional reminder configuration
    reminder_config = Column(Integer, ForeignKey("reminder_configuration.id"))
    

    # Other fields
    messages = Column(String(1000))
    order = Column(Integer)
    attachment_mandatory = Column(Boolean, nullable=True)

    # Reverse relationships
   


    action_input_config = relationship(
        "ActionInputConfig",
        back_populates="actions",
        cascade="all, delete-orphan",
        lazy="select",
    )

    filing_date_reminder_config_action_mapping = relationship(
        "FilingDateReminderConfigActionMapping",
        back_populates="actions",
        cascade="all, delete-orphan",
        lazy="select",
    )
