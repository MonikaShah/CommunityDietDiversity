from django.shortcuts import render, redirect
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.decorators import login_required, user_passes_test
from .decorators import *
from .models import *
from .forms import *
from .helper_functions import *
from shared.encryption import EncryptionHelper
from django.conf import settings

encryptionHelper = EncryptionHelper()


@login_required(login_url="accounts:loginlink")
@user_passes_test(is_parent, login_url="accounts:forbidden")
@password_change_required
def parent_dashboard(request):
    students = (
        ParentsInfo.objects.filter(user=request.user).first().studentsinfo_set.all()
    )
    for student in students:
        student.fname = encryptionHelper.decrypt(student.fname)
        student.lname = encryptionHelper.decrypt(student.lname)
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
            if is_adult_func(request.POST["dob"]) == "True":
                form.add_error(
                    "dob", "Students of age 18+ need to register by themselves."
                )
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
            studentuser = studentuserform.save(commit=False)
            studentuser.save()
            student_group = Group.objects.get(name="Students")
            studentuser.groups.add(student_group)
            studentuser.save()
            student = form.save(commit=False)
            student.user = studentuser
            student.rollno = encryptionHelper.encrypt(request.POST["rollno"])
            student.fname = encryptionHelper.encrypt(request.POST["fname"])
            student.mname = encryptionHelper.encrypt(request.POST["mname"])
            student.lname = encryptionHelper.encrypt(request.POST["lname"])
            student.aadhar = encryptionHelper.encrypt(request.POST["aadhar"])
            student.email = encryptionHelper.encrypt(request.POST["email"])
            student.dob = encryptionHelper.encrypt(request.POST["dob"])
            student.mobile_no = encryptionHelper.encrypt(request.POST["mobile_no"])
            student.gender = encryptionHelper.encrypt(request.POST["gender"])
            student.adult = encryptionHelper.encrypt(str("False"))
            student.state = State.objects.get(
                state__icontains=request.POST["state"].strip()
            )
            student.city = City.objects.get(
                city__icontains=request.POST["city"].strip()
            )
            student.pincode = encryptionHelper.encrypt(request.POST["pincode"])
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

@login_required(login_url="accounts:loginlink")
@user_passes_test(
    lambda user: is_parent(user),
    login_url="accounts:forbidden",
)
def view_parent_profile(request):
    if request.method == "GET":
        user = request.user
        if is_parent(user):
            parent = ParentsInfo.objects.filter(user=user).first()

            parent.fname = encryptionHelper.decrypt(parent.fname)
            parent.lname = encryptionHelper.decrypt(parent.lname)

            if parent.mname:
                parent.mname = encryptionHelper.decrypt(parent.mname)
                if parent.mname == '':
                    parent.mname = ""
            else:
                parent.mname = ""
            
            if parent.aadhar:
                parent.aadhar = encryptionHelper.decrypt(parent.aadhar)
                if parent.aadhar == '':
                    parent.aadhar = "-"
            else:
                parent.aadhar = "-"
            
            if parent.email:
                parent.email = encryptionHelper.decrypt(parent.email)
                if parent.email == '':
                    parent.email = "-"
            else:
                parent.email = "-"
            
            if parent.mobile_no:
                parent.mobile_no = encryptionHelper.decrypt(parent.mobile_no)
                if parent.mobile_no == '':
                    parent.mobile_no = "-"
            else:
                parent.mobile_no = "-"

            parent.dob = encryptionHelper.decrypt(parent.dob)
            parent.gender = encryptionHelper.decrypt(parent.gender)
            parent.pincode = encryptionHelper.decrypt(parent.pincode)
            
            return render( request, "parent/view_parent_profile.html", {"page_type": "view_parent_profile", "parent": parent})

@login_required(login_url="accounts:loginlink")
@user_passes_test(
    lambda user: is_parent(user),
    login_url="accounts:forbidden",
)
def edit_parent_profile(request):
    if request.method == "GET":
        parent = ParentsInfo.objects.filter(user=request.user).first()
        initial_dict = {
            "fname": encryptionHelper.decrypt(parent.fname),
            "lname": encryptionHelper.decrypt(parent.lname),
            "profile_pic": parent.profile_pic,
            "dob": encryptionHelper.decrypt(parent.dob),
            "gender": encryptionHelper.decrypt(parent.gender),
            "pincode": encryptionHelper.decrypt(parent.pincode),
        }

        if parent.mname:
            initial_dict["mname"] = encryptionHelper.decrypt(parent.mname)
        if parent.aadhar:
            initial_dict["aadhar"] = encryptionHelper.decrypt(parent.aadhar)
        if parent.email:
            initial_dict["email"] = encryptionHelper.decrypt(parent.email)
        if parent.mobile_no:
            initial_dict["mobile_no"] = encryptionHelper.decrypt(parent.mobile_no)

        form = ParentsInfoForm(request.POST or None, initial = initial_dict)

        return render(
            request, "parent/update_parents_info.html",
            {
                "form": form,
                "valid_state": True,
                "valid_city": True
            },
        )
    else:
        form = ParentsInfoForm(request.POST, request.FILES)

        if form.is_valid():
            temp = check_state_city(True, 0, str(request.POST["state"]))
            if temp[0]:
                if not check_state_city(False, temp[1], str(request.POST["city"])):
                    return render(
                        request,
                        "parent/update_parents_info.html",
                        {
                            "form": form,
                            "valid_state": True,
                            "valid_city": False,
                        },
                    )
            else:
                return render(
                    request,
                    "parent/update_parents_info.html",
                    {
                        "form": form,
                        "valid_state": False,
                        "valid_city": True,
                    },
                )

            parent = ParentsInfo.objects.filter(user=request.user).first()

            if parent.mname:
                parent.mname = encryptionHelper.encrypt(request.POST["mname"])
            if parent.aadhar:
                parent.aadhar = encryptionHelper.encrypt(request.POST["aadhar"])
            if parent.email:
                parent.email = encryptionHelper.encrypt(request.POST["email"])
            if parent.mobile_no:
                parent.mobile_no = encryptionHelper.encrypt(request.POST["mobile_no"])

            parent.fname = encryptionHelper.encrypt(request.POST["fname"])
            parent.lname = encryptionHelper.encrypt(request.POST["lname"])
            parent.dob = encryptionHelper.encrypt(request.POST["dob"])
            parent.gender = encryptionHelper.encrypt(request.POST["gender"])
            parent.state = State.objects.get(
                state__icontains=request.POST["state"].strip()
            )
            parent.city = City.objects.get(
                city__icontains=request.POST["city"].strip()
            )
            parent.pincode = encryptionHelper.encrypt(request.POST["pincode"])

            if request.FILES:
                x = parent.profile_pic.url.split('/account/media/')
                if x[1] != 'default.svg':
                    file = settings.MEDIA_ROOT + '\\' + x[1]
                    os.remove(file)
                parent.profile_pic = request.FILES["profile_pic"]
            else:
                if "profile_pic-clear" in request.POST.keys():
                    x = parent.profile_pic.url.split('/account/media/')
                    if x[1] != 'default.svg':
                        file = settings.MEDIA_ROOT + '\\' + x[1]
                        os.remove(file)
                    parent.profile_pic = "/default.svg"

            parent.save()
            return redirect("accounts:view_parent_profile")
        else:
            return render(
                request,
                "parent/update_parents_info.html",
                {
                    "valid_state": True,
                    "valid_city": True,
                    "form": form
                },
            )
