from sqlalchemy import Column, Integer, Boolean, TIMESTAMP, ForeignKey
from sqlalchemy.dialects.mysql import CHAR
from sqlalchemy.orm import relationship
from models import BaseDrafting
import uuid as uuid_pkg


class UserTenantClientMapping(BaseDrafting):
    __tablename__ = "user_tenant_client_mapping"

    # ---------------------- Columns ----------------------
    id = Column(Integer, primary_key=True, autoincrement=True)
    user_id = Column(CHAR(36), ForeignKey("user.id"))
    tenantId = Column(CHAR(36))
    client_id = Column(CHAR(36), ForeignKey("client.id"))
    active = Column(Boolean)
    createdOn = Column(TIMESTAMP)
    modifiedOn = Column(TIMESTAMP)

    # ---------------------- Relationships ----------------------
    user = relationship("User", back_populates="user_tenant_client_mappings")
    client = relationship("Client", back_populates="user_tenant_client_mappings")
