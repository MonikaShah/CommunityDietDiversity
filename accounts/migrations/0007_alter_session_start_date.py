# Generated by Django 3.2 on 2021-08-18 16:46

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('accounts', '0006_auto_20210817_2037'),
    ]

    operations = [
        migrations.AlterField(
            model_name='session',
            name='start_date',
            field=models.DateTimeField(null=True),
        ),
    ]
