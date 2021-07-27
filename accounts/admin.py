from django.contrib import auth, admin
from django.contrib.auth.admin import UserAdmin
from .models import (
    TeacherInCharge,
    School,
    CoordinatorInCharge,
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


class AccountsAdminArea(admin.AdminSite):
    site_header = "Accounts Admin Area"


accounts_admin_area = AccountsAdminArea(name="accounts_admin")

accounts_admin_area.register(auth.models.User, AccountsUserCustomization)
accounts_admin_area.register(School)
accounts_admin_area.register(CoordinatorInCharge)
accounts_admin_area.register(TeacherInCharge)