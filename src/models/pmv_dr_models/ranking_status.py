from sqlalchemy import Column, Integer, String
from sqlalchemy.orm import relationship
from models import BaseDr


class RankingStatus(BaseDr):
    __tablename__ = "ranking_status"

    id = Column(Integer, primary_key=True, autoincrement=True)
    name = Column(String(50), nullable=False)

    activation_details = relationship(
        "ActivationDetails",
        back_populates="ranking_status",
        cascade="all, delete-orphan",
        lazy="select",
    )
