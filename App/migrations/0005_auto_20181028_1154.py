# Generated by Django 2.1.2 on 2018-10-28 03:54

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('App', '0004_auto_20181028_1147'),
    ]

    operations = [
        migrations.AlterField(
            model_name='user',
            name='name',
            field=models.CharField(max_length=80, null=True),
        ),
    ]
