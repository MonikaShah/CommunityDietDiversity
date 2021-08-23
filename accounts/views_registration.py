from django.shortcuts import render, redirect
from django.contrib.auth import login, authenticate, logout
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.models import Group, User
from django.contrib.auth.decorators import login_required, user_passes_test
from .decorators import *
from .models import *
from .forms import *
from .helper_functions import *
from shared.encryption import EncryptionHelper

encryptionHelper = EncryptionHelper()


def root(request):
    return redirect("accounts:loginlink")


@registration_data_cleanup
@redirect_to_dashboard
def loginU(request):
    if request.method == "GET":
        form = CustomAuthenticationForm()
        return render(request, "registration/login.html", {"form": form})
    else:
        form = CustomAuthenticationForm(request.POST)
        username = request.POST["username"]
        password = request.POST["password"]
        grp = request.POST["groups"]
        if User.objects.filter(username=username).exists():
            user = User.objects.get(username=username)
            if user.check_password(password):
                our_user = custom_user_filter(user)
                if our_user == None:
                    return render(
                        request,
                        "registration/login.html",
                        {"form": form, "my_messages": {"error": "Access Denied."}},
                    )
                else:
                    grp_name = our_user[1]
                    grp = Group.objects.get(pk=grp).name
                    if grp_name == grp:
                        user_authenticated = authenticate(
                            request, username=username, password=password
                        )
                        request.session.set_expiry(86400)
                        login(request, user_authenticated)
                        if grp_name == "Parents":
                            return redirect("accounts:parent_dashboard")
                        elif grp_name == "Students":
                            return redirect("accounts:student_dashboard")
                        elif grp_name == "Teachers":
                            return redirect("accounts:teacher_all_sessions")
                        elif grp_name == "Coordinators":
                            return redirect("accounts:coordinator_dashboard")
                        elif grp_name == "Super Coordinators":
                            return redirect("accounts:supercoordinator_dashboard")
                    else:
                        return render(
                            request,
                            "registration/login.html",
                            {
                                "form": form,
                                "my_messages": {"error": "Invalid Credentials."},
                            },
                        )
            else:
                return render(
                    request,
                    "registration/login.html",
                    {
                        "form": form,
                        "my_messages": {"error": "Invalid Credentials."},
                    },
                )
        else:
            return render(
                request,
                "registration/login.html",
                {"form": form, "my_messages": {"error": "Invalid Credentials."}},
            )


@login_required(login_url="accounts:loginlink")
def logoutU(request):
    logout(request)
    return redirect("accounts:loginlink")


@registration_data_cleanup
@redirect_to_dashboard
def registration(request):
    if request.method == "GET":
        form = RegistrationForm()
        return render(request, "registration/registration.html", {"form": form})
    else:
        form = RegistrationForm(request.POST)
        if form.is_valid():
            dob = request.POST["dob"]
            request.session["dob"] = dob
            request.session["registration_visited"] = True
            if is_adult_func(dob) == "True":
                return redirect("accounts:consent_adult")
            else:
                return redirect("accounts:consent")
        else:
            return render(request, "registration/registration.html", {"form": form})


@redirect_to_dashboard
def consent(request):
    if "registration_visited" not in request.session:
        return redirect("accounts:registration")
    if request.method == "GET":
        if request.session.get("consent_data"):
            form = ConsentForm(request.session.get("consent_data"))
        else:
            form = ConsentForm()
        return render(
            request, "registration/consent.html", {"form": form, "is_adult": False}
        )
    else:
        form = ConsentForm(request.POST)
        if form.is_valid():
            request.session["consent_visited"] = True
            request.session["consent_data"] = request.POST
            return redirect("accounts:students_info")
        else:
            return render(
                request, "registration/consent.html", {"form": form, "is_adult": False}
            )


@redirect_to_dashboard
def consent_adult(request):
    if "registration_visited" not in request.session:
        return redirect("accounts:registration")
    if request.method == "GET":
        if request.session.get("consent_data"):
            form = ConsentForm(request.session.get("consent_data"))
        else:
            form = ConsentForm()
        return render(
            request, "registration/consent.html", {"form": form, "is_adult": True}
        )
    else:
        form = ConsentForm(request.POST)
        if form.is_valid():
            request.session["consent_visited"] = True
            request.session["consent_data"] = request.POST
            return redirect("accounts:students_info_adult")
        else:
            return render(
                request, "registration/consent.html", {"form": form, "is_adult": True}
            )


