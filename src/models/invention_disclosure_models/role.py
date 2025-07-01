from sqlalchemy import Column, Integer, String
from sqlalchemy.orm import relationship

from models.base import BaseInvd


class Role(BaseInvd):
    __tablename__ = "role"

    # ---------- Columns ----------
    id = Column(Integer, primary_key=True, autoincrement=True)
    role = Column(String(255), nullable=False)

    # ---------- Relationships ----------
    docket_user_role_mapping = relationship(
        "DocketUserRoleMapping",
        back_populates="role",  # see note below
        cascade="all, delete-orphan",
        lazy="select",  # mirrors FetchType.LAZY
    )

    # ---------- Convenience ----------
    def __repr__(self) -> str:
        return f"<Role(id={self.id}, role={self.role})>"
