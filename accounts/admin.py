from django.contrib import admin, auth
from .models import (
    TeacherInCharge,
    School,
    CoordinatorInCharge,
)


class AccountsUserCustomization(admin.ModelAdmin):
    fields = ["username", "first_name", "last_name", "email", "password", "groups"]


class AccountsAdminArea(admin.AdminSite):
    site_header = "Accounts Admin Area"


accounts_admin_area = AccountsAdminArea(name="accounts_admin")

accounts_admin_area.register(auth.models.User, AccountsUserCustomization)
accounts_admin_area.register(School)
accounts_admin_area.register(CoordinatorInCharge)
accounts_admin_area.register(TeacherInCharge)