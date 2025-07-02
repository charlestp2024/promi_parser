from sqlalchemy import Column, Integer, String, TIMESTAMP
from sqlalchemy.orm import relationship
from models import BaseCsd  # Base class for Centralized Subdocket (CSD)


class FilingEntityType(BaseCsd):
    __tablename__ = "filing_entity_type"

    # ---------------------- Normal Fields ----------------------
    id = Column(Integer, primary_key=True, autoincrement=True)
    name = Column(String)
    created_on = Column(TIMESTAMP)
    modified_on = Column(TIMESTAMP)

    # ---------------------- Relationships ----------------------
