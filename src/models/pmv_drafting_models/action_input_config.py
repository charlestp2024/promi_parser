from sqlalchemy import Column, Integer, String, Boolean, ForeignKey, TIMESTAMP
from sqlalchemy.orm import relationship
from models import BaseDrafting


class ActionInputConfig(BaseDrafting):
    __tablename__ = "action_input_config"

    # ---------------------- Normal Fields ----------------------
    id = Column(Integer, primary_key=True, autoincrement=True, nullable=False)

    created_on = Column(TIMESTAMP)
    modified_on = Column(TIMESTAMP)

    label = Column(String(300))
    type = Column(String(300))
    placeholder = Column(String(300))
    sub_text = Column(String(300))
    btn_label = Column(String(300))
    no_data_label = Column(String(300))

    order_no = Column(Integer, nullable=False)
    attachment_required = Column(Boolean, nullable=False)
    reminder_config = Column(Boolean, nullable=False)
    mandatory = Column(Boolean, nullable=False)

    # ---------------------- Relationship Fields ----------------------
    action_id = Column(Integer, ForeignKey("actions.id"))
    actions = relationship("Actions", back_populates="action_inputs")
