# Generated by Django 3.2 on 2021-08-16 12:21

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('accounts', '0004_auto_20210816_1748'),
    ]

    operations = [
        migrations.AlterField(
            model_name='session',
            name='end_date',
            field=models.DateTimeField(null=True),
        ),
        migrations.AlterField(
            model_name='session',
            name='start_date',
            field=models.DateTimeField(),
        ),
    ]
