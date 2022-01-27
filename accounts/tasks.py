from __future__ import absolute_import, unicode_literals
from celery import shared_task
from django.core.mail import EmailMessage
from django.template.loader import get_template
from django.utils import timezone
from shared.encryption import EncryptionHelper
from .models import *
from .helper_functions import *

encryptionHelper = EncryptionHelper()

@shared_task
def new_physique_form():
    oldform = InfoFormDetails.objects.get(open= True,)
    oldform.open = False
    oldform.end_timestamp = timezone.now()
    oldform.save()
    form= InfoFormDetails(start_timestamp = timezone.now())
    form.open= True
    form.form = Form.objects.get(name='physique')
    form.save()
    students = StudentsInfo.objects.filter(session__isnull=False)
    required_students=[]
    for student in students:
        if student.email:
            student.fname = encryptionHelper.decrypt(student.fname)
            student.lname = encryptionHelper.decrypt(student.lname)
            if student.mname:
                student.mname = encryptionHelper.decrypt(student.mname)
            else:
                student.mname = ""
            student.email = encryptionHelper.decrypt(student.email)
            required_students.append(student)
    for student in required_students:
        print(student.fname)
        send_review_email(student)


def send_review_email(student):
    token="abc"
    message = get_template("student/email_template.html",).render({"user": student.fname,})
    msg = EmailMessage(
        "Reminder to fill in your form" + str(token),
        message,
        None,
        [str(student.email)],
    )
    msg.content_subtype = "html"
    msg.send(fail_silently=True)