from django.db import models
from django.contrib.auth.models import User
from shared.encryption import EncryptionHelper
from django.core.validators import MinValueValidator, MaxValueValidator


class Occupation(models.Model):
    occupation = models.CharField(max_length=255)

    def __str__(self):
        return self.occupation


class State(models.Model):
    state = models.CharField(max_length=255)

    def __str__(self):
        return self.state


class City(models.Model):
    city = models.CharField(max_length=255)
    state = models.ForeignKey(State, on_delete=models.CASCADE, default=1)

    def __str__(self):
        return self.city


class FamilyType(models.Model):
    family = models.CharField(max_length=255)

    def __str__(self):
        return self.family


class ReligiousBelief(models.Model):
    religion = models.CharField(max_length=255)

    def __str__(self):
        return self.religion


class Education(models.Model):
    education = models.CharField(max_length=255)

    def __str__(self):
        return self.education


class OrganizationTypes(models.Model):
    type = models.CharField(max_length=255)

    def __str__(self):
        return self.type


class Organization(models.Model):
    name = models.CharField(max_length=255)
    address = models.CharField(max_length=255)
    pincode = models.IntegerField()
    state = models.ForeignKey(State, on_delete=models.CASCADE)
    city = models.ForeignKey(City, on_delete=models.CASCADE)
    type = models.ForeignKey(OrganizationTypes, on_delete=models.CASCADE)

    def __str__(self):
        return self.name


class ParentsInfo(models.Model):
    # Primary form
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    profile_pic = models.ImageField(null=True, blank=True)
    consent = models.BooleanField(default=True)
    # name = models.BinaryField() # removed
    fname = models.BinaryField()  # new
    mname = models.BinaryField(null=True)  # new
    lname = models.BinaryField()  # new
    aadhar = models.BinaryField(null=True)  # new
    email = models.BinaryField(null=True)
    mobile_no = models.BinaryField(null=True)
    gender = models.BinaryField()
    dob = models.BinaryField()
    state = models.ForeignKey(State, on_delete=models.CASCADE)
    city = models.ForeignKey(City, on_delete=models.CASCADE)
    pincode = models.BinaryField()
    # address = models.BinaryField() # removed
    # Secondary form (Yet to work on)
    occupation = models.ForeignKey(Occupation, on_delete=models.CASCADE, null=True)
    edu = models.ForeignKey(Education, on_delete=models.CASCADE, null=True)
    no_of_family_members = models.BinaryField(null=True)
    type_of_family = models.ForeignKey(FamilyType, on_delete=models.CASCADE, null=True)
    religion = models.ForeignKey(ReligiousBelief, on_delete=models.CASCADE, null=True)
    children_count = models.BinaryField(null=True)
    # Others
    first_password = models.CharField(max_length=225, default="")
    password_changed = models.BooleanField(default=True)

    def __str__(self):
        encryptionHelper = EncryptionHelper()
        return encryptionHelper.decrypt(self.name)


