from django.db import models

# Create your models here.
class User(models.Model):
    name = models.CharField(max_length=80,null=True)
    account = models.CharField(max_length=20)
    passwd = models.CharField(max_length=80)
    token = models.CharField(max_length=256,null=True,default=" ")
    img = models.CharField(max_length=256,default="img/headimg/a21345a2-e8b8-42fc-82da-0901885ff2ca.png")

    class Meta:
        db_table="User"

class Brandshow(models.Model):
    img = models.CharField(max_length=100)
    class Meta:
        db_table="brandshow"

# class Base
# class Base(models.Model):
#     img = models.CharField(max_length=100)
#     content = models.CharField(max_length=100)
#     price = models.CharField(max_length=10)
#     class Meta:
#         abstract=True
#
# class Gml(Base):
#     pass
# class Grv(Base):
#     pass
class SlideShow(models.Model):
    img = models.CharField(max_length=150)

    class Meta:
        db_table="slideshow"

class TimeLimit(models.Model):
    img = models.CharField(max_length=100)
    itemTitle = models.CharField(max_length=100)
    itemSub = models.CharField(max_length=100)
    newPrice = models.CharField(max_length=30)
    oldPrice = models.CharField(max_length=20)
    class Meta:
        db_table="timelimit"

class Popular(models.Model):
    img = models.CharField(max_length=100)
    title = models.CharField(max_length=100)
    psnPrice = models.CharField(max_length=10)
    psoPrice = models.CharField(max_length=10)
    class Meta:
        db_table="popular"

# {
# 		"img" : "img/popular/brand1.png",
# 		"title" : "韩国 LANEIGE 兰芝水凝清盈精华水200ml/瓶  ",
# 		"psnPrice" : "￥200",
# 		"psoPrice" : "￥330"
# 	}
class Pbrand(models.Model):
    img = models.CharField(max_length=100)
    title = models.CharField(max_length=100)
    psnPrice = models.CharField(max_length=10)
    psoPrice = models.CharField(max_length=10)
    repertoryNum = models.IntegerField(default=20)

    class Meta:
        db_table="pbrand"
#
# "img" : "img/gooddetail/rightview1.jpg",
# 		"content" : "韩国 VDL SPF30/PA++立体璀璨持久粉底液30ml/瓶 ",
# 		"price" : "¥129"
class Grv(models.Model):
    img = models.CharField(max_length=100)
    content = models.CharField(max_length=200)
    price = models.CharField(max_length=10)
    class Meta:
        db_table='grv'

class Carts(models.Model):
    user = models.ForeignKey(User,on_delete=models.CASCADE)
    # 此处没有goods这个类我其实关联的是Pbrand
    goods = models.ForeignKey(Pbrand,on_delete=models.CASCADE)
    num = models.IntegerField()
    class Meta:
        db_table="carts"

class Order(models.Model):
    identify = models.CharField(max_length=100)
    user = models.ForeignKey(User,on_delete=models.CASCADE)
    createtime = models.DateTimeField(auto_now_add=True)

    class Meta:
        db_table="order"

class OrderGoods(models.Model):
    goods = models.ForeignKey(Pbrand,on_delete=models.CASCADE)
    order = models.ForeignKey(Order,on_delete=models.CASCADE)
    num = models.IntegerField()
    class Meta:
        db_table="ordergoods"





