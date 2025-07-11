from sqlalchemy.orm import Session
from datetime import datetime

from models.pmv_dca_models import CasereferenceAnnuityReminder,CasereferenceAnnuity,Casereference, ReminderMailTemplate


from services.pmv_dca_services.utils.date_utils import subtract_date, get_yyyymmdd_date


def generate_annuity_reminders_for_case(session: Session, casereference_id: int):
    annuities = session.query(CasereferenceAnnuity).filter_by(casereference_id=casereference_id).all()
    templates = session.query(ReminderMailTemplate).all()

    for annuity in annuities:
        for template in templates:
            reminder_date = subtract_date(annuity.annuity_date, template.reminder_count, template.reminder_type)
            
            existing = session.query(CasereferenceAnnuityReminder).filter_by(
                casereference_id=casereference_id,
                annuity=annuity.annuity,
                template_id=template.id
            ).first()

            if existing:
                existing.reminder_date = reminder_date
                existing.sent = False
            else:
                reminder = CasereferenceAnnuityReminder(
                    casereference_id=casereference_id,
                    annuity=annuity.annuity,
                    template_id=template.id,
                    reminder_date=reminder_date,
                    sent=False
                )
                session.add(reminder)
