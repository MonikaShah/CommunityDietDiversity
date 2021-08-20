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
    path(
        "view_session_forms/<int:id>/",
        views.viewSessionForms,
        name="view_session_forms",
    ),
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
    path(
        "view_session_teachers/<int:id>/",
        views.viewSessionTeachers,
        name="view_session_teachers",
    ),
    path(
        "remove_session_teacher/<int:session_id>/<int:teacher_id>/",
        views.removeSessionTeacher,
        name="remove_session_teacher",
    ),
    path(
        "remove_session_student/<int:session_id>/<int:student_id>/",
        views.removeSessionStudent,
        name="remove_session_student",
    ),
    path(
        "view_session_students/<int:id>/<int:open_id>/",
        views.viewSessionStudents,
        name="view_session_students",
    ),
    path("all_sessions/", views.allSessions, name="all_sessions"),
    path(
        "teacher_all_sessions/", views.teacherAllSessions, name="teacher_all_sessions"
    ),
    path(
        "add_session_teachers/<int:id>/",
        views.addSessionTeachers,
        name="add_session_teachers",
    ),
    path(
        "add_session_students/<int:id>/",
        views.addSessionStudents,
        name="add_session_students",
    ),
    path(
        "add_session_students_list/<int:id>/",
        views.addSessionStudentsList,
        name="add_session_students_list",
    ),
    path(
        "get_session_teachers_template/",
        views.getSessionTeachersTemplate,
        name="get_session_teachers_template",
    ),
    path(
        "get_session_students_template/",
        views.getSessionStudentsTemplate,
        name="get_session_students_template",
    ),
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
    path("manage-forms/<int:id>/", views.manageForms, name="manage_forms"),
    url(
        "already_filled/",
        TemplateView.as_view(template_name="other/already_filled.html"),
    ),
    url(
        "form_closed/",
        TemplateView.as_view(template_name="other/form_closed.html"),
    ),
    path("forgot_password/", views.forgot_password, name="forgot_password"),
    path(
        "forgot_password/<uidb64>/<token>/",
        views.forgot_password_email,
        name="forgot_password_email",
    ),
    path(
        "forgot_password/questions/",
        views.forgot_password_questions,
        name="forgot_password_questions",
    ),
    path("change_password/", views.change_password, name="change_password"),
    path("password_changed/", views.password_changed, name="password_changed"),
    path(
        "supercoordinator_reset_password/",
        views.supercoordinator_reset_password,
        name="supercoordinator_reset_password",
    ),
    path(
        "supercoordinator_reset_password_download/",
        views.supercoordinator_reset_password_download,
        name="supercoordinator_reset_password_download",
    ),
    path(
        "coordinator_reset_password/",
        views.coordinator_reset_password,
        name="coordinator_reset_password",
    ),
    path(
        "coordinator_reset_password_teacher_download/",
        views.coordinator_reset_password_teacher_download,
        name="coordinator_reset_password_teacher_download",
    ),
    path(
        "coordinator_reset_password_parent_download/",
        views.coordinator_reset_password_parent_download,
        name="coordinator_reset_password_parent_download",
    ),
    path(
        "coordinator_reset_password_student_download/",
        views.coordinator_reset_password_student_download,
        name="coordinator_reset_password_student_download",
    ),
]
