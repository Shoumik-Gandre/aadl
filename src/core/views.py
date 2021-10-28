from django.shortcuts import render
from rest_framework import viewsets, generics
from .models import Club, Post
from .serializers import ClubSerializer, PostSerializer


class ClubViewSet(viewsets.ModelViewSet):
    """
    API endpoint that allows users to be viewed or edited.
    """
    queryset = Club.objects.all()
    serializer_class = ClubSerializer


class PostViewSet(viewsets.ModelViewSet):
    """
    API endpoint that allows users to be viewed or edited.
    """
    queryset = Post.objects.all()
    serializer_class = PostSerializer


class PostByClubListView(generics.ListAPIView):
    """
    API endpoint that allows users to be viewed or edited.
    """
    serializer_class = PostSerializer

    def get_queryset(self):
        return Post.objects.filter(club=Club.objects.get(pk=self.kwargs.get('club')))
