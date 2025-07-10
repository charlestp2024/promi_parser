# models/pmv_prosecution_models/subdocket_user_roles.py

from sqlalchemy import Column, Integer, Boolean, TIMESTAMP, ForeignKey
from sqlalchemy.orm import relationship
from models import BaseProsecution  # Shared declarative base

class SubdocketUserRoles(BaseProsecution):
    __tablename__ = "subdocket_user_roles"

    # Primary key
    id = Column(Integer, primary_key=True, autoincrement=True)

    # Foreign key to User
    user_id = Column(Integer, ForeignKey("user.uuid"))
    user = relationship("User", back_populates="subdocket_user_roles")

    # Foreign key to Subdocket
    subdocket_id = Column(Integer, ForeignKey("subdocket.id"))
    subdocket = relationship("Subdocket", back_populates="subdocket_user_roles")

    # Foreign key to Role
    role_id = Column(Integer, ForeignKey("role.id"))
    role = relationship("Role", back_populates="subdocket_user_roles")

    # Timestamps
    created_on = Column(TIMESTAMP)
    modified_on = Column(TIMESTAMP)

    # Soft delete flag
    deleted = Column(Boolean, default=False)
