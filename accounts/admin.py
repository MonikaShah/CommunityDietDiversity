<<<<<<< HEAD
from django.contrib import auth, admin
from django.contrib.auth.admin import UserAdmin
from .models import (
    TeacherInCharge,
    School,
    CoordinatorInCharge,
    SuperCoordinator
)


class AccountsUserCustomization(UserAdmin):
    fieldsets = (
        (
            "Details",
            {
                "fields": (
                    "username",
                    "password",
                    "first_name",
                    "last_name",
                    "groups",
                )
            },
        ),
    )
=======
from django.contrib import admin
from .models import *
>>>>>>> 2f36fb072e5cd4844ea108b1d9ed082164b427d8


class AccountsAdminArea(admin.AdminSite):
    site_header = "Accounts Admin Area"


accounts_admin_area = AccountsAdminArea(name="accounts_admin")

accounts_admin_area.register(auth.models.User, AccountsUserCustomization)
accounts_admin_area.register(School)
accounts_admin_area.register(CoordinatorInCharge)
accounts_admin_area.register(TeacherInCharge)
accounts_admin_area.register(SuperCoordinator)
accounts_admin_area.register(Occupation)
accounts_admin_area.register(FamilyType)
accounts_admin_area.register(ReligiousBelief)
accounts_admin_area.register(Education)
accounts_admin_area.register(OrganizationTypes)
accounts_admin_area.register(Form)
