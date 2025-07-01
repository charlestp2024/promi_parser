# models/pmv_dr_models/docket_attachment_mapping.py
from __future__ import annotations

import uuid
from sqlalchemy import Column, Integer, String, ForeignKey, CHAR

from sqlalchemy.orm import relationship
from models import BaseDr


class DocketAttachmentMapping(BaseDr):
    __tablename__ = "docket_attachment_mapping"

    # ---------------- Columns ----------------
    id         = Column(Integer, primary_key=True, autoincrement=True)
    docket_id  = Column(Integer, ForeignKey("docket.id"), nullable=False)
    uploaded_by = Column(CHAR(36), ForeignKey("users.uuid"), nullable=False)

    file_name  = Column(String(255), nullable=False)
    location   = Column(String(255), nullable=False)

    tenant_id  = Column(CHAR(36), nullable=False)
    client_id  = Column(CHAR(36))  # nullable=True by default

    # ---------------- Relationships ----------
    docket = relationship("Docket", back_populates="attachments")
    uploader = relationship("User",  back_populates="docket_attachments")

    # ---------------- Convenience ------------
    def __repr__(self) -> str:
        return f"<DocketAttach id={self.id} docket_id={self.docket_id} file='{self.file_name}'>"
