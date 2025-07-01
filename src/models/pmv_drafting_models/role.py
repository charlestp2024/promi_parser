from sqlalchemy import Column, Integer, String, Boolean, TIMESTAMP
from sqlalchemy.orm import relationship
from models import BaseDrafting  # Base class for Drafting module


class Role(BaseDrafting):
    __tablename__ = "role"

    # ---------------------- Normal Fields ----------------------
    id = Column(Integer, primary_key=True, autoincrement=True)
    name = Column(String)
    visibility = Column(Boolean)
    added_time = Column(TIMESTAMP)
    modified_time = Column(TIMESTAMP)

    # ---------------------- Relationship Fields ----------------------
    docket_subdocket_roles = relationship(
        "DocketSubdocketRoles", back_populates="role", cascade="all, delete-orphan"
    )
