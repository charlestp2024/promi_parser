from sqlalchemy import Column, Integer, Boolean, ForeignKey, TIMESTAMP
from sqlalchemy.dialects.mysql import CHAR, TINYINT
from sqlalchemy.orm import relationship
from sqlalchemy.sql import func
from models import BaseCsd


class SubdocketUserRolesMapping(BaseCsd):
    __tablename__ = "subdocket_user_role_mapping"

    id = Column(Integer, primary_key=True, autoincrement=True)

    subdocket_id = Column(Integer, ForeignKey("subdocket.id"))
    subdocket = relationship("Subdocket", back_populates="subdocket_user_role_mappings")

    user_id = Column(CHAR(36), ForeignKey("user.id"))
    user = relationship("User", back_populates="subdocket_user_role_mappings")

    role_id = Column(Integer, ForeignKey("role.id"))
    role = relationship("Role", back_populates="subdocket_user_role_mappings")

    added_date = Column(TIMESTAMP, server_default=func.now())
    modified_on = Column(TIMESTAMP, onupdate=func.now())

    deleted = Column(Boolean, default=False)
