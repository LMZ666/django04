from django.urls import path

from App import views

urlpatterns = [
    path("login/", views.login, name="login"),
    path("", views.index, name="index"),
    path("register/", views.register, name="register"),
    path("logout/", views.logout, name="logout"),
    path("imagecheck/", views.imgCheck, name="imagecheck"),
    path("logout/", views.logout, name="logout"),
    path("getusers/", views.getUser, name="getusers"),
    path("goodsdetail/<int:num>/", views.goodsdetail, name="goodsdetail"),
    path("shopcart/", views.shopcart, name="shopcart"),
    path("getaccount/",views.getAccount),
    path("addtocart/",views.toCart),
    path("add/",views.add),
    path("minus/",views.minus),
    path("delall/",views.delall),
    path("addorder/",views.addorder),
    path("showorder/",views.showOrder)

]