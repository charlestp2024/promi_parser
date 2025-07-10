from sqlalchemy import (
    Column,
    Integer,
    String,
    Boolean,
    Date,
    Text,
    ForeignKey,
)
from sqlalchemy.dialects.mysql import CHAR
from sqlalchemy.orm import relationship
from models import BaseAnnuity


class Casereference(BaseAnnuity):
    __tablename__ = "casereference"

    id = Column(Integer, primary_key=True, autoincrement=True)
    docketid = Column(Integer, ForeignKey("docket.id"), nullable=False)
    casenumber = Column(String(255), nullable=False)
    inforce = Column(Boolean, nullable=False)
    priority = Column(Boolean, default=False)
    countryid = Column(Integer, ForeignKey("country.id"), nullable=False)

    priority_date = Column(Date, nullable=True)
    current_attorney = Column(Integer, ForeignKey("user.id"), nullable=False)
    current_annuity_case = Column(Integer, nullable=True)
    latest_annuity_number = Column(Integer, nullable=True)
    current_annuity_decision = Column(Integer, nullable=False, default=0)
    current_annuity_decision_date = Column(Date, nullable=True)

    department_id = Column(CHAR(36), ForeignKey("department.uuid"), nullable=False)
    filingtypeid = Column(Integer, ForeignKey("filing_type.id"), nullable=True)

    grant_date = Column(Date, nullable=True)
    filing_date = Column(Date, nullable=True)
    added_date = Column(Date, nullable=True)
    has_annuity_data = Column(Boolean, default=False)

    publication_number = Column(String(255), nullable=True)
    title = Column(Text, nullable=True)
    combined_inventors = Column(Text, nullable=True)
    espace_publink = Column(Text, nullable=True)
    publicationlink = Column(Text, nullable=True)
    due_date = Column(Date, nullable=True)
    expiry_date = Column(Date, nullable=True)

    client_id = Column(CHAR(36), ForeignKey("client.uuid"), nullable=False)
    system_generated_subdocket_number = Column(String(255), nullable=True)
    tenant_id = Column(CHAR(36), nullable=False)

    # Relationships
    docket = relationship("Docket", back_populates="casereferences")
    department = relationship("Department", back_populates="casereferences")
    country = relationship("Country", back_populates="casereferences")
    user = relationship(
        "User", back_populates="casereferences", foreign_keys=[current_attorney]
    )
    filing_type = relationship("FilingType", back_populates="casereferences")
    client = relationship("Client", back_populates="casereferences")

    casereference_annuity = relationship(
        "CasereferenceAnnuity", back_populates="casereference"
    )
    case_reference_annuity_reminder = relationship(
        "CaseReferenceAnnuityReminder", back_populates="casereference"
    )
