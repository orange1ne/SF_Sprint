from django.db import models


STATUS = [
    ('new', 'Новый'),
    ('pending', 'На проверке'),
    ('accepted', 'Добавлен'),
    ('rejected', 'Отклонен'),
]


class coords(models.Model):
    latitude = models.FloatField()
    longtitude = models.FloatField()
    height = models.IntegerField()


class users(models.Model):
    email = models.TextField(max_length=255, unique=True)
    name = models.TextField(max_length=255)
    phone = models.TextField(max_length=255)


class pereval_added(models.Model):
    date_added = models.DateTimeField(auto_now_add=True)
    status = models.TextField(max_length=255, choices=STATUS, default='new')
    title = models.TextField(max_length=255)
    beautytitle = models.TextField(max_length=255)
    other_titles = models.TextField(max_length=255)
    add_time = models.DateTimeField(auto_now_add=True)
    coord_id = models.ForeignKey(coords, on_delete=models.CASCADE)
    level_spring = models.TextField(max_length=255)
    level_summer = models.TextField(max_length=255)
    level_autumn = models.TextField(max_length=255)
    level_winter = models.TextField(max_length=255)
    connect = models.TextField(max_length=255)
    user_id = models.ForeignKey(users, on_delete=models.CASCADE)
