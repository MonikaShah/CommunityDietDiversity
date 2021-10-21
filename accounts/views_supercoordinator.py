import io
import xlsxwriter
import os
from django.shortcuts import render, redirect
from django.conf import settings
from django.http import HttpResponse
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.models import Group, User
from django.contrib.auth.decorators import login_required, user_passes_test
from .decorators import *
from .models import *
from .forms import *
from .helper_functions import *
from shared.encryption import EncryptionHelper

encryptionHelper = EncryptionHelper()

@login_required(login_url="accounts:loginlink")
@user_passes_test(is_supercoordinator, login_url="accounts:forbidden")
def supercoordinator_dashboard(request):
    organizations = Organization.objects.all()

    return render(
        request,
        "supercoordinator/supercoordinator_dashboard.html",
        {"organizations": organizations, "page_type": "supercoordinator_dashboard"},
    )


@login_required(login_url="accounts:loginlink")
@user_passes_test(is_supercoordinator, login_url="accounts:forbidden")
def addOrganizationForm(request):
    if request.method == "GET":
        form = OrganizationsInfoForm()
        return render(
            request,
            "supercoordinator/add_organization.html",
            {
                "form": form,
                "valid_state": True,
                "valid_city": True,
            },
        )
    else:
        form = OrganizationsInfoForm(request.POST)
        if form.is_valid():
            temp = check_state_city(True, 0, str(request.POST["state"]))
            if temp[0]:
                if not check_state_city(False, temp[1], str(request.POST["city"])):
                    return render(
                        request,
                        "supercoordinator/add_organization.html",
                        {
                            "form": form,
                            "valid_state": True,
                            "valid_city": False,
                        },
                    )
            else:
                return render(
                    request,
                    "supercoordinator/add_organization.html",
                    {
                        "form": form,
                        "valid_state": False,
                        "valid_city": True,
                    },
                )
            organization = form.save(commit=False)
            organization.state = State.objects.get(
                state__icontains=request.POST["state"].strip()
            )
            organization.city = City.objects.get(
                city__icontains=request.POST["city"].strip()
            )
            organization.save()
            return redirect("accounts:supercoordinator_dashboard")
        else:
            return render(
                request,
                "supercoordinator/add_organization.html",
                {"form": form},
            )


@login_required(login_url="accounts:loginlink")
@user_passes_test(is_supercoordinator, login_url="accounts:forbidden")
def viewCoordinators(request, id):
    organization = Organization.objects.filter(id=id).first()
    coordinators = organization.coordinatorincharge_set.all()
    for coordinator in coordinators:
        coordinator.fname = encryptionHelper.decrypt(coordinator.fname)
        coordinator.lname = encryptionHelper.decrypt(coordinator.lname)
        coordinator.mobile_no = encryptionHelper.decrypt(coordinator.mobile_no)
        coordinator.email = encryptionHelper.decrypt(coordinator.email)
    return render(
        request,
        "supercoordinator/view_coordinators.html",
        {
            "coordinators": coordinators,
            "organization": organization,
            "page_type": "view_coordinators",
            "org_id": id,
        },
    )


@login_required(login_url="accounts:loginlink")
@user_passes_test(is_supercoordinator, login_url="accounts:forbidden")
def addCoordinatorForm(request, id):
    if request.method == "GET":
        form = CoordinatorsInfoForm()
        user_creation_form = UserCreationForm()
        return render(
            request,
            "supercoordinator/add_coordinator.html",
            {"form": form, "user_creation_form": user_creation_form},
        )
    else:
        form = CoordinatorsInfoForm(request.POST)
        coordinatoruserform = UserCreationForm(request.POST)
        if form.is_valid() and coordinatoruserform.is_valid():
            coordinatoruser = coordinatoruserform.save(commit=False)
            coordinatoruser.save()
            coordinator_group = Group.objects.get(name="Coordinators")
            coordinatoruser.groups.add(coordinator_group)
            coordinatoruser.save()
            coordinator = form.save(commit=False)
            coordinator.user = coordinatoruser
            coordinator.email = encryptionHelper.encrypt(request.POST["email"])
            coordinator.fname = encryptionHelper.encrypt(request.POST["fname"])
            coordinator.mname = encryptionHelper.encrypt(request.POST["mname"])
            coordinator.lname = encryptionHelper.encrypt(request.POST["lname"])
            coordinator.aadhar = encryptionHelper.encrypt(request.POST["aadhar"])
            coordinator.dob = encryptionHelper.encrypt(request.POST["dob"])
            coordinator.gender = encryptionHelper.encrypt(request.POST["gender"])
            coordinator.mobile_no = encryptionHelper.encrypt(request.POST["mobile_no"])
            coordinator.super_coordinator = SuperCoordinator.objects.filter(
                user=request.user
            ).first()
            coordinator.organization = Organization.objects.filter(id=id).first()
            coordinator.save()
            return redirect("accounts:view_coordinators", id)
        else:
            return render(
                request,
                "supercoordinator/add_coordinator.html",
                {"form": form, "user_creation_form": coordinatoruserform},
            )


