# Generated by Django 4.1.1 on 2022-09-07 07:40

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='coords',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('latitude', models.FloatField()),
                ('longtitude', models.FloatField()),
                ('height', models.IntegerField()),
            ],
        ),
        migrations.CreateModel(
            name='users',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('email', models.TextField(max_length=255, unique=True)),
                ('name', models.TextField(max_length=255)),
                ('phone', models.TextField(max_length=255)),
            ],
        ),
        migrations.CreateModel(
            name='pereval_added',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('date_added', models.DateTimeField(auto_now_add=True)),
                ('status', models.TextField(choices=[('new', 'Новый'), ('pending', 'На проверке'), ('accepted', 'Добавлен'), ('rejected', 'Отклонен')], default='new', max_length=255)),
                ('title', models.TextField(max_length=255)),
                ('beautytitle', models.TextField(max_length=255)),
                ('other_titles', models.TextField(max_length=255)),
                ('add_time', models.DateTimeField(auto_now_add=True)),
                ('level_spring', models.TextField(max_length=255)),
                ('level_summer', models.TextField(max_length=255)),
                ('level_autumn', models.TextField(max_length=255)),
                ('level_winter', models.TextField(max_length=255)),
                ('connect', models.TextField(max_length=255)),
                ('coord_id', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='spr.coords')),
                ('user_id', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='spr.users')),
            ],
        ),
    ]
