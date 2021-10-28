from django.db import models

# Create your models here.
class Club(models.Model):
    name = models.TextField()

    def __str__(self):
        return self.name


class Post(models.Model):
    club = models.ForeignKey(Club, on_delete=models.CASCADE)
    title = models.TextField()
    description = models.TextField(blank=True)
    image = models.ImageField(upload_to ='uploads/', null=True, blank=True)
    publish_date = models.DateField(auto_now=True)

    def __str__(self):
        return f"Post(title{self.title}, club={self.club.name})"
