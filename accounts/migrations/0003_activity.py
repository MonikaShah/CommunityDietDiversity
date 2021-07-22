# Generated by Django 3.2 on 2021-07-21 15:00

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('accounts', '0002_alter_moduleone_pre'),
    ]

    operations = [
        migrations.CreateModel(
            name='Activity',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('pre', models.BooleanField()),
                ('draft', models.BooleanField()),
                ('weight', models.FloatField(null=True)),
                ('height', models.FloatField(null=True)),
                ('waist', models.FloatField(null=True)),
                ('hip', models.FloatField(null=True)),
                ('submission_timestamp', models.DateTimeField(null=True)),
                ('student', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='accounts.studentsinfo')),
            ],
        ),
    ]
