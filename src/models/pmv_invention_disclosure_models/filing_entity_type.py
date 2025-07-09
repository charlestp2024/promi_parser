from sqlalchemy import Column, Integer, String
from sqlalchemy.orm import relationship

from models.base import BaseInvd


class FilingEntityType(BaseInvd):
    __tablename__ = "filing_entity_type"

    # ---------- Columns ----------
    id   = Column(Integer, primary_key=True, autoincrement=True)
    name = Column(String(255), nullable=False)

    # ---------- Relationships ----------
    docket = relationship(
        "Docket",
        back_populates="filing_entity_type",  # ensure this exists in Docket
        cascade="all, delete-orphan",
        lazy="select",                        # FetchType.LAZY equivalent
    )

    # ---------- Convenience ----------
    def __repr__(self) -> str:
        return f"<FilingEntityType(id={self.id}, name={self.name})>"
