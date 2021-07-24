from django.contrib import admin

from .models import ParentsInfo, StudentsInfo, TeacherInCharge, State, City,School,CoordinatorInCharge


admin.site.register(ParentsInfo)
admin.site.register(StudentsInfo)
admin.site.register(TeacherInCharge)
admin.site.register(CoordinatorInCharge)
admin.site.register(State)
admin.site.register(City)
admin.site.register(School)

# Register your models here.