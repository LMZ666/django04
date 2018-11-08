import hashlib
import io
import os
import random
import uuid

from PIL import Image, ImageDraw, ImageFont, ImageFilter
from django.http import HttpResponse, JsonResponse
from django.shortcuts import render, redirect
# Create your views here.
from App.models import User, SlideShow, TimeLimit, Popular, Pbrand, Grv, Carts

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
    data = {
        "slideshow":slideshow,
        "timelimits": timelimit,
        "populars": populars,
        "pbrands": pbrands,
        "islogin": 0
    }
    token = request.session.get("token")
    try:
        user = User.objects.get(token=token)
        data["users"] = user
        data["islogin"] = 1
        return render(request,"index.html",context=data)
    except:
        return render(request,"index.html",context=data)


def getUser(request):
    flag = True
    try:
        user = User.objects.get(account=request.GET.get("account"))
    except:
        flag=False
    print(flag)
    return HttpResponse(flag)

# 只能取到sessionid无法获得token。。。导致无法获取用户信息
# def getCookie(request):
#     # 其实传过来的是sessionid
#     if request.is_ajax():
#         if request.method == "GET":
#             token = request.GET.get("token")
#             if token:
#                 user = User.objects.get(token=token)
#                 return JsonResponse({"user":user})
#     return HttpResponse("999")


# 使用uuid来生成唯一标识符 import uuid
# uuid5推荐使用 第一个参数是一个uuid的str,第二个参数是加密的str此处我们使用name
def getToken(str):
    # uuid5是一个唯一标识符，
    token = uuid.uuid5(uuid.uuid4(), str)
    return str(token)


def getPass(passwd):
    md5 = hashlib.md5()
    md5.update(passwd.encode("utf8"))
    return md5.hexdigest()


# 登录并且保存登录状态
def login(request):

    if request.method == "POST":
        account = request.POST.get("account")
        passwd = request.POST.get("passwd")
        # 数据库中存放的是加密后的passwd所以要用同样的方式对输入过来的passwd加密然后对比
        try:
            user = User.objects.get(account=account, passwd=getPass(passwd))
            response = redirect("app:index")
            # response.set_cookie("name",user.last().name)
            token = str(uuid.uuid5(uuid.uuid4(),"a"))
            user.token= token
            request.session["token"] = token
            response.set_cookie("flag",0)
            user.save()
            return response
        except:
            response = redirect("app:login")
            response.set_cookie("flag",1)
            return response

    return render(request,"login.html")


# 注册并且保存登录状态
# def register(request):
#     if request.method == "POST":
#         account = request.POST.get("account")
#         passwd = request.POST.get("passwd")
#         # 此处调用了getPass方法完成了对passwd的加密
#         # 这个地方被坑了本来我是直接在创建user对象的时候使用token=getToken(account)进行了一次标识
#         # 然后我tmd！！！！！！！在下面调用set_cookie的时候我又调用了一次getToken(account)由于调用了两个，生成的唯一标识不一样，在cookie中的和数据库中的不能匹配
#         token = getToken(account)
#         User.objects.create(account=account, passwd=getPass(passwd), token=token)
#         response = redirect("app:index")
#         response.set_cookie("token", token)
#         return response
#
#     return render(request, "register.html")


# 注销
def register(request):
    if request.method=="POST":
        user = User()
        user.name=request.POST.get("name")
        user.account=request.POST.get("account")
        user.passwd = request.POST.get("passwd")
        user.passwd = getPass(user.passwd)
        user.token = str(uuid.uuid5(uuid.uuid4(),user.name))
        print(user.name,user.account,user.passwd,user.token)
        imgfile = request.FILES.get("imgfile")
        if imgfile:
        # imgfile.name 获取文件名
            path = "static/img/headimg/"
            name = str(uuid.uuid4())
            user.img = path+name+".png"
            with open(user.img,"wb") as fp:
                for img in imgfile.chunks():
                    fp.write(img)
            user.img = "img/headimg/"+name+".png"
            request.session["token"] = user.token
        user.save()
        response = redirect("app:index")
        return response
    return render(request,"register.html")

def logout(request):

    request.session.flush()
    return redirect("app:index")

# 订单页面
def shopcart(request):
    token = request.session.get("token")
    user = User.objects.get(token=token)
    carts = Carts.objects.filter(user=user)

    return render(request,'shopcart.html',{"carts":carts})


def imgCheck(requset):
    # 判断在你存储验证码的文件夹下图片的数量，如果图片数量大于五就会将文件夹下的图片全都删除
    if len(os.listdir("static/img/check")) > 5:

        file_list = os.listdir("static/img/check")
        for file in file_list:
            os.remove(os.path.join("static/img/check", file))
    num = random.randrange(100000)
    path = "static/img/check/" + str(num) + ".png"
    width = 90
    height = 40
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
    font = ImageFont.truetype("static/fonts/QingShu.ttf", 40)
    str1 = "1234567890qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM"

    # 用来保存验证码信息传递到前端
    text = ""
    for i in range(4):
        color = (255, random.randrange(256), random.randrange(256))
        num = str1[random.randrange(len(str1))]
        text += num
        # 第一个参数是距离left，第二个是top
        draw.text((5 + i * 20, 2), num, fill=color, font=font)

    if os.path.exists(path):
        os.remove(path)
    # 将图片保存在指定的文件夹
    image.save(path)
    response = HttpResponse(path)
    # max_age和expires都是指定时间，max_age指定秒数，expires指定天数
    response.set_cookie("imgcode", text, max_age=60 * 10)
    return response

def getAccount(request):
    account = request.GET.get("account")
    data={
        "exist":1
    }
    print(account)
    try:
        User.objects.get(account=account)
        data["exist"]=0
        return JsonResponse(data)
    except:
        return JsonResponse(data)


def toCart(request):
    num = request.GET.get("num")
    goodid = request.GET.get("goodid")
    goods = Pbrand.objects.get(pk=goodid)
    goods.repertoryNum=str(int(goods.repertoryNum)-int(num))
    goods.save()
    token = request.session.get("token")
    user = User.objects.get(token=token)
    cart = Carts.objects.filter(user=user, goods=goods)
    if cart:
        cart = cart.first()
        cart.num = cart.num + int(num)
        cart.save()
    else:
        cart = Carts()
        cart.num = int(num)
        cart.goods = goods
        cart.user = user
    return JsonResponse({"msg":"保存成功"})
