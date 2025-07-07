from sqlalchemy import Column, Integer, String, TIMESTAMP, ForeignKey
from sqlalchemy.dialects.mysql import CHAR
from sqlalchemy.orm import relationship
from sqlalchemy.sql import func
from models import BaseCsd


class SubdocketLogs(BaseCsd):
    __tablename__ = "subdocket_logs"

    id = Column(Integer, primary_key=True, autoincrement=True)
    logs = Column(String)

    subdocket_id = Column(Integer, ForeignKey("subdocket.id"))

    added_by = Column(CHAR(36), ForeignKey("user.uuid"))

    tenant_id = Column(CHAR(36))

    created_on = Column(TIMESTAMP, server_default=func.now())
    modified_on = Column(TIMESTAMP, onupdate=func.now())

    client_id = Column(CHAR(36), ForeignKey("client.uuid"))
