from django.urls import path, include
from rest_framework import routers
from . import views


router = routers.DefaultRouter()
router.register(r'posts', views.PostViewSet)
router.register(r'clubs', views.ClubViewSet)


urlpatterns = [
    path('', include(router.urls)),
    path('posts/clubs/<int:club>/', views.PostByClubListView.as_view())
]