from sqlalchemy import Column, Integer, String, TIMESTAMP
from sqlalchemy.orm import relationship
from models import BaseCsd  # Centralized Subdocket base


class Countries(BaseCsd):
    __tablename__ = "countries"

    # ---------------------- Normal Fields ----------------------
    id = Column(Integer, primary_key=True, autoincrement=True)
    name = Column(String)
    code = Column(String)
    created_on = Column(TIMESTAMP)
    modified_on = Column(TIMESTAMP)

    # ---------------------- Relationships (add as needed) ----------------------
