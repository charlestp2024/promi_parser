# models/pmv_prosecution_models/subdocket_staged_action.py

from sqlalchemy import Column, Integer, String, Boolean, TIMESTAMP, ForeignKey
from sqlalchemy.orm import relationship
from models import BaseProsecution  # Shared declarative base

class SubdocketStagedAction(BaseProsecution):
    __tablename__ = "subdocket_stage_action"

    # Primary key
    id = Column(Integer, primary_key=True, autoincrement=True)

    # Foreign key to Subdocket
    subdocket_id = Column(Integer, ForeignKey("subdocket.id"))
    subdocket = relationship("Subdocket", back_populates="subdocket_stage_action")

    # Foreign key to Stages
    stage_id = Column(Integer, ForeignKey("stages.id"))
    stages = relationship("Stages", back_populates="subdocket_stage_action")

    # Completion status
    complete = Column(Boolean, default=False)

    # Action details
    comment = Column(String(1000))
    patent_number = Column(String(255))

    # Date fields
    examination_date = Column(TIMESTAMP)
    publication_date = Column(TIMESTAMP)
    grant_date = Column(TIMESTAMP)
    preliminary_examination_date = Column(TIMESTAMP)
    last_date_payment = Column(TIMESTAMP)
    first_examination_report_date = Column(TIMESTAMP)
    filing_response_first_examination_report_date = Column(TIMESTAMP)
    filing_request_extension_time = Column(TIMESTAMP)
    receipt_subsequent_examination_report = Column(TIMESTAMP)
    filing_response_subsequent_examination_report = Column(TIMESTAMP)
    receipt_of_hearing_notice = Column(TIMESTAMP)
    date_of_hearing = Column(TIMESTAMP)

    # Foreign key to User (performed_by)
    performed_by = Column(Integer, ForeignKey("user.uuid"))
    user = relationship("User", back_populates="subdocket_stage_action")

    # Foreign key to Actions
    action_id = Column(Integer, ForeignKey("action.id"))
   

    # Timestamps
    created_onstamp = Column(TIMESTAMP)
    modified_timestamp = Column(TIMESTAMP)
    performed_on = Column(TIMESTAMP)

    # Optional flags
    attachment_mandatory = Column(Boolean, nullable=True)
