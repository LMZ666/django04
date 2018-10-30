from django.urls import path

from App import views

urlpatterns=[
    path("login/",views.login,name="login"),
    path("",views.index,name="index"),
    path("register/",views.register,name="register"),
    path("logout/",views.logout,name="logout"),
    path("imagecheck/",views.imageCheck,name="imagecheck"),
    path("getcookie/",views.getCookie),
    path("logout/",views.logout,name="logout")
]