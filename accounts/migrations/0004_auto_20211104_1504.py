# Generated by Django 3.2 on 2021-11-04 09:34

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('accounts', '0003_alter_studentsinfo_parent'),
    ]

    operations = [
        migrations.RenameModel(
            old_name='Activity',
            new_name='Physique',
        ),
        migrations.CreateModel(
            name='InfoFormDetails',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('open', models.BooleanField()),
                ('start_timestamp', models.DateTimeField()),
                ('end_timestamp', models.DateTimeField(null=True)),
                ('form', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='accounts.form')),
            ],
        ),
    ]
