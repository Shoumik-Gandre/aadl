from .models import Club, Post
from rest_framework import serializers


class ClubSerializer(serializers.ModelSerializer):
   class Meta:
       model = Club
       fields = ['pk', 'name']


class PostSerializer(serializers.ModelSerializer):
    class Meta:
        model = Post
        fields = ['pk', 'club', 'title',
        'description', 'image', 'publish_date']