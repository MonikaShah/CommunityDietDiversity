# Generated by Django 3.2 on 2021-10-19 11:05

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('accounts', '0014_auto_20211018_1946'),
    ]

    operations = [
        migrations.AddField(
            model_name='studentsinfo',
            name='profile_pic',
            field=models.ImageField(blank=True, null=True, upload_to=''),
        ),
    ]
