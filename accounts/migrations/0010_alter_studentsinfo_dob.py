# Generated by Django 3.2 on 2021-07-24 10:10

import datetime
import django.core.validators
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('accounts', '0009_merge_20210723_1926'),
    ]

    operations = [
        migrations.AlterField(
            model_name='studentsinfo',
            name='dob',
            field=models.DateField(validators=[django.core.validators.MaxValueValidator(limit_value=datetime.date(2016, 7, 25)), django.core.validators.MinValueValidator(limit_value=datetime.date(2006, 7, 28))]),
        ),
    ]