from django.urls import path

from App import views

urlpatterns=[
    path("",views.indextest,name="indextest"),
    path("login/",views.login,name="login"),
    path("test/<int:num>/",views.test),
    path("index/",views.index,name="index"),
    path("register/",views.register,name="register"),
    path("logout/",views.logout,name="logout"),
    path("imagecheck/",views.imageCheck,name="imagecheck")
]