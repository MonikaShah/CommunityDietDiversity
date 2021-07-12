from django.urls import path
from django.conf.urls import url
from django.views.generic.base import RedirectView
from accounts import views
from django.views.generic.base import TemplateView
app_name="accounts"

urlpatterns = [
    path("", views.loginU,name="loginu"),
    # path('submit',views.show),
    # path('get/',views.get),
    # path('getExcel/',views.getExcel),
    # path('excelRegister/',views.excelRegister),
    path("parentconsent/", views.consent,name="parent_consent"),
    path("home/", views.home,name="home"),
    path("parents_info/", views.parents_info,name="parents_info"),
    path("students_info/", views.students_info,name="students_info"),
    path("login/", views.loginU,name="loginlink"),
    path("bulkRegister/", views.bulkRegister,name="bulk_register"),
    path("getTemplate/", views.getTemplate,name="get_template"),
    path("downloadData/", views.downloadData,name="download_data"),
    path("parent_dashboard/", views.dashboard,name="parent_dashboard"),
    path("student_dashboard/", views.student_dashboard,name="student_dashboard"),
    path("teacher_dashboard/", views.teacher_dashboard,name="teacher_dashboard"),
    path("teacher_dashboard/<int:id>/", views.getFormDetails,name="get_form_details"),
    path("logout/", views.logoutU,name="logoutu"),
    path("addStudentForm/", views.addStudentForm, name="add_student_form"),
    # path('firstModule/',views.getFirstModule,name="first_module"),
    # path('nutri/',views.nutri,name="nutri"),
    # path('nutriPartTwo/',views.nutriPartTwo,name="nutri_part_two"),
    path("moduleOne/", views.moduleOne,name="module_one"),
    path("moduleOne-2/", views.moduleOne2,name="module_one_2"),
    path("moduleOne-3/", views.moduleOne3, name="module_one_3"),
    path("draft/", views.draft, name="draft"),
    path("forbidden/", views.forbidden, name="forbidden"),
    path("parent_dashboard/<int:id>/", views.showStudent,name="parent_dashboard_student"),
    path("parent_dashboard/<int:id>/moduleOne", views.parentModuleOne,name="parentModuleOne"),
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
    path("previous/", views.previous,name="previous"),
    path("manage-forms/", views.manageForms, name="manage_forms"),
    url(
        "already_filled/",
        TemplateView.as_view(template_name="registration_form/already_filled.html"),
    ),
    url(
        "form_closed/",
        TemplateView.as_view(template_name="registration_form/form_closed.html"),
    ),
]