@redirect_to_dashboard
def parents_info(request):
    if "registration_visited" not in request.session:
        return redirect("accounts:registration")
    if "consent_visited" not in request.session:
        return redirect("accounts:consent")
    if request.method == "GET":
        if request.session.get("data"):
            form = ParentsInfoForm(request.session.get("data"))
            user_creation_form = UserCreationForm(request.session.get("data"))
        else:
            form = ParentsInfoForm()
            user_creation_form = UserCreationForm()
        return render(
            request,
            "registration/parents_info.html",
            {
                "form": form,
                "user_creation_form": user_creation_form,
                "valid_state": True,
                "valid_city": True,
            },
        )
    else:
        form = ParentsInfoForm(request.POST)
        user_creation_form = UserCreationForm(request.POST)

        if form.is_valid() and user_creation_form.is_valid():
            temp = check_state_city(True, 0, str(request.POST["state"]))
            if temp[0]:
                if not check_state_city(False, temp[1], str(request.POST["city"])):
                    return render(
                        request,
                        "registration/parents_info.html",
                        {
                            "form": form,
                            "user_creation_form": user_creation_form,
                            "valid_state": True,
                            "valid_city": False,
                        },
                    )
            else:
                return render(
                    request,
                    "registration/parents_info.html",
                    {
                        "form": form,
                        "user_creation_form": user_creation_form,
                        "valid_state": False,
                        "valid_city": True,
                    },
                )
            request.session["data"] = request.POST
            request.session["parents_info_visited"] = True
            return redirect("accounts:students_info")
        else:
            return render(
                request,
                "registration/parents_info.html",
                {
                    "form": form,
                    "user_creation_form": user_creation_form,
                    "valid_state": True,
                    "valid_city": True,
                },
            )


