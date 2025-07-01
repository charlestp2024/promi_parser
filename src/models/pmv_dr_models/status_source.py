from sqlalchemy import Column, Integer, String
from sqlalchemy.orm import relationship
from models import BaseDr


class StatusSource(BaseDr):
    __tablename__ = "status_source"

    id = Column(Integer, primary_key=True, autoincrement=True)
    name = Column(String(50), nullable=False)

    docket_status_mappings = relationship(
        "DocketStatusMapping",
        back_populates="status_source",
        cascade="all, delete-orphan",
        lazy="select",
    )
