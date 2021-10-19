from django.shortcuts import render
from django.contrib.auth.decorators import login_required, user_passes_test
from .decorators import *
from .helper_functions import *
from .models import *
from .forms import *
from shared.encryption import EncryptionHelper

encryptionHelper = EncryptionHelper()

@login_required(login_url="accounts:loginlink")
@user_passes_test(is_student, login_url="accounts:forbidden")
@password_change_required
def student_dashboard(request):
    return render(
        request,
        "student/student_dashboard.html",
        {"page_type": "student_dashboard"},
    )

@login_required(login_url="accounts:loginlink")
@user_passes_test(
    lambda user: is_student(user),
    login_url="accounts:forbidden",
)
def view_student_profile(request):
    if request.method == "GET":
        user = request.user
        if is_student(user):
            student = StudentsInfo.objects.filter(user=user).first()

            student.fname = encryptionHelper.decrypt(student.fname)
            student.lname = encryptionHelper.decrypt(student.lname)
            student.rollno = encryptionHelper.decrypt(student.rollno)

            if student.mname:
                student.mname = encryptionHelper.decrypt(student.mname)
                if student.mname == '':
                    student.mname = ""
            else:
                student.mname = ""
            
            if student.aadhar:
                student.aadhar = encryptionHelper.decrypt(student.aadhar)
                if student.aadhar == '':
                    student.aadhar = "-"
            else:
                student.aadhar = "-"
            
            if student.email:
                student.email = encryptionHelper.decrypt(student.email)
                if student.email == '':
                    student.email = "-"
            else:
                student.email = "-"
            
            if student.mobile_no:
                student.mobile_no = encryptionHelper.decrypt(student.mobile_no)
                if student.mobile_no == '':
                    student.mobile_no = "-"
            else:
                student.mobile_no = "-"

            student.dob = encryptionHelper.decrypt(student.dob)
            student.gender = encryptionHelper.decrypt(student.gender)
            student.pincode = encryptionHelper.decrypt(student.pincode)
            
            return render( request, "student/view_student_profile.html", {"page_type": "view_student_profile", "student": student})

@login_required(login_url="accounts:loginlink")
@user_passes_test(
    lambda user: is_student(user),
    login_url="accounts:forbidden",
)
def edit_student_profile(request):
    if request.method == "GET":
        student = StudentsInfo.objects.filter(user=request.user).first()
        initial_dict = {
            "fname": encryptionHelper.decrypt(student.fname),
            "lname": encryptionHelper.decrypt(student.lname),
            "profile_pic": student.profile_pic,
            "dob": encryptionHelper.decrypt(student.dob),
            "gender": encryptionHelper.decrypt(student.gender),
            "pincode": encryptionHelper.decrypt(student.pincode),
            "rollno": encryptionHelper.decrypt(student.rollno),
            "organization": student.organization,
        }

        if student.mname:
            initial_dict["mname"] = encryptionHelper.decrypt(student.mname)
        if student.aadhar:
            initial_dict["aadhar"] = encryptionHelper.decrypt(student.aadhar)
        if student.email:
            initial_dict["email"] = encryptionHelper.decrypt(student.email)
        if student.mobile_no:
            initial_dict["mobile_no"] = encryptionHelper.decrypt(student.mobile_no)

        form = StudentsInfoForm(request.POST or None, initial = initial_dict)

        return render(
            request, "student/update_students_info.html",
            {
                "form": form,
                "valid_state": True,
                "valid_city": True,
                "state": student.state,
                "city": student.city
            },
        )
    else:
        form = StudentsInfoForm(request.POST, request.FILES)

        if form.is_valid():
            temp = check_state_city(True, 0, str(request.POST["state"]))
            if temp[0]:
                if not check_state_city(False, temp[1], str(request.POST["city"])):
                    return render(
                        request,
                        "student/update_students_info.html",
                        {
                            "form": form,
                            "valid_state": True,
                            "valid_city": False,
                        },
                    )
            else:
                return render(
                    request,
                    "student/update_students_info.html",
                    {
                        "form": form,
                        "valid_state": False,
                        "valid_city": True,
                    },
                )

            student = StudentsInfo.objects.filter(user=request.user).first()

            if student.mname:
                student.mname = encryptionHelper.encrypt(request.POST["mname"])
            if student.aadhar:
                student.aadhar = encryptionHelper.encrypt(request.POST["aadhar"])
            if student.email:
                student.email = encryptionHelper.encrypt(request.POST["email"])
            if student.mobile_no:
                student.mobile_no = encryptionHelper.encrypt(request.POST["mobile_no"])

            student.fname = encryptionHelper.encrypt(request.POST["fname"])
            student.lname = encryptionHelper.encrypt(request.POST["lname"])
            student.rollno = encryptionHelper.encrypt(request.POST["rollno"])
            student.dob = encryptionHelper.encrypt(request.POST["dob"])
            student.gender = encryptionHelper.encrypt(request.POST["gender"])
            student.organization = Organization(request.POST["organization"])
            student.state = State.objects.get(
                state__icontains=request.POST["state"].strip()
            )
            student.city = City.objects.get(
                city__icontains=request.POST["city"].strip()
            )
            student.pincode = encryptionHelper.encrypt(request.POST["pincode"])

            if request.FILES:
                student.profile_pic = request.FILES["profile_pic"]
            else:
                student.profile_pic = "/default.svg"

            student.save()
            return redirect("accounts:view_student_profile")
        else:
            return render(
                request,
                "student/update_students_info.html",
                {
                    "valid_state": True,
                    "valid_city": True,
                },
            )
