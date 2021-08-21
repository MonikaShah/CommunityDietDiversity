from django.shortcuts import render, redirect
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.decorators import login_required, user_passes_test
from .decorators import *
from .models import *
from .forms import *
from .helper_functions import *
from shared.encryption import EncryptionHelper

encryptionHelper = EncryptionHelper()


@login_required(login_url="accounts:loginlink")
@user_passes_test(is_parent, login_url="accounts:forbidden")
@password_change_required
def parent_dashboard(request):
    students = (
        ParentsInfo.objects.filter(user=request.user).first().studentsinfo_set.all()
    )
    for student in students:
        student.name = encryptionHelper.decrypt(student.name)
    return render(
        request,
        "parent/parent_dashboard.html",
        {"students": students, "page_type": "parent_dashboard"},
    )


@login_required(login_url="accounts:loginlink")
@user_passes_test(is_parent, login_url="accounts:forbidden")
@password_change_required
def addStudentForm(request):
    if request.method == "GET":
        form = StudentsInfoForm()
        user_creation_form = UserCreationForm()
        return render(
            request,
            "parent/add_student.html",
            {
                "form": form,
                "user_creation_form": user_creation_form,
                "valid_state": True,
                "valid_city": True,
            },
        )
    else:
        form = StudentsInfoForm(request.POST)
        studentuserform = UserCreationForm(request.POST)
        if form.is_valid() and studentuserform.is_valid():
            temp = check_state_city(True, 0, str(request.POST["state"]))
            if temp[0]:
                if not check_state_city(False, temp[1], str(request.POST["city"])):
                    return render(
                        request,
                        "parent/add_student.html",
                        {
                            "form": form,
                            "user_creation_form": studentuserform,
                            "valid_state": True,
                            "valid_city": False,
                        },
                    )
            else:
                return render(
                    request,
                    "parent/add_student.html",
                    {
                        "form": form,
                        "user_creation_form": studentuserform,
                        "valid_state": False,
                        "valid_city": True,
                    },
                )
            studentuser = studentuserform.save(commit=False)
            studentuser.save()
            student_group = Group.objects.get(name="Students")
            studentuser.groups.add(student_group)
            studentuser.save()
            student = form.save(commit=False)
            student.user = studentuser
            student.rollno = encryptionHelper.encrypt(request.POST["rollno"])
            student.name = encryptionHelper.encrypt(request.POST["name"])
            student.email = encryptionHelper.encrypt(request.POST["email"])
            student.dob = encryptionHelper.encrypt(request.POST["dob"])
            student.mobile_no = encryptionHelper.encrypt(request.POST["mobile_no"])
            student.gender = encryptionHelper.encrypt(request.POST["gender"])
            student.adult = encryptionHelper.encrypt(is_adult_func(request.POST["dob"]))
            student.state = State.objects.get(
                state__icontains=request.POST["state"].strip()
            )
            student.city = City.objects.get(
                city__icontains=request.POST["city"].strip()
            )
            student.pincode = encryptionHelper.encrypt(request.POST["pincode"])
            student.address = encryptionHelper.encrypt(request.POST["address"])
            student.parent = ParentsInfo.objects.filter(user=request.user).first()
            student.first_password = ""
            student.password_changed = True
            student.save()
            return redirect("accounts:parent_dashboard")
        else:
            return render(
                request,
                "parent/add_student.html",
                {
                    "form": form,
                    "user_creation_form": studentuserform,
                    "valid_state": True,
                    "valid_city": True,
                },
            )


@login_required(login_url="accounts:loginlink")
@user_passes_test(is_parent, login_url="accounts:forbidden")
@password_change_required
def showStudent(request, id):
    student = StudentsInfo.objects.get(pk=id)
    return render(request, "parent/student_modules.html", {"student": student})