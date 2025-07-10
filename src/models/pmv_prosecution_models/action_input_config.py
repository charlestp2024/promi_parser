# models/pmv_prosecution_models/action_input_config.py

from sqlalchemy import Column, Integer, String, Boolean, ForeignKey
from sqlalchemy.orm import relationship
from models import BaseProsecution  # Shared base from models/__init__.py


class ActionInputConfig(BaseProsecution):
    __tablename__ = "action_input_config"

    # Primary key
    id = Column(Integer, primary_key=True, autoincrement=True)

    # Foreign key to Actions table
    action_id = Column(Integer, ForeignKey("actions.id"))
    actions = relationship("Actions", back_populates="action_input_config")

    # Configuration fields
    label = Column(String(255))
    placeholder = Column(String(255))
    sub_text = Column(String(255))
    type = Column(String(255))
    mandatory = Column(Boolean, nullable=True)
    additional_detail = Column(Boolean, nullable=True)
    name = Column(String(255))
    btn_label = Column(String(255))
    no_data_label = Column(String(255))
    mailing_reminder = Column(Boolean, nullable=True)

    order_id = Column(Integer)
