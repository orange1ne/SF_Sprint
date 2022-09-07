from django.http import HttpResponse

from rest_framework import viewsets
import json

from .serializers import *
from .models import *


class PerevalViewset(viewsets.ModelViewSet):
    queryset = pereval_added.objects.all()
    serializer_class = PerevalSerializer


class CoordsViewset(viewsets.ModelViewSet):
    queryset = coords.objects.all()
    serializer_class = CoordsSerializer


class UsersViewset(viewsets.ModelViewSet):
    queryset = users.objects.all()
    serializer_class = UsersSerializer


def submitdata(request):
    if request.method == 'POST':
        json_params = json.loads(request.body)
        user = users.objects.create(
            email=json_params['email'],
            name=json_params['name'],
            phone=json_params['phone']
        )
        coord = coords.objects.create(
            latitude=json_params['latitude'],
            longtitude=json_params['longtitude'],
            height=json_params['height']
        )
        pereval = pereval_added.objects.create(
            title=json_params['title'],
            coord_id=json_params['coord_id'],
            user_id=json_params['user_id']
        )
        return HttpResponse(json.dumps({
            "email": users.email,
            "name": users.name,
            "phone": users.phone,
            "latitude": coords.latitude,
            "longtitude": coords.longtitude,
            "height": coords.height,
            "title": pereval_added.title,
            "coord_id": pereval_added.coord_id,
            "user_id": pereval_added.user_id
        }))


def pereval_id(request, pereval_id):
    pereval = pereval_added.objects.get(id=pereval_id)
    if request.method == 'GET':
        return HttpResponse(json.dumps(
             {
                "id": pereval.id,
                "title": pereval.title,
                "coord_id": pereval.coord_id,
                "user_id": pereval.user_id
             }))


def pereval_edit(request, pereval_id):
    json_params = json.loads(request.body)
    pereval = pereval_added.objects.get(id=pereval_id)
    if request.method == 'PATCH':
        if pereval.status == 'new':
            pereval.title = json_params.get('title', pereval.title)
            pereval.coord_id = json_params.get('coord_id', pereval.coord_id)
            pereval.user_id = json_params.get('user_id', pereval.user_id)
            pereval.save()
            return HttpResponse(json.dumps({
                "id": pereval.id,
                "title": pereval.title,
                "coord_id": pereval.coord_id,
                "user_id": pereval.user_id
            }))


def email(request, user_email):
    user = users.objects.get(email=user_email)
    perevals = pereval_added.objects.filter(user_id=user.id)
    if request.method == 'GET':
        for pereval in perevals:
            return HttpResponse(json.dumps(
                 {
                    "id": pereval.id,
                    "title": pereval.title,
                    "coord_id": pereval.coord_id,
                    "user_id": pereval.user_id
                 }))
