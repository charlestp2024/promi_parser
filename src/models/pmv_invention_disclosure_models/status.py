from sqlalchemy import Column, Integer, String
from sqlalchemy.orm import relationship

from models.base import BaseInvd


class Status(BaseInvd):
    __tablename__ = "status"

    # ---------- Columns ----------
    id = Column(Integer, primary_key=True, autoincrement=True)
    status = Column(String(255), nullable=False)

    # ---------- Relationships ----------
    docket = relationship(
        "Docket",
        back_populates="status",
        cascade="all, delete-orphan",
        lazy="select",  # Equivalent to FetchType.LAZY
    )

    # ---------- Convenience ----------
    def __repr__(self) -> str:
        return f"<Status(id={self.id}, status={self.status})>"
