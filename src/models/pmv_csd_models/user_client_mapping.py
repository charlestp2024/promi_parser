from sqlalchemy import Column, Integer, Boolean, ForeignKey, TIMESTAMP
from sqlalchemy.dialects.mysql import CHAR
from sqlalchemy.orm import relationship
from sqlalchemy.sql import func
from models import BaseCsd


class UserClientMapping(BaseCsd):
    __tablename__ = "user_tenant_client_mapping"

    id = Column(Integer, primary_key=True, autoincrement=True)

    user_id = Column(CHAR(36), ForeignKey("user.uuid"))
    user = relationship("User", back_populates="user_client_mapping")

    tenant_id = Column(CHAR(36), nullable=False)

    client_id = Column(CHAR(36), ForeignKey("client.id"))
    client = relationship("Client", back_populates="user_client_mapping")

    active = Column(Boolean, default=True)

    created_on = Column(TIMESTAMP, server_default=func.now())
    modified_on = Column(TIMESTAMP, onupdate=func.now())
