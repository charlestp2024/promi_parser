# models/pmv_prosecution_models/subdocket_stage_attachment_mapping.py

from sqlalchemy import Column, Integer, String, TIMESTAMP, ForeignKey
from sqlalchemy.dialects.mysql import CHAR
from sqlalchemy.orm import relationship
from models import BaseProsecution  # Shared declarative base

class SubdocketStageAttachmentMapping(BaseProsecution):
    __tablename__ = "subdocket_stage_attachment_mapping"

    # Primary key
    id = Column(Integer, primary_key=True, autoincrement=True)

    # File info
    file_name = Column(String(255))
    file_location = Column(String(1000))

    # Tenant ID
    tenant_id = Column(CHAR(36), nullable=False)

    # Foreign key to Client
    client_id = Column(CHAR(36), ForeignKey("client.id"))


    # Foreign key to SubdocketStagedAction
    subdocket_stage_id = Column(Integer, ForeignKey("subdocket_staged_action.id"))
   
    # Timestamps
    created_on = Column(TIMESTAMP)
    modified_on = Column(TIMESTAMP)
