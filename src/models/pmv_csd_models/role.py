from sqlalchemy import Column, Integer, String, TIMESTAMP
from sqlalchemy.sql import func
from models import BaseCsd  # assuming this is your declarative base for the CSD module


class Role(BaseCsd):
    __tablename__ = "role"

    id = Column(Integer, primary_key=True, autoincrement=True)
    name = Column(String)

    created_on = Column(TIMESTAMP, server_default=func.now())
    modified_on = Column(TIMESTAMP, onupdate=func.now())
