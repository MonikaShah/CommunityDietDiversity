from django.shortcuts import render
from django.contrib.auth.decorators import login_required, user_passes_test
from .decorators import *
from .helper_functions import *


@login_required(login_url="accounts:loginlink")
@user_passes_test(is_student, login_url="accounts:forbidden")
@password_change_required
def student_dashboard(request):
    return render(
        request,
        "student/student_dashboard.html",
        {"page_type": "student_dashboard"},
    )