class SuperCoordinator(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    # name = models.BinaryField() # removed
    fname = models.BinaryField()  # new
    mname = models.BinaryField(null=True)  # new
    lname = models.BinaryField()  # new
    aadhar = models.BinaryField(null=True)  # new
    email = models.BinaryField()
    mobile_no = models.BinaryField()
    gender = models.BinaryField()
    dob = models.BinaryField()

    def __str__(self):
        encryptionHelper = EncryptionHelper()
        return encryptionHelper.decrypt(self.name)


class CoordinatorInCharge(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    # name = models.BinaryField() # removed
    fname = models.BinaryField()  # new
    mname = models.BinaryField(null=True)  # new
    lname = models.BinaryField()  # new
    aadhar = models.BinaryField(null=True)  # new
    email = models.BinaryField(null=True)
    mobile_no = models.BinaryField(null=True)
    gender = models.BinaryField()
    dob = models.BinaryField()
    organization = models.ForeignKey(Organization, on_delete=models.CASCADE)
    super_coordinator = models.ForeignKey(SuperCoordinator, on_delete=models.CASCADE)
    first_password = models.CharField(max_length=225, default="")
    password_changed = models.BooleanField(default=True)

    def __str__(self):
        encryptionHelper = EncryptionHelper()
        return encryptionHelper.decrypt(self.name)


class TeacherInCharge(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    # name = models.BinaryField() # removed
    fname = models.BinaryField()  # new
    mname = models.BinaryField(null=True)  # new
    lname = models.BinaryField()  # new
    aadhar = models.BinaryField(null=True)  # new
    email = models.BinaryField(null=True)
    mobile_no = models.BinaryField(null=True)
    gender = models.BinaryField()
    dob = models.BinaryField()
    organization = models.ForeignKey(Organization, on_delete=models.CASCADE)
    coordinator = models.ForeignKey(CoordinatorInCharge, on_delete=models.CASCADE)
    first_password = models.CharField(max_length=225, default="")
    password_changed = models.BooleanField(default=True)

    def __str__(self):
        encryptionHelper = EncryptionHelper()
        return encryptionHelper.decrypt(self.name)


class Session(models.Model):
    name = models.CharField(max_length=255)
    start_date = models.DateTimeField()
    end_date = models.DateTimeField(null=True)
    coordinator = models.ForeignKey(CoordinatorInCharge, on_delete=models.CASCADE)

    def __str__(self):
        return str(self.start_date)


class Teacher_Session(models.Model):
    session = models.ForeignKey(Session, on_delete=models.CASCADE)
    teacher = models.ForeignKey(TeacherInCharge, on_delete=models.CASCADE)


class StudentsInfo(models.Model):
    # Primary form
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    consent = models.BooleanField(default=True)
    # name = models.BinaryField()   # removed
    fname = models.BinaryField()  # new
    mname = models.BinaryField(null=True)  # new
    lname = models.BinaryField()  # new
    aadhar = models.BinaryField(null=True)  # new
    email = models.BinaryField(null=True)
    mobile_no = models.BinaryField(null=True)
    gender = models.BinaryField()
    dob = models.BinaryField()
    state = models.ForeignKey(State, on_delete=models.CASCADE)
    city = models.ForeignKey(City, on_delete=models.CASCADE)
    pincode = models.BinaryField()
    # address = models.BinaryField() # removed
    organization = models.ForeignKey(Organization, on_delete=models.CASCADE)
    rollno = models.BinaryField()
    # Secondary form (Yet to work on)
    # Others
    adult = models.BinaryField()
    parent = models.ForeignKey(ParentsInfo, on_delete=models.CASCADE, null=True)
    first_password = models.CharField(max_length=225, default="")
    password_changed = models.BooleanField(default=True)
    teacher = models.ForeignKey(TeacherInCharge, on_delete=models.CASCADE, null=True)
    session = models.ForeignKey(Session, on_delete=models.CASCADE, null=True)

    def __str__(self):
        encryptionHelper = EncryptionHelper()
        return encryptionHelper.decrypt(self.name)


class Student_Session(models.Model):
    session = models.ForeignKey(Session, on_delete=models.CASCADE)
    student = models.ForeignKey(StudentsInfo, on_delete=models.CASCADE)
    teacher = models.ForeignKey(TeacherInCharge, on_delete=models.CASCADE)


class Form(models.Model):
    name = models.CharField(max_length=255)

    def __str__(self):
        return self.name.capitalize()


class FormDetails(models.Model):
    form = models.ForeignKey(Form, on_delete=models.CASCADE)
    open = models.BooleanField()
    pre = models.BooleanField()
    start_timestamp = models.DateTimeField()
    end_timestamp = models.DateTimeField(null=True)
    teacher = models.ForeignKey(TeacherInCharge, on_delete=models.CASCADE)
    session = models.ForeignKey(Session, on_delete=models.CASCADE)


class ModuleOne(models.Model):
    student = models.ForeignKey(StudentsInfo, on_delete=models.CASCADE)
    pre = models.BooleanField(null=True)
    draft = models.BooleanField()
    nutriGarden = models.CharField(max_length=10, null=True)
    source_fruits_vegetables = models.CharField(max_length=255, null=True)
    grow_own_food = models.CharField(max_length=255, null=True)
    if_grow_what = models.CharField(max_length=255, null=True, default="NA")
    reason_gardening = models.CharField(max_length=255, null=True)
    healthy_diet = models.CharField(max_length=255, null=True)
    imp_nutrients = models.CharField(max_length=255, null=True)
    citrus_fruits_blank = models.CharField(max_length=255, null=True)
    not_richsource_iron = models.CharField(max_length=255, null=True)
    source_vitaminA = models.CharField(max_length=255, null=True)
    imp_eat_fruits_vegetables = models.CharField(max_length=255, null=True)
    reason_wide_variety_food = models.CharField(max_length=255, null=True)
    microgreen = models.CharField(max_length=255, null=True)
    microgreen_example = models.CharField(max_length=255, null=True)
    harvestdays_microgreen = models.CharField(max_length=255, null=True)
    microgreen_grow_seeds_kitchen = models.CharField(max_length=255, null=True)
    microgreen_nutritiousthan_fullgrownvegetables = models.CharField(
        max_length=255, null=True
    )
    microgreen_immunity = models.CharField(max_length=255, null=True)
    microgreen_variety = models.CharField(max_length=255, null=True)
    microgreen_source = models.CharField(max_length=255, null=True)
    newspaper_grow_microgreen = models.CharField(max_length=255, null=True)
    microgreen_first_step = models.CharField(max_length=255, null=True)
    soaking_time_seeds = models.CharField(max_length=255, null=True)
    microgreen_watering = models.CharField(max_length=255, null=True)
    microgreen_use = models.CharField(max_length=255, null=True)
    submission_timestamp = models.DateTimeField(null=True)


class Activity(models.Model):
    student = models.ForeignKey(StudentsInfo, on_delete=models.CASCADE)
    pre = models.BooleanField(null=True)
    draft = models.BooleanField()
    weight = models.FloatField(
        null=True, default=None, validators=[MinValueValidator(0)]
    )
    height = models.FloatField(
        null=True,
        default=None,
        validators=[MinValueValidator(0), MaxValueValidator(214)],
    )
    waist = models.FloatField(
        null=True, default=None, validators=[MinValueValidator(0)]
    )
    hip = models.FloatField(null=True, default=None, validators=[MinValueValidator(0)])
    submission_timestamp = models.DateTimeField(null=True)
