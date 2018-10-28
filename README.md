<!-- markdown-toc start - Don't edit this section. Run M-x markdown-toc-generate-toc again -->
**目录**


  * [小型商城简介](#小型商城简介)
  * [Day01](#Day01)
      * [登录注册功能](#登录注册功能)
      
    
    
<!-- markdown-toc end -->
    
## 小型商城简介
本项目是基于django2，python3.6开发之后的一些日子我基本上每天都会有更新，现在先上传一个基础版本，仅仅实现了登录注册功能，使用的数据库是sqlite3
（比较方便），等到后面我会更换为mysql，
## Day01
### 登录注册功能
使用到的主要技术点:
- cookie
- pillow库
- 反向解析
- ajax

<p>从注册页面开始说起吧， 在注册页面我实现了图形验证码功能，调用的是python的第三方库pillow，用到了随机图片颜色，字体颜色，还给图片加上了模糊处理给功能
，这个验证是用来防止csrf的，为了实现图片的局部刷新我使用了ajax技术，在视图函数register中我使用了重定向的功能，生成了一个response的实例化对象，当接
收到的是post请求时，我会将传递过来的用户数据存放到数据库，通过response设置了一个cookies存放用户的账号，然后返回给主页，在主页的html调用cookies就
可以实现欢迎您XXX这样的功能，然后还有一个注销就是清空将之前存放在cookie中的账号信息清空，就不会出现欢迎字样了，然后就是登录界面，我将数据从前端传
递到了views，在views中使用request.POST.get("data")这样的形式获取到了数据，然后保存到数据库中，同样也使用了重定向，生成一个response对象，设置
cookie，生成了cookie，然后在跳转到主页来获取cookie，唯一不同点就是一个是存放到数据库，一个是和数据库中的数据进行匹配</p>
