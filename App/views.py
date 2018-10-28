import io
import random

from PIL import Image, ImageDraw, ImageFont, ImageFilter
from django.http import HttpResponseRedirect, HttpResponse
from django.shortcuts import render, redirect

# Create your views here.
from App.models import User


def indextest(request):
    name = request.COOKIES.get("name")
    return render(request, "indextest.html", {"name": name})
def index(request):
    name = request.COOKIES.get("name")
    return render(request, "index.html",{"name":name})


def login(request):
    flag = True
    if request.method=="POST":
        account = request.POST.get("account")
        passwd = request.POST.get("passwd")
        print(account)
        print(passwd)
        user = User.objects.filter(account=account).filter(passwd=passwd)
        if user:
            response = redirect("app:index")
            response.set_cookie("name",user.last().name)
            return response
        else:
            flag = False
            response = redirect("app:login")
            response.set_cookie("flag",flag)
            return response

    return render(request,"login.html",{"flag" : flag})

def test(request,num):

    return render(request,"test.html",{"num" : num})


def register(request):
    if request.method=="POST":
        account = request.POST.get("account")
        passwd = request.POST.get("passwd")
        User.objects.create(account=account,passwd=passwd)
        response = redirect("app:index")
        response.set_cookie("account",account)
        return response

    return render(request, "register.html")


def logout(request):
    response = redirect("app:indextest")
    response.delete_cookie("name")
    return response

def imageCheck(request):

    width = 100
    height = 50
    color = (random.randrange(256), random.randrange(256), random.randrange(256))
    image = Image.new("RGB", (width, height), color)
    # 画出了一张图片
    draw = ImageDraw.Draw(image)
    # 添加噪点
    for i in range(200):
        xy = (random.randrange(100), random.randrange(50))
        color = (random.randrange(256), random.randrange(256), random.randrange(256))
        draw.point(xy, fill=color)

    # 获取到字体  有的字体会用不了，如果没有显示出文字就换个字体
    font = ImageFont.truetype("static/font/QingShu.ttf", 40)
    str1 = "1234567890qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM"
    text = ""
    for i in range(4):
        color = (255, random.randrange(256), random.randrange(256))
        str2 = str1[random.randrange(len(str1))]
        text += str2
        draw.text((5 + i * 20, 5), str2, fill=color, font=font)
    del draw
    buff = io.BytesIO()
    image = image.filter(ImageFilter.BLUR)
    image.save(buff, "png")
    response = HttpResponse(buff.getvalue(), "image/png")
    response.set_cookie("code",text)
    return response