# models/pmv_prosecution_models/attachment_type.py

from sqlalchemy import Column, Integer, String
from models import BaseProsecution  # Import shared base class


class AttachmentType(BaseProsecution):
    __tablename__ = "attachment_type"

    # Primary key
    id = Column(Integer, primary_key=True, autoincrement=True)

    # Type of attachment
    attachment_type = Column(String(255))
