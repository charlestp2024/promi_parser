from datetime import datetime

from sqlalchemy import (
    Column,
    Integer,
    DateTime,
    ForeignKey,
)
from sqlalchemy.orm import relationship
from sqlalchemy.sql import func

from models.base import BaseInvd


class DocketForeignFilingCountryMapping(BaseInvd):
    __tablename__ = "foreign_filing_countries"

    # ---------- Primary Key ----------
    id = Column(Integer, primary_key=True, autoincrement=True)

    # ---------- Foreign‑Key Columns ----------
    docket_id = Column(Integer, ForeignKey("docket.id"), nullable=False)
    country_id = Column(Integer, ForeignKey("countries.id"), nullable=False)

    # ---------- Timestamp Columns ----------
    created_on = Column(
        DateTime(timezone=True),
        server_default=func.now(),
        nullable=False,
    )  # Java: added_time
    modified_on = Column(
        DateTime(timezone=True),
        server_default=func.now(),
        onupdate=func.now(),
    )

    # ---------- Relationships ----------
    docket = relationship(
        "Docket",
        back_populates="docket_foreign_filing_country_mappings",
        lazy="joined",  # FetchType.EAGER in Java
    )

    countries = relationship(
        "Countries",
        back_populates="foreign_filing_countries",
        lazy="joined",
    )

    # ---------- Convenience ----------
    def __repr__(self) -> str:
        return (
            f"<DocketForeignFilingCountryMapping(id={self.id}, "
            f"docket_id={self.docket_id}, country_id={self.country_id})>"
        )
