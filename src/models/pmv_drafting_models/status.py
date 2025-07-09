from sqlalchemy import Column, Integer, String, TIMESTAMP
from sqlalchemy.orm import relationship
from models import BaseDrafting  # Base class for Drafting module


class Status(BaseDrafting):
    __tablename__ = "status"

    # ---------------------- Normal Fields ----------------------
    id = Column(Integer, primary_key=True, autoincrement=True)
    status = Column(String)
    created_on = Column(TIMESTAMP)
    modified_on = Column(TIMESTAMP)

    # ---------------------- Relationship Fields ----------------------
    subdocket = relationship(
        "SubDocket", back_populates="status", cascade="all, delete-orphan"
    )

    docket = relationship(
        "Docket", back_populates="status", cascade="all, delete-orphan"
    )
