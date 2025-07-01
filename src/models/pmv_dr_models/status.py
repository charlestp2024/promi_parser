from sqlalchemy import Column, Integer, String
from sqlalchemy.orm import relationship
from models import BaseDr


class Status(BaseDr):
    __tablename__ = "status"

    id = Column(Integer, primary_key=True, autoincrement=True)
    status = Column(String(100), nullable=False)

    docket_status_mappings = relationship(
        "DocketStatusMapping",
        back_populates="status",
        cascade="all, delete-orphan",
        lazy="select",
    )
    status_histories = relationship(
        "StatusHistory",
        back_populates="status",
        lazy="select",
    )
