from sqlalchemy import Column, Integer, String
from models import BaseDr


class Roles(BaseDr):
    __tablename__ = "roles"

    id = Column(Integer, primary_key=True, autoincrement=True)
    role = Column(String(50), nullable=False)