@login_required(login_url="accounts:loginlink")
@user_passes_test(is_supercoordinator, login_url="accounts:forbidden")
def allCoordinators(request):
    coordinators = CoordinatorInCharge.objects.all()
    for coordinator in coordinators:
        coordinator.fname = encryptionHelper.decrypt(coordinator.fname)
        coordinator.lname = encryptionHelper.decrypt(coordinator.lname)
        coordinator.mobile_no = encryptionHelper.decrypt(coordinator.mobile_no)
        coordinator.email = encryptionHelper.decrypt(coordinator.email)
    return render(
        request,
        "supercoordinator/all_coordinators.html",
        {"coordinators": coordinators, "page_type": "all_coordinators"},
    )


@login_required(login_url="accounts:loginlink")
@user_passes_test(is_supercoordinator, login_url="accounts:forbidden")
def supercoordinator_reset_password(request):
    if request.method == "GET":
        form = SuperCoordPasswordReset()
        return render(
            request,
            "supercoordinator/supercoordinator_reset_password.html",
            {"form": form, "page_type": "reset_password"},
        )
    else:
        form = SuperCoordPasswordReset(request.POST)
        if form.is_valid():
            username = form.cleaned_data["username"]
            if User.objects.filter(username=username).exists():
                user = User.objects.get(username=username)
                if is_coordinator(user):
                    password = random_password_generator()
                    user_coord = CoordinatorInCharge.objects.get(user=user)
                    user_coord.first_password = password
                    user_coord.password_changed = False
                    user_coord.save()
                    user.set_password(password)
                    user.save()
                    return render(
                        request,
                        "supercoordinator/supercoordinator_reset_password.html",
                        {
                            "form": form,
                            "page_type": "reset_password",
                            "my_messages": {
                                "success": "Password reset successfull. Download login credentions from below."
                            },
                        },
                    )
                else:
                    return render(
                        request,
                        "supercoordinator/supercoordinator_reset_password.html",
                        {
                            "form": form,
                            "page_type": "reset_password",
                            "my_messages": {
                                "error": "Provided user is not a Coordinator."
                            },
                        },
                    )
            else:
                return render(
                    request,
                    "supercoordinator/supercoordinator_reset_password.html",
                    {
                        "form": form,
                        "page_type": "reset_password",
                        "my_messages": {"error": "Invalid username."},
                    },
                )
        else:
            return render(
                request,
                "supercoordinator/supercoordinator_reset_password.html",
                {"form": form, "page_type": "reset_password"},
            )


@login_required(login_url="accounts:loginlink")
@user_passes_test(is_supercoordinator, login_url="accounts:forbidden")
def supercoordinator_reset_password_download(request):
    output = io.BytesIO()
    wb = xlsxwriter.Workbook(output)
    bold = wb.add_format({"bold": True})
    credentials = wb.add_worksheet("Credentials")
    columns = [
        "Username",
        "Password",
    ]
    for col_num in range(len(columns)):
        credentials.write(0, col_num, columns[col_num], bold)
    coord = CoordinatorInCharge.objects.filter(password_changed=False)
    for row_no, x in enumerate(coord):
        credentials.write(row_no + 1, 0, x.user.username)
        credentials.write(row_no + 1, 1, x.first_password)
    wb.close()
    output.seek(0)
    response = HttpResponse(
        output.read(),
        content_type="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
    )
    response["Content-Disposition"] = "attachment; filename=Login Credentials.xlsx"
    return response

