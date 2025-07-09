from sqlalchemy import Column, Integer, String
from sqlalchemy.orm import relationship

from models.base import BaseInvd


class FilingType(BaseInvd):
    __tablename__ = "filing_type"

    # ---------- Columns ----------
    id = Column(Integer, primary_key=True, autoincrement=True)
    name = Column(String(255), nullable=False)
    code = Column(String(50), nullable=False)

    # ---------- Relationships ----------
    docket = relationship(
        "Docket",
        back_populates="filing_type",  # ensure this exists on Docket
        cascade="all, delete-orphan",
        lazy="select",  # FetchType.LAZY in Java
    )

    # ---------- Convenience ----------
    def __repr__(self) -> str:
        return f"<FilingType(id={self.id}, name={self.name}, code={self.code})>"
