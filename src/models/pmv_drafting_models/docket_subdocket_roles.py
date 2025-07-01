from sqlalchemy import Column, Integer, Boolean, ForeignKey, TIMESTAMP, CHAR
from sqlalchemy.orm import relationship
from models import BaseDrafting  # Base class for Drafting module


class DocketSubdocketRoles(BaseDrafting):
    __tablename__ = "docket_subdocket_roles"

    # ---------------------- Normal Fields ----------------------
    id = Column(Integer, primary_key=True, autoincrement=True)
    created_on = Column(TIMESTAMP)
    modified_on = Column(TIMESTAMP)
    deleted = Column(Boolean)

    # ---------------------- Relationship Fields ----------------------
    user_id = Column(CHAR(36), ForeignKey("user.id"))

    docket_id = Column(Integer, ForeignKey("docket.id"))
    docket = relationship("Docket", back_populates="docketSubdocketRoles")

    subdocket_id = Column(Integer, ForeignKey("subdocket.id"))
    subdocket = relationship("SubDocket", back_populates="docketSubdocketRoles")

    role_id = Column(Integer, ForeignKey("role.id"))
    role = relationship("Role", back_populates="docket_subdocket_roles")
