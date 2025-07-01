from sqlalchemy import Column, Integer, ForeignKey, TIMESTAMP
from sqlalchemy.orm import relationship
from models import BaseDrafting  # Base class for Drafting module


class DocketSubdocketMapping(BaseDrafting):
    __tablename__ = "docket_subdocket_mapping"

    # ---------------------- Normal Fields ----------------------
    id = Column(Integer, primary_key=True, autoincrement=True)
    created_on = Column(TIMESTAMP)
    modified_on = Column(TIMESTAMP)

    # ---------------------- Relationship Fields ----------------------
    subdocket_id = Column(Integer, ForeignKey("subdocket.id"))
    subdocket = relationship("SubDocket", back_populates="docket_subdocket_mapping")

    docket_id = Column(Integer, ForeignKey("docket.id"))
    docket = relationship(
        "Docket",
        back_populates="docket_subdocket_mapping",
    )
