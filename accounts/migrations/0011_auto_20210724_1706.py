# Generated by Django 3.2 on 2021-07-24 11:36

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('accounts', '0010_alter_studentsinfo_dob'),
    ]

    operations = [
        migrations.AlterField(
            model_name='activity',
            name='height',
            field=models.FloatField(default=0, null=True),
        ),
        migrations.AlterField(
            model_name='activity',
            name='hip',
            field=models.FloatField(default=0, null=True),
        ),
        migrations.AlterField(
            model_name='activity',
            name='waist',
            field=models.FloatField(default=0, null=True),
        ),
        migrations.AlterField(
            model_name='activity',
            name='weight',
            field=models.FloatField(default=0, null=True),
        ),
    ]