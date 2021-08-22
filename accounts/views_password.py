from django.shortcuts import render, redirect
from django.utils.http import urlsafe_base64_encode, urlsafe_base64_decode
from django.utils.encoding import force_bytes, force_text
from django.contrib.auth import logout
from django.contrib.auth.models import User
from django.contrib.auth.decorators import login_required, user_passes_test
from django.contrib.auth.password_validation import validate_password
from django.contrib.sites.shortcuts import get_current_site
from django.core.mail import EmailMessage
from django.template.loader import get_template
from django.core.exceptions import ValidationError
from .decorators import *
from .models import *
from .forms import *
from .helper_functions import *
from .token import password_reset_token
from shared.encryption import EncryptionHelper

encryptionHelper = EncryptionHelper()


def reset_password_emailer(request, user, user_email):
    site = get_current_site(request)
    token = password_reset_token.make_token(user)
    message = get_template("password/email_template.html",).render(
        {
            "user": user,
            "protocol": "https",
            "domain": site.domain,
            "uid": urlsafe_base64_encode(force_bytes(user.pk)),
            "token": token,
        }
    )
    msg = EmailMessage(
        "Community Diet Diversity Reset Password, Ref Token:" + str(token),
        message,
        None,
        [str(user_email)],
    )
    msg.content_subtype = "html"
    msg.send(fail_silently=True)


@registration_data_cleanup
@redirect_to_dashboard
def forgot_password(request):
    if request.method == "GET":
        form = forgot_password_form()
        return render(request, "password/forgot_password.html", {"form": form})
    else:
        form = forgot_password_form(request.POST)
        if form.is_valid():
            username = form.cleaned_data["username"]
            if User.objects.filter(username=username).exists():
                user = User.objects.get(username=username)
                our_user = custom_user_filter(user)
                if our_user == None:
                    form.add_error(
                        "username", "Sorry but the following user cannot be serviced."
                    )
                    return render(
                        request, "password/forgot_password.html", {"form": form}
                    )
                else:
                    user_email = encryptionHelper.decrypt(our_user[0].email)
                    if user_email == "":
                        # Code for questions
                        print()
                    else:
                        reset_password_emailer(request, user, user_email)
                        return render(
                            request,
                            "password/forgot_password.html",
                            {
                                "form": form,
                                "my_messages": {
                                    "success": "Mail sent on the email ID provided during registration. Please click on the link sent via mail to change password. The link will expire in 10 minutes."
                                },
                            },
                        )
            else:
                form.add_error("username", "Invalid Username.")
                return render(request, "password/forgot_password.html", {"form": form})
        else:
            return render(request, "password/forgot_password.html", {"form": form})


def forgot_password_email(request, uidb64, token):
    if request.method == "GET":
        form = forgot_password_email_form()
        try:
            uid = force_text(urlsafe_base64_decode(uidb64))
            user = User.objects.get(pk=uid)
        except:
            return render(
                request,
                "password/forgot_password_email.html",
                {"form": form, "my_messages": {"error": "Invalid URL."}},
            )
        if not password_reset_token.check_token(user, token):
            return render(
                request,
                "password/forgot_password_email.html",
                {
                    "form": form,
                    "my_messages": {
                        "error": "Either the link used is invalid or reset password timedout. Please request a new password reset."
                    },
                },
            )
        return render(request, "password/forgot_password_email.html", {"form": form})
    else:
        form = forgot_password_email_form(request.POST)
        try:
            uid = force_text(urlsafe_base64_decode(uidb64))
            user = User.objects.get(pk=uid)
        except:
            return render(
                request,
                "password/forgot_password_email.html",
                {"form": form, "my_messages": {"error": "Invalid URL."}},
            )
        if password_reset_token.check_token(user, token):
            if form.is_valid():
                password1 = form.cleaned_data["password1"]
                password2 = form.cleaned_data["password2"]
                if not user.check_password(password1):
                    try:
                        validate_password(password1)
                        if password1 == password2:
                            user.set_password(password1)
                            user.save()
                            return redirect("accounts:password_changed")
                        else:
                            form.add_error("password2", "Both passwords didn't match!")
                            return render(
                                request,
                                "password/forgot_password_email.html",
                                {"form": form},
                            )
                    except ValidationError as e:
                        form.add_error("password1", e)
                        return render(
                            request,
                            "password/forgot_password_email.html",
                            {"form": form},
                        )
                else:
                    form.add_error(
                        "password1", "Password entered is same as the previous one!"
                    )
                    return render(
                        request, "password/forgot_password_email.html", {"form": form}
                    )
            else:
                return render(
                    request, "password/forgot_password_email.html", {"form": form}
                )
        else:
            return render(
                request,
                "password/forgot_password_email.html",
                {
                    "form": form,
                    "my_messages": {
                        "error": "Either the link used is invalid or expired. Please re-request password reset."
                    },
                },
            )


def forgot_password_questions(request):
    return render(request, "password/forgot_password_questions.html", {})


@login_required(login_url="accounts:loginlink")
@user_passes_test(
    lambda user: is_supercoordinator(user)
    or is_coordinator(user)
    or is_teacher(user)
    or is_parent(user)
    or is_student(user),
    login_url="accounts:forbidden",
)
def change_password(request):
    if request.method == "GET":
        form = change_password_form()
        return render(request, "password/change_password.html", {"form": form})
    else:
        form = change_password_form(request.POST)
        if form.is_valid():
            old_password = form.cleaned_data["old_password"]
            new_password = form.cleaned_data["password"]
            user = request.user
            if user.check_password(old_password):
                try:
                    validate_password(new_password)
                    if user.check_password(new_password):
                        form.add_error(
                            "password", "Password entered is same as the previous one!"
                        )
                    else:
                        user.set_password(new_password)
                        user.save()
                        our_user = custom_user_filter(user)[0]
                        our_user.password_changed = True
                        our_user.first_password = ""
                        our_user.save()
                        logout(request)
                        return redirect("accounts:password_changed")
                except ValidationError as e:
                    form.add_error("password", e)
            else:
                form.add_error("old_password", "Incorrect Password")
        return render(request, "password/change_password.html", {"form": form})


def password_changed(request):
    return render(request, "password/password_changed.html", {})