@login_required(login_url="accounts:loginlink")
@user_passes_test(
    lambda user: is_supercoordinator(user),
    login_url="accounts:forbidden",
)
def view_supercoordinator_profile(request):
    if request.method == "GET":
        user = request.user
        if is_supercoordinator(user):
            supercoordinator = SuperCoordinator.objects.filter(user=user).first()

            supercoordinator.fname = encryptionHelper.decrypt(supercoordinator.fname)
            supercoordinator.lname = encryptionHelper.decrypt(supercoordinator.lname)

            if supercoordinator.mname:
                supercoordinator.mname = encryptionHelper.decrypt(supercoordinator.mname)
                if supercoordinator.mname == '':
                    supercoordinator.mname = ""
            else:
                supercoordinator.mname = ""
            
            if supercoordinator.aadhar:
                supercoordinator.aadhar = encryptionHelper.decrypt(supercoordinator.aadhar)
                if supercoordinator.aadhar == '':
                    supercoordinator.aadhar = "-"
            else:
                supercoordinator.aadhar = "-"
            
            if supercoordinator.email:
                supercoordinator.email = encryptionHelper.decrypt(supercoordinator.email)
                if supercoordinator.email == '':
                    supercoordinator.email = "-"
            else:
                supercoordinator.email = "-"
            
            if supercoordinator.mobile_no:
                supercoordinator.mobile_no = encryptionHelper.decrypt(supercoordinator.mobile_no)
                if supercoordinator.mobile_no == '':
                    supercoordinator.mobile_no = "-"
            else:
                supercoordinator.mobile_no = "-"

            supercoordinator.dob = encryptionHelper.decrypt(supercoordinator.dob)
            supercoordinator.gender = encryptionHelper.decrypt(supercoordinator.gender)
            
            return render( request, "supercoordinator/view_supercoordinator_profile.html", {"page_type": "view_supercoordinator_profile", "supercoordinator": supercoordinator})

@login_required(login_url="accounts:loginlink")
@user_passes_test(
    lambda user: is_supercoordinator(user),
    login_url="accounts:forbidden",
)
def edit_supercoordinator_profile(request):
    if request.method == "GET":
        supercoordinator = SuperCoordinator.objects.filter(user=request.user).first()
        initial_dict = {
            "fname": encryptionHelper.decrypt(supercoordinator.fname),
            "lname": encryptionHelper.decrypt(supercoordinator.lname),
            "profile_pic": supercoordinator.profile_pic,
            "dob": encryptionHelper.decrypt(supercoordinator.dob),
            "gender": encryptionHelper.decrypt(supercoordinator.gender),
        }

        if supercoordinator.mname:
            initial_dict["mname"] = encryptionHelper.decrypt(supercoordinator.mname)
        if supercoordinator.aadhar:
            initial_dict["aadhar"] = encryptionHelper.decrypt(supercoordinator.aadhar)
        if supercoordinator.email:
            initial_dict["email"] = encryptionHelper.decrypt(supercoordinator.email)
        if supercoordinator.mobile_no:
            initial_dict["mobile_no"] = encryptionHelper.decrypt(supercoordinator.mobile_no)

        form = SuperCoordinatorsInfoForm(request.POST or None, initial = initial_dict)

        return render(
            request, "supercoordinator/update_supercoordinators_info.html",
            {
                "form": form
            },
        )
    else:
        form = SuperCoordinatorsInfoForm(request.POST, request.FILES)

        if form.is_valid():
            supercoordinator = SuperCoordinator.objects.filter(user=request.user).first()

            if supercoordinator.mname:
                supercoordinator.mname = encryptionHelper.encrypt(request.POST["mname"])
            if supercoordinator.aadhar:
                supercoordinator.aadhar = encryptionHelper.encrypt(request.POST["aadhar"])
            if supercoordinator.email:
                supercoordinator.email = encryptionHelper.encrypt(request.POST["email"])
            if supercoordinator.mobile_no:
                supercoordinator.mobile_no = encryptionHelper.encrypt(request.POST["mobile_no"])

            supercoordinator.fname = encryptionHelper.encrypt(request.POST["fname"])
            supercoordinator.lname = encryptionHelper.encrypt(request.POST["lname"])
            supercoordinator.dob = encryptionHelper.encrypt(request.POST["dob"])
            supercoordinator.gender = encryptionHelper.encrypt(request.POST["gender"])

            if request.FILES:
                x = supercoordinator.profile_pic.url.split('/account/media/')
                if x[1] != 'default.svg':
                    file = settings.MEDIA_ROOT + '\\' + x[1]
                    os.remove(file)
                supercoordinator.profile_pic = request.FILES["profile_pic"]
            else:
                if "profile_pic-clear" in request.POST.keys():
                    x = supercoordinator.profile_pic.url.split('/account/media/')
                    if x[1] != 'default.svg':
                        file = settings.MEDIA_ROOT + '\\' + x[1]
                        os.remove(file)
                    supercoordinator.profile_pic = "/default.svg"

            supercoordinator.save()
            return redirect("accounts:view_supercoordinator_profile")
        else:
            return render( request, "supercoordinator/update_supercoordinators_info.html", {"form": form} )