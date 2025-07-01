import uuid
from datetime import datetime

from sqlalchemy import Column, Integer, String, DateTime, ForeignKey
from sqlalchemy.orm import declarative_base, relationship
from sqlalchemy.sql import func
from models.base import BaseInvd


class Countries(BaseInvd):
    __tablename__ = "countries"

    # ---------- Columns ----------
    id = Column(Integer, primary_key=True, autoincrement=True)

    name = Column(String(255), nullable=False)
    code = Column(String(10), nullable=False)

    created_on = Column(
        DateTime(timezone=True),
        server_default=func.now(),
        nullable=False,
    )
    modified_on = Column(
        DateTime(timezone=True),
        onupdate=func.now(),
    )

    # ---------- Relationships ----------
    # 1. Collection of foreign‑filing‑country mappings
    foreign_filing_countries = relationship(
        "DocketForeignFilingCountryMapping",
        back_populates="countries",
        cascade="all, delete-orphan",
        lazy="select",
    )

    # 2. Dockets where this is the first‑filing country
    first_filing_country = relationship(
        "Docket",
        back_populates="first_filing_country",
        cascade="all, delete-orphan",
        lazy="select",
    )
