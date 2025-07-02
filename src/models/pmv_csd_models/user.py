from sqlalchemy import Column, String, Boolean, TIMESTAMP
from sqlalchemy.dialects.mysql import CHAR
from sqlalchemy.orm import relationship
from sqlalchemy.sql import func
from models import BaseCsd


class User(BaseCsd):
    __tablename__ = "user"

    uuid = Column(CHAR(36), primary_key=True, nullable=False)
    first_name = Column(String)
    last_name = Column(String)
    full_name = Column(String)
    address = Column(String)
    contact = Column(String)
    email = Column(String)

    deleted = Column(Boolean, default=False)
    inactive = Column(Boolean, default=False)

    tenant_id = Column(CHAR(36))

    created_on = Column(TIMESTAMP, server_default=func.now())
    modified_on = Column(TIMESTAMP, onupdate=func.now())

    user_client_mapping = relationship(
        "UserClientMapping",
        back_populates="user",
        cascade="all, delete-orphan",
        lazy="select"
    )
