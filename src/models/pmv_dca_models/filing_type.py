from sqlalchemy import Column, Integer, String
from sqlalchemy.orm import relationship
from models import BaseDca


class FilingType(BaseDca):
    __tablename__ = "filing_type"

    id = Column(Integer, primary_key=True, autoincrement=True)
    name = Column(String(60), nullable=False)
    code = Column(String(10), nullable=False)

    # Relationships
    casereferences = relationship("Casereference", back_populates="filing_type")
