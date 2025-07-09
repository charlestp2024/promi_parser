# models/pmv_prosecution_models/role.py

from sqlalchemy import Column, Integer, String, Boolean
from sqlalchemy.orm import relationship
from models import BaseProsecution  # Shared declarative base


class Role(BaseProsecution):
    __tablename__ = "role"

    # Primary key
    id = Column(Integer, primary_key=True, autoincrement=True)

    # Role name and visibility flag
    name = Column(String(255))
    visibility = Column(Boolean, default=True)

    # One-to-many relationship with SubdocketUserRoles
    subdocket_user_roles = relationship(
        "SubdocketUserRoles",
        back_populates="role",
        cascade="all, delete-orphan",
        lazy="select",
    )
