from django.urls import path
from django.conf.urls import url
from django.views.generic.base import RedirectView
from accounts import views
from django.views.generic.base import TemplateView

app_name = "accounts"

urlpatterns = [
    path("", views.root, name="root"),
    path("registration/", views.registration, name="registration"),
    path("consent/", views.consent, name="consent"),
    path("consent_adult/", views.consent_adult, name="consent_adult"),
    path("parents_info/", views.parents_info, name="parents_info"),
    path("students_info/", views.students_info, name="students_info"),
    path("students_info_adult/", views.students_info_adult, name="students_info_adult"),
    path("login/", views.loginU, name="loginlink"),
    path("bulkRegister/", views.bulkRegister, name="bulk_register"),
    path("getTemplate/", views.getTemplate, name="get_template"),
    path("downloadData/", views.downloadData, name="download_data"),
    path("parent_dashboard/", views.parent_dashboard, name="parent_dashboard"),
    path("student_dashboard/", views.student_dashboard, name="student_dashboard"),
    path("teacher_dashboard/", views.teacher_dashboard, name="teacher_dashboard"),
    path(
        "coordinator_dashboard/",
        views.coordinator_dashboard,
        name="coordinator_dashboard",
    ),
    path(
        "supercoordinator_dashboard/",
        views.supercoordinator_dashboard,
        name="supercoordinator_dashboard",
    ),
    path("teacher_dashboard/<int:id>/", views.getFormDetails, name="get_form_details"),
    path("all_coordinators/", views.allCoordinators, name="all_coordinators"),
    path("all_sessions/", views.allSessions, name="all_sessions"),
    path(
        "view_coordinators/<int:id>/", views.viewCoordinators, name="view_coordinators"
    ),
    path("logout/", views.logoutU, name="logoutu"),
    path("addStudentForm/", views.addStudentForm, name="add_student_form"),
    path("addTeacherForm/", views.addTeacherForm, name="add_teacher_form"),
    path(
        "addSuperCoordinatorForm/",
        views.addSuperCoordinatorForm,
        name="add_supercoordinator_form",
    ),
    path(
        "addCoordinatorForm/<int:id>/",
        views.addCoordinatorForm,
        name="add_coordinator_form",
    ),
    path("addSessionForm/", views.addSessionForm, name="add_session_form"),
    path(
        "addOrganizationForm/", views.addOrganizationForm, name="add_organization_form"
    ),
    path("activity/", views.activity, name="activity"),
    path("moduleOne/", views.moduleOne, name="module_one"),
    path("moduleOne-2/", views.moduleOne2, name="module_one_2"),
    path("moduleOne-3/", views.moduleOne3, name="module_one_3"),
    path("activitydraft/", views.activityDraft, name="activitydraft"),
    path("draft/", views.draft, name="draft"),
    path("forbidden/", views.forbidden, name="forbidden"),
    path(
        "parent_dashboard/<int:id>/", views.showStudent, name="parent_dashboard_student"
    ),
    path(
        "parent_dashboard/<int:id>/moduleOne",
        views.parentModuleOne,
        name="parentModuleOne",
    ),
    path(
        "parent_dashboard/<int:id>/moduleOne-2",
        views.parentModuleOne2,
        name="parentsModuleOne2",
    ),
    path(
        "parent_dashboard/<int:id>/moduleOne-3",
        views.parentModuleOne3,
        name="parentsModuleOne3",
    ),
    path(
        "parent_dashboard/<int:id>/activity",
        views.parentActivity,
        name="parentActivity",
    ),
    path("previous/", views.previous, name="previous"),
    path("manage-forms/", views.manageForms, name="manage_forms"),
    url(
        "already_filled/",
        TemplateView.as_view(template_name="other/already_filled.html"),
    ),
    url(
        "form_closed/",
        TemplateView.as_view(template_name="other/form_closed.html"),
    ),
    path("forgot_password/", views.forgot_password, name="forgot_password"),
    path("change_password/", views.change_password, name="change_password"),
    path("password_changed/", views.password_changed, name="password_changed"),
]
