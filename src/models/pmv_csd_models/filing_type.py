from sqlalchemy import Column, Integer, String, TIMESTAMP
from sqlalchemy.orm import relationship
from models import BaseCsd  # Centralized Subdocket base class


class FilingType(BaseCsd):
    __tablename__ = "subdocket_filing_type"

    # ---------------------- Normal Fields ----------------------
    id = Column(Integer, primary_key=True, autoincrement=True)
    name = Column(String)
    code = Column(String)
    created_on = Column(TIMESTAMP)
    modified_on = Column(TIMESTAMP)

    # ---------------------- Relationship Fields ----------------------
