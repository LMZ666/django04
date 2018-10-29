from django.db import models

# Create your models here.
class User(models.Model):
    name = models.CharField(max_length=80,null=True)
    account = models.CharField(max_length=20)
    passwd = models.CharField(max_length=20)
    token = models.CharField(max_length=256,null=True,default=" ")

    class Meta:
        db_table="User"
