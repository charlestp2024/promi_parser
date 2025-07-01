from models import BaseDr
from sqlalchemy import Column, Integer, String, Boolean, DateTime, ForeignKey,CHAR
from sqlalchemy.sql import func
from sqlalchemy.orm import relationship


class Docket(BaseDr):
    __tablename__ = "docket"

    id = Column(Integer, primary_key=True, autoincrement=True)
    uuid = Column(CHAR(36), nullable=False)  # CHAR(36)

    manual_docket_number = Column(String(100), nullable=True)
    system_generated_docket_number = Column(String(100), nullable=True)
    title = Column(String(300), nullable=False)

    client_id = Column(CHAR(36), ForeignKey("client.uuid"), nullable=False)       # CHAR(36)
    department_id = Column(CHAR(36), ForeignKey("department.uuid"), nullable=False)  # CHAR(36)
    added_by = Column(CHAR(36), ForeignKey("users.uuid"), nullable=False)         # CHAR(36)
    patent_agent_id = Column(CHAR(36), ForeignKey("users.uuid"), nullable=False)  # CHAR(36)

    first_filing_date = Column(DateTime, nullable=True)
    date_of_public_disclosure = Column(DateTime, nullable=True)

    active = Column(Boolean, nullable=False, default=True)
    archived = Column(Boolean, default=False)
    is_sent_to_drafting = Column(Boolean, default=False)
    drafting_link = Column(String(300), nullable=True)

    first_filing_country_id = Column(Integer, nullable=False)
    tenant_id = Column(CHAR(36), nullable=False)  # CHAR(36)

    created_on = Column(DateTime, nullable=False, server_default=func.now())
    modified_on = Column(DateTime, nullable=False, server_default=func.now(), onupdate=func.now())

    # Relationships
    department = relationship("Department", back_populates="dockets")
    client = relationship("Client", back_populates="dockets")
    added_by_user = relationship("User", foreign_keys=[added_by], back_populates="added_dockets")
    patent_agent = relationship("User", foreign_keys=[patent_agent_id], back_populates="patent_dockets")

    attachments = relationship("DocketAttachmentMapping", back_populates="docket")
    inventors = relationship("DocketInventorsMapping", back_populates="docket")
    reviewers = relationship("DocketReviewersMapping", back_populates="docket")
    status_mappings = relationship("DocketStatusMapping", back_populates="docket")
    status_histories = relationship("StatusHistory", back_populates="docket")
    keyword_mappings = relationship("DocketKeywordsMapping", back_populates="docket")
    activation_details = relationship("ActivationDetails", uselist=False, back_populates="docket")
    activity_logs = relationship("ActivityLogs", back_populates="docket")
