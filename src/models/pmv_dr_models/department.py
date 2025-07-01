# models/pmv_dr_models/department.py
from __future__ import annotations

import uuid
from sqlalchemy import Column, String, CHAR, ForeignKey
from sqlalchemy.orm import relationship
from models import BaseDr 

class Department(BaseDr):
    __tablename__ = "department"

    # ---------------- Columns ----------------
    uuid        = Column(CHAR(36), primary_key=True, default=lambda: str(uuid.uuid4()))
    department  = Column(String(100), nullable=False)
    tenant_id   = Column(CHAR(36), nullable=False)
    client_id   = Column(CHAR(36), ForeignKey("client.uuid"), nullable=True)

    # ---------------- Relationships ----------------
    dockets                        = relationship(
        "Docket",
        back_populates="department",
        cascade="all, delete-orphan",
        lazy="select"
    )
    department_criteria_mappings   = relationship(
        "DepartmentCriteriaMapping",
        back_populates="department",
        cascade="all, delete-orphan",
        lazy="select"
    )

    # ---------------- Convenience ----------------
    def __repr__(self) -> str:
        return f"<Department uuid={self.uuid} name={self.department}>"
