# Generated by Django 3.2 on 2021-07-23 12:37

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('accounts', '0007_auto_20210723_1751'),
    ]

    operations = [
        migrations.AlterField(
            model_name='activity',
            name='height',
            field=models.FloatField(null=True),
        ),
        migrations.AlterField(
            model_name='activity',
            name='hip',
            field=models.FloatField(null=True),
        ),
        migrations.AlterField(
            model_name='activity',
            name='waist',
            field=models.FloatField(null=True),
        ),
        migrations.AlterField(
            model_name='activity',
            name='weight',
            field=models.FloatField(null=True),
        ),
    ]