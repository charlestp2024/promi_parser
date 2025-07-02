from sqlalchemy import Column, Integer, String, TIMESTAMP
from sqlalchemy.sql import func
from models import BaseCsd  # Declarative base for CSD module


class Status(BaseCsd):
    __tablename__ = "status"

    id = Column(Integer, primary_key=True, autoincrement=True)
    name = Column(String)

    created_on = Column(TIMESTAMP, server_default=func.now())
    modified_on = Column(TIMESTAMP, onupdate=func.now())
