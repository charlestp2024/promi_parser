# models/pmv_dr_models/department_criteria_mapping.py
from __future__ import annotations

from sqlalchemy import Column, Integer, CHAR, ForeignKey
from sqlalchemy.orm import relationship
from models import BaseDr 


class DepartmentCriteriaMapping(BaseDr):
    __tablename__ = "department_criteria_mapping"

    # ---------------- Columns ----------------
    id                 = Column(Integer, primary_key=True, autoincrement=True)
    department_id      = Column(CHAR(36), ForeignKey("department.uuid"), nullable=False)
    parent_criteria_id = Column(Integer,   ForeignKey("ranking_criteria.id"), nullable=False)

    # ---------------- Relationships ----------
    department       = relationship("Department",       back_populates="department_criteria_mappings")
    ranking_criteria = relationship("RankingCriteria",  back_populates="department_criteria_mappings")

    # ---------------- Convenience ------------
    def __repr__(self) -> str:
        return f"<DeptCriteriaMap id={self.id} dept={self.department_id} crit={self.parent_criteria_id}>"
