import hashlib
import io
import random
import uuid

from PIL import Image, ImageDraw, ImageFont, ImageFilter
from django.http import HttpResponse
from django.shortcuts import render, redirect
# Create your views here.
from App.models import User, SlideShow, TimeLimit, Popular, Pbrand, Grv

slideshow = SlideShow.objects.all()
timelimit = TimeLimit.objects.all()
populars = Popular.objects.all()
pbrands = Pbrand.objects.all()
grv = Grv.objects.all()
# 商品详情页
def goodsdetail(request,num):
    goods = pbrands.get(pk=num)
    data = {
        "grv": grv,
        "goods": goods

    }
    return render(request, "goodsdetail.html",context=data)

# 返回主页
def index(request):
    data={
        "slideshow":slideshow,
        "timelimits": timelimit,
        "populars": populars,
        "pbrands": pbrands,

    }
    token = request.COOKIES.get("token")
    user = User.objects.filter(token=token)
    if user:
        data['name']=user.last().account
        return render(request, "index.html", context=data)
    else:
        return render(request, "index.html",context=data)

def getUser(request):
    flag = True
    try:
        user = User.objects.get(account=request.GET.get("account"))
    except:
        flag=False
    print(flag)
    return HttpResponse(flag)

def getCookie(request):
    if request.is_ajax():
        if request.method == "GET":
            token = request.GET.get("token")
            print(token)
            if token:
                try:
                    users = User.objects.get(token=token)
                    print("cunzai")
                    return HttpResponse(users.account)
                except:
                    print()
    return HttpResponse("999")


def logout(request):
    response = redirect("app:index")
    response.delete_cookie("token")
    return response




# 使用uuid来生成唯一标识符 import uuid
# uuid5推荐使用 第一个参数是一个uuid的str,第二个参数是加密的str此处我们使用name
def getToken(str):
    # uuid5是一个唯一标识符，
    token = uuid.uuid5(uuid.uuid4(), str)
    return token


def getPass(passwd):
    md5 = hashlib.md5()
    md5.update(passwd.encode("utf8"))
    return md5.hexdigest()


# 登录并且保存登录状态
def login(request):
    if request.method == "POST":
        account = request.POST.get("account")
        passwd = request.POST.get("passwd")
        print(account)
        print(passwd)
        # 数据库中存放的是加密后的passwd所以要用同样的方式对输入过来的passwd加密然后对比
        try:
            user = User.objects.get(account=account, passwd=getPass(passwd))
            response = redirect("app:index")
            # response.set_cookie("name",user.last().name)
            token = getToken(user.account)
            response.set_cookie("token", token)
            user.token = token
            print(token)
            user.save()
            return response
        except:
            response = redirect("app:login")
            return response
    return render(request,"login.html")


# 注册并且保存登录状态
def register(request):
    if request.method == "POST":
        account = request.POST.get("account")
        passwd = request.POST.get("passwd")
        # 此处调用了getPass方法完成了对passwd的加密
        # 这个地方被坑了本来我是直接在创建user对象的时候使用token=getToken(account)进行了一次标识
        # 然后我tmd！！！！！！！在下面调用set_cookie的时候我又调用了一次getToken(account)由于调用了两个，生成的唯一标识不一样，在cookie中的和数据库中的不能匹配
        token = getToken(account)
        User.objects.create(account=account, passwd=getPass(passwd), token=token)
        response = redirect("app:index")
        response.set_cookie("token", token)
        return response

    return render(request, "register.html")


# 注销
def logout(request):
    response = redirect("app:index")
    response.delete_cookie("token")
    return response


# 验证码保存在session中
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
    # image = image.filter(ImageFilter.BLUR)
    image.save(buff, "png")
    response = HttpResponse(buff.getvalue(), "image/png")
    response.set_cookie("code", text)
    return response


def shopcart(request):

    return render(request,'shopcart.html')