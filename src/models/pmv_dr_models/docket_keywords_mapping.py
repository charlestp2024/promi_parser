# models/pmv_dr_models/docket_keywords_mapping.py
from __future__ import annotations

from sqlalchemy import Column, Integer, ForeignKey, CHAR
from sqlalchemy.orm import relationship
from models import BaseDr


class DocketKeywordsMapping(BaseDr):
    __tablename__ = "docket_keywords_mapping"

    id         = Column(Integer, primary_key=True, autoincrement=True)
    docket_id  = Column(Integer, ForeignKey("docket.id"), nullable=False)
    keyword_id = Column(Integer, ForeignKey("keywords.id"), nullable=False)
    added_by   = Column(CHAR(36), ForeignKey("users.uuid"), nullable=False)
    tenant_id  = Column(CHAR(36), nullable=False)
    client_id  = Column(CHAR(36), nullable=True)

    # ------------- Relationships -------------
    docket  = relationship("Docket", back_populates="keyword_mappings")
    keyword = relationship("Keywords", back_populates="dockets")
    user    = relationship("User", back_populates="keyword_links")

    def __repr__(self) -> str:
        return f"<DocketKeywordsMapping id={self.id} docket={self.docket_id} keyword={self.keyword_id}>"
