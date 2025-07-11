from sqlalchemy import Column, Integer, String, SmallInteger, ForeignKey
from sqlalchemy.dialects.mysql import CHAR
from sqlalchemy.orm import relationship
from models import BaseDca


class User(BaseDca):
    __tablename__ = "user"

    id = Column(Integer, primary_key=True, autoincrement=True)
    firstname = Column(String(150), nullable=False)
    lastname = Column(String(150), nullable=True)
    fullname = Column(String(300), nullable=False)
    email = Column(String(300), nullable=False)
    uuid = Column(CHAR(36), nullable=False)
    active = Column(SmallInteger, nullable=True)
    tenant_id = Column(CHAR(36), nullable=False)

    # Relationships
    casereference_annuity = relationship(
        "CasereferenceAnnuity",
        back_populates="user",
        foreign_keys="CasereferenceAnnuity.attorneyid",
    )
    casereferences = relationship(
        "Casereference",
        back_populates="user",
        foreign_keys="Casereference.current_attorney",
    )
  