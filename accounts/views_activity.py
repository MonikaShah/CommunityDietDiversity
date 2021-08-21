import ast
from datetime import datetime
from django.shortcuts import render, redirect
from django.contrib.auth.decorators import login_required, user_passes_test
from .decorators import *
from .models import *
from .forms import *
from .helper_functions import *


def creatingOrUpdatingDraftsActivity(temp, user, formName):
    student = StudentsInfo.objects.get(user=user)
    startdate = FormDetails.objects.get(
        form=Form.objects.get(name=formName), teacher=student.teacher, open=True
    ).start_timestamp
    if Activity.objects.filter(
        student=student, submission_timestamp__gte=startdate
    ).exists():
        draftForm = Activity.objects.get(
            student=StudentsInfo.objects.get(user=user),
            submission_timestamp__gte=startdate,
        )
        if draftForm.draft:
            # updating drafts
            for name in Activity._meta.get_fields():
                name = name.column
                if name == "id" or name == "student_id" or name == "draft":
                    continue
                if name in temp:
                    setattr(draftForm, name, temp[name])
                else:
                    setattr(draftForm, name, getattr(draftForm, name) or None)

            draftForm.submission_timestamp = datetime.now()
            if draftForm.waist == "":
                draftForm.waist = 0
            if draftForm.weight == "":
                draftForm.weight = 0
            if draftForm.hip == "":
                draftForm.hip = 0
            if draftForm.height == "":
                draftForm.height = 0
            draftForm.save()
            return True
    else:
        return False


@login_required(login_url="accounts:loginlink")
@user_passes_test(
    lambda user: is_parent(user) or is_student(user), login_url="accounts:forbidden"
)
@password_change_required
def activityDraft(request):
    if "parent_dashboard" in request.META.get("HTTP_REFERER").split("/"):
        module = request.META.get("HTTP_REFERER").split("/")[-1]
        id = request.META.get("HTTP_REFERER").split("/")[-2]
        user = StudentsInfo.objects.get(pk=id).user
    else:
        module = request.META.get("HTTP_REFERER").split("/")[-2]
        user = request.user
    # for removing csrf field
    temp = createTempDict(request.POST)
    # checking if draft exists
    if not creatingOrUpdatingDraftsActivity(temp, user, "activity"):
        # creating new record
        form = Activity(**temp)
        form.student = StudentsInfo.objects.get(user=user)
        form.draft = True
        formType = getFormType("activity", StudentsInfo.objects.get(user=user).teacher)
        form.pre = 1 if formType == "PreTest" else 0
        form.submission_timestamp = datetime.now()
        if form.waist == "":
            form.waist = 0
        if form.weight == "":
            form.weight = 0
        if form.hip == "":
            form.hip = 0
        if form.height == "":
            form.height = 0
        form.save()
    return redirect(request.META.get("HTTP_REFERER"))


@login_required(login_url="accounts:loginlink")
@user_passes_test(
    lambda user: is_parent(user) or is_student(user), login_url="accounts:forbidden"
)
@password_change_required
@isActive("activity", "student")
def activity(request, user=None):
    if request.method == "GET":
        if user == None:
            user = request.user

        student = StudentsInfo.objects.get(user=user)
        startdate = FormDetails.objects.get(
            form=Form.objects.get(name="activity"), teacher=student.teacher, open=True
        ).start_timestamp
        if Activity.objects.filter(
            student=student, submission_timestamp__gte=startdate
        ).exists():
            draftForm = Activity.objects.get(
                student=StudentsInfo.objects.get(user=user),
                submission_timestamp__gte=startdate,
            )
            if draftForm.draft:
                mod = ActivityForm()
                temp = {}
                for name in Activity._meta.get_fields():
                    name = name.column
                    if name in mod.fields:
                        temp[name] = getattr(draftForm, name) or None
                form = ActivityForm(temp)
                formPre = getFormType("activity", student.teacher)
                return render(
                    request,
                    "activity/activity.html",
                    {"form": form, "formPre": formPre, "page_type": "student_activity"},
                )
            else:
                return redirect("accounts:already_filled")
        # new form
        else:
            form = ActivityForm()
            formPre = getFormType("activity", student.teacher)
            return render(
                request,
                "activity/activity.html",
                {"form": form, "formPre": formPre, "page_type": "student_activity"},
            )
    # POST
    else:
        flag = False
        if user == None:
            flag = True
            user = request.user
        form = ActivityForm(request.POST)

        # valid form
        if form.is_valid():
            temp = createTempDict(request.POST)
            student = StudentsInfo.objects.get(user=user)
            startdate = FormDetails.objects.get(
                form=Form.objects.get(name="activity"),
                teacher=student.teacher,
                open=True,
            ).start_timestamp
            activityDraft(request)
            draftForm = Activity.objects.get(
                student=StudentsInfo.objects.get(user=user),
                submission_timestamp__gte=startdate,
            )
            if draftForm.draft:
                for name in Activity._meta.get_fields():
                    name = name.column
                    if name == "id" or name == "student_id" or name == "draft":
                        continue
                    elif name == "source_fruits_vegetables" or name == "grow_own_food":
                        my_list = "; ".join(ast.literal_eval(getattr(draftForm, name)))
                        setattr(draftForm, name, my_list)
                    elif name in temp:
                        setattr(draftForm, name, temp[name])

                draftForm.draft = False
                draftForm.submission_timestamp = datetime.now()
                draftForm.save()
            if flag:
                return redirect("accounts:student_dashboard")
            else:
                return redirect("accounts:parent_dashboard")
        # invalid form
        else:
            formPre = getFormType(
                "activity", StudentsInfo.objects.get(user=user).teacher
            )
            return render(
                request,
                "activity/activity.html",
                {"form": form, "formPre": formPre, "page_type": "student_activity"},
            )


@login_required(login_url="accounts:loginlink")
@user_passes_test(is_parent, login_url="accounts:forbidden")
@password_change_required
@isActive("activity", "parent")
def parentActivity(request, id):
    user = StudentsInfo.objects.get(pk=id).user
    return activity(request, user)
