from sqlalchemy import Column, Integer, Boolean, CHAR, ForeignKey
from sqlalchemy.orm import relationship
from models import BaseDr


class UserTenantClientMapping(BaseDr):
    __tablename__ = "user_tenant_client_mapping"

    id = Column(Integer, primary_key=True, autoincrement=True)
    user_id = Column(CHAR(36), ForeignKey("users.uuid"), nullable=False)
    tenant_id = Column(CHAR(36), nullable=False)
    client_id = Column(CHAR(36), ForeignKey("client.uuid"), nullable=False)
    active = Column(Boolean)

    user = relationship("User", back_populates="user_client_links")
    client = relationship("Client", back_populates="user_tenant_client_links")
