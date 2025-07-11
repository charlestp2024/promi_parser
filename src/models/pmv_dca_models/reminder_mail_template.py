from sqlalchemy import Column, Integer, String, Text
from sqlalchemy.orm import relationship
from models import BaseDca  # adjust as needed

class ReminderMailTemplate(BaseDca):
    __tablename__ = "reminder_mail_template"

    id = Column(Integer, primary_key=True, autoincrement=True)
    template = Column(Text, nullable=False)
    reminder_name = Column(String(60), nullable=True)
    reminder_count = Column(Integer, nullable=False)
    reminder_type = Column(String(60), nullable=False)


    