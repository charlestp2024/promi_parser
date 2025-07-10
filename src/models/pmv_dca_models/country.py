from sqlalchemy import Column, Integer, String, SmallInteger
from sqlalchemy.orm import relationship
from models import BaseAnnuity


class Country(BaseAnnuity):
    __tablename__ = "country"

    id = Column(Integer, primary_key=True, autoincrement=True)
    name = Column(String(60), nullable=False)
    code = Column(String(4), nullable=False)
    visibility = Column(SmallInteger, nullable=False, default=1)

    # Relationships (used in casereference.py)
    casereferences = relationship("Casereference", back_populates="country")
