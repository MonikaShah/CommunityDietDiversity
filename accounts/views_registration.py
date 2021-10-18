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
        form.fields["dob"].initial = student_dob
        form.fields["dob"].disabled = True
        user_creation_form = UserCreationForm()
        return render(
            request,
            "registration/students_info.html",
            {
                "form": form,
                "user_creation_form": user_creation_form,
                "is_adult": is_adult,
                "valid_state": True,
                "valid_city": True,
            },
        )
    else:
        if not is_adult:
            previousPOST = request.session["data"]
            form = StudentsInfoForm(request.POST)
            form.fields["dob"].initial = student_dob
            form.fields["dob"].disabled = True
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
                parent.fname = encryptionHelper.encrypt(previousPOST["fname"])
                parent.mname = encryptionHelper.encrypt(previousPOST["mname"])
                parent.lname = encryptionHelper.encrypt(previousPOST["lname"])
                parent.aadhar = encryptionHelper.encrypt(previousPOST["aadhar"])
                parent.dob = encryptionHelper.encrypt(previousPOST["dob"])
                parent.mobile_no = encryptionHelper.encrypt(previousPOST["mobile_no"])
                parent.gender = encryptionHelper.encrypt(previousPOST["gender"])
                parent.state = State.objects.get(
                    state__icontains=previousPOST["state"].strip()
                )
                parent.city = City.objects.get(
                    city__icontains=previousPOST["city"].strip()
                )
                parent.pincode = encryptionHelper.encrypt(previousPOST["pincode"])
                parent.profile_pic = "/undraw_profile.svg"
                parent.save()

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
                student.email = encryptionHelper.encrypt(request.POST["email"])
                student.dob = encryptionHelper.encrypt(student_dob)
                student.aadhar = encryptionHelper.encrypt(request.POST["aadhar"])
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
                        "valid_state": True,
                        "valid_city": True,
                    },
                )
        else:
            form = StudentsInfoForm(request.POST)
            form.fields["dob"].initial = student_dob
            form.fields["dob"].disabled = True
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
                student.fname = encryptionHelper.encrypt(request.POST["fname"])
                student.mname = encryptionHelper.encrypt(request.POST["mname"])
                student.lname = encryptionHelper.encrypt(request.POST["lname"])
                student.email = encryptionHelper.encrypt(request.POST["email"])
                student.aadhar = encryptionHelper.encrypt(request.POST["aadhar"])
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
            supercoordinator.fname = encryptionHelper.encrypt(request.POST["fname"])
            supercoordinator.mname = encryptionHelper.encrypt(request.POST["mname"])
            supercoordinator.lname = encryptionHelper.encrypt(request.POST["lname"])
            supercoordinator.aadhar = encryptionHelper.encrypt(request.POST["aadhar"])
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

@login_required(login_url="accounts:loginlink")
@user_passes_test(
    lambda user: is_supercoordinator(user)
    or is_coordinator(user)
    or is_teacher(user)
    or is_parent(user)
    or is_student(user),
    login_url="accounts:forbidden",
)
def view_profile(request):
    if request.method == "GET":
        user = request.user
        if is_parent(user):
            parent = ParentsInfo.objects.filter(user=user).first()
            parent.name = encryptionHelper.decrypt(parent.name)
            parent.email = encryptionHelper.decrypt(parent.email)
            parent.mobile_no = encryptionHelper.decrypt(parent.mobile_no)
            parent.dob = encryptionHelper.decrypt(parent.dob)
            parent.gender = encryptionHelper.decrypt(parent.gender)
            parent.pincode = encryptionHelper.decrypt(parent.pincode)
            parent.no_of_family_members = encryptionHelper.decrypt(parent.no_of_family_members)
            parent.children_count = encryptionHelper.decrypt(parent.children_count)
            
            return render( request, "registration/view_profile.html", {"page_type": "view_profile", "parent": parent})

@login_required(login_url="accounts:loginlink")
@user_passes_test(
    lambda user: is_supercoordinator(user)
    or is_coordinator(user)
    or is_teacher(user)
    or is_parent(user)
    or is_student(user),
    login_url="accounts:forbidden",
)
def edit_profile(request):
    if request.method == "GET":
        parent = ParentsInfo.objects.filter(user=request.user).first()
        initial_dict = {
            "name": encryptionHelper.decrypt(parent.name),
            "profile_pic": parent.profile_pic,
            "email": encryptionHelper.decrypt(parent.email),
            "mobile_no": encryptionHelper.decrypt(parent.mobile_no),
            "dob": encryptionHelper.decrypt(parent.dob),
            "gender": encryptionHelper.decrypt(parent.gender),
            "pincode": encryptionHelper.decrypt(parent.pincode),
            "no_of_family_members": encryptionHelper.decrypt(parent.no_of_family_members),
            "children_count": encryptionHelper.decrypt(parent.children_count),
            "edu": parent.edu,
            "occupation": parent.occupation,
            "type_of_family": parent.type_of_family,
            "religion": parent.religion,
        }
        form = ParentsInfoForm(request.POST or None, initial = initial_dict)
        return render(
            request, "registration/update_parents_info.html",
            {
                "form": form,
                "valid_state": True,
                "valid_city": True,
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
                        "registration/update_parents_info.html",
                        {
                            "form": form,
                            "valid_state": True,
                            "valid_city": False,
                        },
                    )
            else:
                return render(
                    request,
                    "registration/update_parents_info.html",
                    {
                        "form": form,
                        "valid_state": False,
                        "valid_city": True,
                    },
                )

            parent = ParentsInfo.objects.filter(user=request.user).first()
            parent.email = encryptionHelper.encrypt(request.POST["email"])
            parent.name = encryptionHelper.encrypt(request.POST["name"])
            parent.dob = encryptionHelper.encrypt(request.POST["dob"])
            parent.mobile_no = encryptionHelper.encrypt(request.POST["mobile_no"])
            parent.gender = encryptionHelper.encrypt(request.POST["gender"])
            parent.state = State.objects.get(
                state__icontains=request.POST["state"].strip()
            )
            parent.city = City.objects.get(
                city__icontains=request.POST["city"].strip()
            )
            parent.address = encryptionHelper.encrypt(request.POST["address"])
            parent.edu = Education(request.POST["edu"])
            parent.religion = ReligiousBelief(request.POST["religion"])
            parent.occupation = Occupation(request.POST["occupation"])
            parent.pincode = encryptionHelper.encrypt(request.POST["pincode"])
            parent.no_of_family_members = encryptionHelper.encrypt(
                request.POST["no_of_family_members"]
            )
            parent.type_of_family = FamilyType(request.POST["type_of_family"])
            parent.children_count = encryptionHelper.encrypt(
                request.POST["children_count"]
            )
            if request.FILES:
                parent.profile_pic = request.FILES["profile_pic"]
            else:
                parent.profile_pic = "/undraw_profile.svg"

            parent.save()
            return redirect("accounts:view_profile")
        else:
            return render(
                request,
                "registration/update_parents_info.html",
                {
                    "valid_state": True,
                    "valid_city": True,
                },
            )

        