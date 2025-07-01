from sqlalchemy import Column, String, Boolean, CHAR
from sqlalchemy.orm import relationship
from models import BaseDr


class User(BaseDr):
    __tablename__ = "users"

    # core fields
    uuid = Column(CHAR(36), primary_key=True)
    first_name = Column(String(100), nullable=False)
    last_name = Column(String(100), nullable=False)
    full_name = Column(String(100), nullable=False)
    email = Column(String(100), nullable=False)
    address = Column(String(255))
    contact = Column(String(255))
    inactive = Column(Boolean, default=False)
    tenant_id = Column(CHAR(36), nullable=False)

    # relationships
    added_dockets = relationship("Docket", foreign_keys="[Docket.added_by]", back_populates="added_by_user")
    patent_dockets = relationship("Docket", foreign_keys="[Docket.patent_agent_id]", back_populates="patent_agent")
    invented_dockets = relationship("DocketInventorsMapping", back_populates="inventor")
    reviewed_dockets = relationship("DocketReviewersMapping", back_populates="reviewer")
    docket_attachments = relationship("DocketAttachmentMapping", back_populates="uploader")
    activations = relationship("ActivationDetails", back_populates="activated_user")
    review_details = relationship("ReviewDetails", back_populates="reviewer")
    status_updates = relationship("DocketStatusMapping", back_populates="added_by_user")
    activity_logs = relationship("ActivityLogs", back_populates="added_by_user")
    keyword_links = relationship("DocketKeywordsMapping", back_populates="user")
    user_client_links = relationship("UserTenantClientMapping", back_populates="user")
