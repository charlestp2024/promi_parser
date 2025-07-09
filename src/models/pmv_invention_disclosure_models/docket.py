import uuid
from datetime import datetime
from decimal import Decimal

from sqlalchemy import (
    Column,
    Integer,
    String,
    DateTime,
    Boolean,
    ForeignKey,
    Numeric,
)
from sqlalchemy.dialects.mysql import CHAR
from sqlalchemy.orm import relationship
from sqlalchemy.sql import func

from models.base import BaseInvd


class Docket(BaseInvd):
    __tablename__ = "docket"

    # ---------- Primary Key ----------
    id = Column(Integer, primary_key=True, autoincrement=True)

    # ---------- Simple Columns ----------
    manual_docket_number = Column(String(255))
    system_generated_docket_number = Column(String(255))
    title = Column(String(1000))
    temp_number = Column(Integer)

    created_on = Column(  # Java field: addedDate
        DateTime(timezone=True),
        server_default=func.now(),
        nullable=False,
    )

    first_filing_date = Column(DateTime(timezone=True))
    current_status_date = Column(DateTime(timezone=True))
    date_of_public_disclosure = Column(DateTime(timezone=True))
    annuity_timeline = Column(DateTime(timezone=True))
    deadline_for_filing = Column(DateTime(timezone=True))

    uuid = Column(
        CHAR(36),
        nullable=False,
        unique=True,
        default=lambda: str(uuid.uuid4()),
    )
    appid = Column(CHAR(36))
    tenant_id = Column(CHAR(36), nullable=False)

    filing_maintenance_cost = Column(Numeric(18, 2))
    foreign_license_required = Column(Boolean, default=False)

    deleted = Column(Boolean, default=False)
    archived = Column(Boolean, default=False)
    send_for_review = Column(Boolean, default=False)
    dr_link = Column(String(255))
    modified_on = Column(
        DateTime(timezone=True),
        onupdate=func.now(),
    )
    archive_date = Column(DateTime(timezone=True))

    # ---------- Foreign‑Key Columns ----------
    status_id = Column(Integer, ForeignKey("status.id"))
    client_division_id = Column(CHAR(36), ForeignKey("client_division.id"))
    filing_entity_id = Column(Integer, ForeignKey("filing_entity_type.id"))
    filing_type_id = Column(Integer, ForeignKey("filing_type.id"))
    first_filing_country_id = Column(Integer, ForeignKey("countries.id"))
    client_id = Column(CHAR(36), ForeignKey("client.uuid"))
    department_id = Column(CHAR(36), ForeignKey("department.uuid"))
    added_by = Column(CHAR(36), ForeignKey("user.uuid"))
    archived_by = Column(CHAR(36), ForeignKey("user.uuid"))

    # ---------- Relationships (Many‑to‑One) ----------
    status = relationship("Status", lazy="joined")
    client_division = relationship("ClientDivision", lazy="joined")
    filing_entity_type = relationship("FilingEntityType", lazy="joined")
    filing_type = relationship("FilingType", lazy="joined")
    first_filing_country = relationship("Countries", lazy="joined")
    client = relationship("Client", lazy="joined")
    department = relationship("Department", lazy="joined")
    user = relationship("User", foreign_keys=[added_by], lazy="joined")
    archived_by_user = relationship("User", foreign_keys=[archived_by], lazy="joined")

    # ---------- Relationships (One‑to‑Many) ----------
    docket_user_role_mappings = relationship(
        "DocketUserRoleMapping",
        back_populates="docket",
        cascade="all, delete-orphan",
        lazy="select",
    )

    docket_foreign_filing_country_mappings = relationship(
        "DocketForeignFilingCountryMapping",
        back_populates="docket",
        cascade="all, delete-orphan",
        lazy="select",
    )

    docket_attachment_mapping = relationship(
        "DocketAttachmentMapping",
        back_populates="docket",
        cascade="all, delete-orphan",
        lazy="select",
    )
    docket_logs = relationship(
        "DocketLogs",
        back_populates="docket",
        cascade="all, delete-orphan",
        lazy="select",
    )

    # ---------- Convenience ----------
    def __repr__(self) -> str:
        return (
            f"<Docket(id={self.id}, manual={self.manual_docket_number}, "
            f"title={self.title}, uuid={self.uuid})>"
        )
