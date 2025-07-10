from sqlalchemy import Column, Integer, String, SmallInteger, ForeignKey
from sqlalchemy.dialects.mysql import CHAR
from sqlalchemy.orm import relationship
from models import BaseAnnuity


class User(BaseAnnuity):
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
    attorney_checklist_configs = relationship(
        "AttorneyChecklistConfig",
        back_populates="attorney",
        foreign_keys="AttorneyChecklistConfig.attorney_id",
    )
    added_checklist_configs = relationship(
        "AttorneyChecklistConfig",
        back_populates="added_by_user",
        foreign_keys="AttorneyChecklistConfig.added_by",
    )
    bl_checklist_configs = relationship(
        "BLChecklistConfig",
        back_populates="user",
        foreign_keys="BLChecklistConfig.added_by",
    )
    annuity_payment_records = relationship(
        "AnnuityPaymentRecord",
        back_populates="payer",
        foreign_keys="AnnuityPaymentRecord.payment_made_by",
    )
