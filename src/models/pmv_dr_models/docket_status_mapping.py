# models/pmv_dr_models/docket_status_mapping.py
from __future__ import annotations

from sqlalchemy import (
    Column,
    Integer,
    DateTime,
    Text,
    Boolean,
    ForeignKey,
    CHAR,func)

from sqlalchemy.orm import relationship
from models import BaseDr


class DocketStatusMapping(BaseDr):
    __tablename__ = "docket_status_mapping"

    # ---------------- Columns ----------------
    id                  = Column(Integer, primary_key=True, autoincrement=True)
    docket_id           = Column(Integer, ForeignKey("docket.id"),  nullable=False)

    current_status_id   = Column(Integer, ForeignKey("status.id"), nullable=False)
    current_status_date = Column(DateTime, nullable=False)

    source_id           = Column(Integer, ForeignKey("status_source.id"))
    comment             = Column(Text)

    added_by            = Column(CHAR(36), ForeignKey("users.uuid"), nullable=False)
    is_current          = Column(Boolean, default=True, nullable=False)

    activation_id       = Column(Integer, ForeignKey("activation_details.id"))

    tenant_id           = Column(CHAR(36), nullable=False)
    client_id           = Column(CHAR(36))

    created_on = Column(DateTime, nullable=False, server_default=func.now())
    modified_on = Column(DateTime, nullable=False, server_default=func.now(), onupdate=func.now())
    # ---------------- Relationships ----------
    docket        = relationship("Docket",            back_populates="status_mappings")
    status        = relationship("Status",            back_populates="docket_status_mappings")
    status_source = relationship("StatusSource",      back_populates="docket_status_mappings")
    added_by_user = relationship("User",              back_populates="status_updates")
    activation    = relationship("ActivationDetails", back_populates="docket_status_mappings")

    # ---------------- Convenience ------------
    def __repr__(self) -> str:
        return (
            f"<DocketStatusMap id={self.id} docket={self.docket_id} "
            f"status={self.current_status_id} current={self.is_current}>"
        )
