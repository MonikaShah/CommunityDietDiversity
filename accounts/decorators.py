from .models import *
from django.shortcuts import redirect
from django.contrib.auth import logout


def is_student(user):
    return user.groups.filter(name="Students").exists()


def is_parent(user):
    return user.groups.filter(name="Parents").exists()

def is_coordinator(user):
    return user.groups.filter(name="Coordinators").exists()

def is_parent_or_student(user):
    return (
        user.groups.filter(name="Parents").exists()
        or user.groups.filter(name="Studnets").exists()
    )


def is_teacher(user):
    return user.groups.filter(name="Teachers").exists()


def isActive(moduleType, userType):
    def decorator(view_func):
        def wrap(request, *args, **kwargs):
            module = Form.objects.get(name=moduleType)
            if not "parent_dashboard" in request.build_absolute_uri().split("/"):
                if request.user.groups.filter(name="Parents").exists():
                    return redirect("accounts:forbidden")
                student = StudentsInfo.objects.get(user=request.user)
                if FormDetails.objects.filter(
                    form=module, open=True, teacher=student.teacher
                ).exists():
                    return view_func(request, *args, **kwargs)
                else:
                    return redirect("../form_closed")

            elif "parent_dashboard" in request.build_absolute_uri().split("/"):
                studentID = request.META.get("HTTP_REFERER").split("/")[-2]
                student = (
                    ParentsInfo.objects.filter(user=request.user)
                    .first()
                    .studentsinfo_set.get(pk=studentID)
                )

                if FormDetails.objects.filter(
                    form=module, open=True, teacher=student.teacher
                ).exists():
                    return view_func(request, *args, **kwargs)
                else:
                    return redirect("../form_closed")

        return wrap

    return decorator


def redirect_to_dashboard(func):
    def logic(request):
        def my_redirect(request):
            if is_teacher(request.user):
                return redirect("accounts:teacher_dashboard")
            elif is_parent(request.user):
                return redirect("accounts:parent_dashboard")
            elif is_student(request.user):
                return redirect("accounts:student_dashboard")
            elif is_coordinator(request.user):
                return redirect("accounts:coordinator_dashboard")
            else:
                logout(request)
                return redirect("accounts:loginlink")

        if request.user.get_username() != "":
            return my_redirect(request)
        else:
            return func(request)

    return logic