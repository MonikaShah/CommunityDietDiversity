# Generated by Django 3.2 on 2021-10-19 15:54

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('accounts', '0015_studentsinfo_profile_pic'),
    ]

    operations = [
        migrations.AddField(
            model_name='supercoordinator',
            name='profile_pic',
            field=models.ImageField(blank=True, null=True, upload_to=''),
        ),
    ]
