from rest_framework import serializers

from .models import *


class PerevalSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = pereval_added
        fields = ['id', 'title', 'coord_id', 'user_id']


class CoordsSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = coords
        fields = ['id', 'latitude', 'longtitude', 'height']


class UsersSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = users
        fields = ['id', 'email', 'name', 'phone']
