# models/pmv_dr_models/keywords.py
from __future__ import annotations

from sqlalchemy import Column, Integer, String,CHAR
from sqlalchemy.orm import relationship
from models import BaseDr


class Keywords(BaseDr):
    __tablename__ = "keywords"

    # ---------------- Columns ----------------
    id        = Column(Integer, primary_key=True, autoincrement=True)
    name      = Column(String(100), nullable=False)

    tenant_id = Column(CHAR(36), nullable=False)
    client_id = Column(CHAR(36))

    # ---------------- Relationships ----------
    dockets = relationship(
        "DocketKeywordsMapping",
        back_populates="keyword",
        cascade="all, delete-orphan",
        lazy="select",
    )

    # ---------------- Convenience ------------
    def __repr__(self) -> str:
        return f"<Keyword id={self.id} name='{self.name}'>"
