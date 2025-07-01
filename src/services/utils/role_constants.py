from enum import Enum


class RoleEnum(Enum):
    APP_ADMIN = (1, "App-admin")
    EXECUTIVE = (2, "Executive")
    INVENTOR = (3, "Inventor")
    PATENT_AGENT = (4, "Patent Agent")
    PARALEGAL = (5, "Paralegal")
    MANAGER_INTERNAL = (6, "Manager(Internal)")
    DRAFTER = (7, "Drafter")
    ANALYST = (8, "Analyst")
    OUTSIDE_AGENT = (9, "Outside Agent")
    REVIEWER = (10, "Reviewer")
    APP_USER = (11, "App-user")

    def __init__(self, role_id, role_name):
        self.id = role_id
        self.label = role_name

    @classmethod
    def get_id_by_name(cls, name: str):
        for role in cls:
            if role.label.lower() == name.lower():
                return role.id
        return None
