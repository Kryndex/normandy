# -*- coding: utf-8 -*-
# Generated by Django 1.9 on 2016-05-24 17:56
from __future__ import unicode_literals

from django.db import migrations, models
import django.utils.timezone


class Migration(migrations.Migration):

    dependencies = [
        ('recipes', '0027_auto_20160509_2225'),
    ]

    operations = [
        migrations.AlterField(
            model_name='approval',
            name='created',
            field=models.DateTimeField(default=django.utils.timezone.now),
        ),
        migrations.AlterField(
            model_name='approvalrequest',
            name='created',
            field=models.DateTimeField(default=django.utils.timezone.now),
        ),
        migrations.AlterField(
            model_name='approvalrequestcomment',
            name='created',
            field=models.DateTimeField(default=django.utils.timezone.now),
        ),
    ]