@redirect_to_dashboard
def students_info(request, is_adult=False):
    if is_adult:
        if "registration_visited" not in request.session:
            return redirect("accounts:registration")
        if "consent_visited" not in request.session:
            return redirect("accounts:consent_adult")
    else:
        if "registration_visited" not in request.session:
            return redirect("accounts:registration")
        if "consent_visited" not in request.session:
            return redirect("accounts:consent")
        if "parents_info_visited" not in request.session:
            return redirect("accounts:parents_info")
    student_dob = request.session["dob"]
    if request.method == "GET":
        form = StudentsInfoForm()
        user_creation_form = UserCreationForm()
        return render(
            request,
            "registration/students_info.html",
            {
                "form": form,
                "user_creation_form": user_creation_form,
                "is_adult": is_adult,
                "student_dob": student_dob,
                "valid_state": True,
                "valid_city": True,
            },
        )
    else:
        if not is_adult:
            previousPOST = request.session["data"]
            form = StudentsInfoForm(request.POST)
            studentuserform = UserCreationForm(request.POST)
            parentform = ParentsInfoForm(previousPOST)
            parentuserform = UserCreationForm(previousPOST)
            if form.is_valid() and studentuserform.is_valid():
                temp = check_state_city(True, 0, str(request.POST["state"]))
                if temp[0]:
                    if not check_state_city(False, temp[1], str(request.POST["city"])):
                        return render(
                            request,
                            "registration/students_info.html",
                            {
                                "form": form,
                                "user_creation_form": studentuserform,
                                "is_adult": is_adult,
                                "student_dob": student_dob,
                                "valid_state": True,
                                "valid_city": False,
                            },
                        )
                else:
                    return render(
                        request,
                        "registration/students_info.html",
                        {
                            "form": form,
                            "user_creation_form": studentuserform,
                            "is_adult": is_adult,
                            "student_dob": student_dob,
                            "valid_state": False,
                            "valid_city": True,
                        },
                    )
                parentUser = parentuserform.save(commit=False)
                parentUser.save()
                parent_group = Group.objects.get(name="Parents")
                parentUser.groups.add(parent_group)
                parentUser.save()

                parent = parentform.save(commit=False)
                parent.user = parentUser
                parent.email = encryptionHelper.encrypt(previousPOST["email"])
                parent.name = encryptionHelper.encrypt(previousPOST["name"])
                parent.dob = encryptionHelper.encrypt(previousPOST["dob"])
                parent.mobile_no = encryptionHelper.encrypt(previousPOST["mobile_no"])
                parent.gender = encryptionHelper.encrypt(previousPOST["gender"])
                parent.state = State.objects.get(
                    state__icontains=previousPOST["state"].strip()
                )
                parent.city = City.objects.get(
                    city__icontains=previousPOST["city"].strip()
                )
                parent.address = encryptionHelper.encrypt(previousPOST["address"])
                parent.pincode = encryptionHelper.encrypt(previousPOST["pincode"])
                parent.no_of_family_members = encryptionHelper.encrypt(
                    previousPOST["no_of_family_members"]
                )
                parent.children_count = encryptionHelper.encrypt(
                    previousPOST["children_count"]
                )
                parent.save()

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
                student.dob = encryptionHelper.encrypt(student_dob)
                student.mobile_no = encryptionHelper.encrypt(request.POST["mobile_no"])
                student.gender = encryptionHelper.encrypt(request.POST["gender"])
                student.adult = encryptionHelper.encrypt(is_adult_func(student_dob))
                student.state = State.objects.get(
                    state__icontains=request.POST["state"].strip()
                )
                student.city = City.objects.get(
                    city__icontains=request.POST["city"].strip()
                )
                student.pincode = encryptionHelper.encrypt(request.POST["pincode"])
                student.address = encryptionHelper.encrypt(request.POST["address"])
                student.parent = parent
                student.save()

                user = authenticate(
                    request,
                    username=previousPOST["username"],
                    password=previousPOST["password1"],
                )
                request.session.set_expiry(86400)
                if user is not None:
                    login(request, user)

                del request.session["consent_data"]
                del request.session["data"]
                del request.session["dob"]
                del request.session["registration_visited"]
                del request.session["consent_visited"]
                del request.session["parents_info_visited"]
                return redirect("accounts:parent_dashboard")
            else:
                return render(
                    request,
                    "registration/students_info.html",
                    {
                        "form": form,
                        "user_creation_form": studentuserform,
                        "is_adult": is_adult,
                        "student_dob": student_dob,
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
                            "registration/students_info.html",
                            {
                                "form": form,
                                "user_creation_form": studentuserform,
                                "is_adult": is_adult,
                                "student_dob": student_dob,
                                "valid_state": True,
                                "valid_city": False,
                            },
                        )
                else:
                    return render(
                        request,
                        "registration/students_info.html",
                        {
                            "form": form,
                            "user_creation_form": studentuserform,
                            "is_adult": is_adult,
                            "student_dob": student_dob,
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
                student.dob = encryptionHelper.encrypt(student_dob)
                student.mobile_no = encryptionHelper.encrypt(request.POST["mobile_no"])
                student.gender = encryptionHelper.encrypt(request.POST["gender"])
                student.adult = encryptionHelper.encrypt(is_adult_func(student_dob))
                student.state = State.objects.get(
                    state__icontains=request.POST["state"].strip()
                )
                student.city = City.objects.get(
                    city__icontains=request.POST["city"].strip()
                )
                student.pincode = encryptionHelper.encrypt(request.POST["pincode"])
                student.address = encryptionHelper.encrypt(request.POST["address"])
                student.save()

                user = authenticate(
                    request,
                    username=request.POST["username"],
                    password=request.POST["password1"],
                )
                request.session.set_expiry(86400)
                if user is not None:
                    login(request, user)

                del request.session["consent_data"]
                del request.session["dob"]
                del request.session["registration_visited"]
                del request.session["consent_visited"]
                return redirect("accounts:student_dashboard")
            else:
                return render(
                    request,
                    "registration/students_info.html",
                    {
                        "form": form,
                        "user_creation_form": studentuserform,
                        "is_adult": is_adult,
                        "student_dob": student_dob,
                        "valid_state": True,
                        "valid_city": True,
                    },
                )


@redirect_to_dashboard
def students_info_adult(request):
    return students_info(request, True)


@login_required(login_url="accounts:loginlink")
@user_passes_test(is_admin, login_url="accounts:forbidden")
def addSuperCoordinatorForm(request):
    if request.method == "GET":
        form = SuperCoordinatorsInfoForm()
        user_creation_form = UserCreationForm()
        return render(
            request,
            "registration/add_supercoordinator.html",
            {"form": form, "user_creation_form": user_creation_form},
        )
    else:
        form = SuperCoordinatorsInfoForm(request.POST)
        supercoordinatoruserform = UserCreationForm(request.POST)
        if form.is_valid() and supercoordinatoruserform.is_valid():
            supercoordinatoruser = supercoordinatoruserform.save(commit=False)
            supercoordinatoruser.save()
            supercoordinator_group = Group.objects.get(name="Super Coordinators")
            supercoordinatoruser.groups.add(supercoordinator_group)
            supercoordinatoruser.save()
            supercoordinator = form.save(commit=False)
            supercoordinator.user = supercoordinatoruser
            supercoordinator.email = encryptionHelper.encrypt(request.POST["email"])
            supercoordinator.name = encryptionHelper.encrypt(request.POST["name"])
            supercoordinator.dob = encryptionHelper.encrypt(request.POST["dob"])
            supercoordinator.gender = encryptionHelper.encrypt(request.POST["gender"])
            supercoordinator.mobile_no = encryptionHelper.encrypt(
                request.POST["mobile_no"]
            )
            supercoordinator.save()
            return redirect("accounts:add_supercoordinator_form")
        else:
            return render(
                request,
                "registration/add_supercoordinator.html",
                {"form": form, "user_creation_form": supercoordinatoruserform},
            )