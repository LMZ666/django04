$(function () {
    var slide = $("#slide");
    var btn = $("#btn");
    var btnLi = $("#btn li");
    $.get("/getcookie/", data = {"token": $.cookie("token")}, function (data) {
        if (data === "999") {
            alert("用户未登录")
        }
        else {
            alert("欢迎" + data)
        }
    })
    //轮播图
    new Swiper('.swiper-container', {
        spaceBetween: 5,
      centeredSlides: true,
      autoplay: {
        delay: 2500,
        disableOnInteraction: false,
      },
      pagination: {
        el: '.swiper-pagination',
        clickable: true,
      },
      loop:true,
    });

    //限时抢购
    var itemImg = $(".itemImg");
    var itemTitle = $(".itemTitle");
    var itemSub = $(".itemSub");
    var newPrice = $(".newPrice");
    var oldPrice = $(".oldPrice");


    //人气热销
    var proImg = $(".pro-img");
    var proTitle = $(".pro-title");
    var psnPrice = $(".psnPrice");
    var psoPrice = $(".psoPrice");
    var proPic = $(".pro-pic");
    var infoTitle = $(".info-title");
    var pnPrice = $(".pn-price");
    var poPrice = $(".po-price");
    var pTitle = $(".p-title");
    var pShow = $(".p-show");
    var lt = $(".lt");
    var gt = $(".gt");
    var bSlide = $(".b-slide");
    var bShow = $(".b-show");

    pTitle.find("li").children().mouseenter(function () {
        var index = $(this).parent().index();
        $(this).removeClass().addClass("p-tab");
        $(this).parent().siblings().children().removeClass("p-tab");
        pShow.children().eq(index).show().siblings().hide();
    })

    $.getJSON("../../static/json/popular.json", function (pdata) {
        for (var i = 0; i < pdata.length; i++) {
            var obj = pdata[i];
            img = $("<img src=" + "../../static/" + obj.img + " />");
            pTitle = obj.title;
            pSnPrice = obj.psnPrice;
            pSoPrice = obj.psoPrice;
            proImg.eq(i).append(img);
            proTitle.eq(i).html(pTitle);
            psnPrice.eq(i).html(pSnPrice);
            psoPrice.eq(i).html(pSoPrice);
        }
    })
    lt.click(function () {
        bSlide.find("a").first().hide();
        bSlide.find("a").last().show();
        lt.css({color: "lightgray"});
        gt.css({color: "#7b7c7d"});
        bShow.find("li").last().show();
        bShow.find("li").first().hide();
    })

    gt.click(function () {
        bSlide.find("a").last().hide();
        bSlide.find("a").first().show();
        gt.css({color: "lightgray"});
        lt.css({color: "#7b7c7d"});
        bShow.find("li").last().hide();
        bShow.find("li").first().show();
    })

    //新品上架
    var goodsMajor = $(".goodsMajor");
    var goodsTab = $("#goodsTab").find("li");
    var lwing = $(".lwing");
    var cbody = $(".cbody");
    var rwing = $(".rwing");
    var glwing = $(".glwing");
    var gcbody = $(".gcbody");
    var grwing = $(".grwing");
    var nroImg = $(".nro-img");
    var nroTitle = $(".nro-title");
    var nsnPrice = $(".nsnPrice");
    var nsoPrice = $(".nsoPrice");
    var j = 0;

    goodsTab.children().mouseenter(function () {
        var index = $(this).parent().index();
        $(this).removeClass().addClass("p-tab");
        $(this).parent().siblings().children().removeClass("p-tab");
        goodsMajor.eq(index).show();
        goodsMajor.eq(1 - index).hide();

    })

    $.getJSON("../../static/json/newscom.json", function (ndata) {
        lwing.append($("<img src=" + "../../static/" + ndata[0].img + " />"));
        cbody.append($("<img src=" + "../../static/" + ndata[1].img + " />"));
        rwing.append($("<img src=" + "../../static/" + ndata[2].img + " />"));
        for (var i = 3; i < ndata.length; i++) {
            var obj = ndata[i];
            img = $("<img src=" + "../../static/" + obj.img + " />");
            nTitle = obj.title;
            img.addClass("nproimg")
            nSnPrice = obj.psnPrice;
            nSoPrice = obj.psnPrice;
            nroImg.eq(j).append(img);
            nroTitle.eq(j).html(pTitle);
            nsnPrice.eq(j).html(pSnPrice);
            nsoPrice.eq(j).html(pSoPrice);
            j++;
        }
    })

    $.getJSON("../../static/json/newsclothe.json", function (ncdata) {
        glwing.append($("<img src=" + "../../static/" + ncdata[0].img + " />"));
        gcbody.append($("<img src=" + "../../static/" + ncdata[1].img + " />"));
        grwing.append($("<img src=" + "../../static/" + ncdata[2].img + " />"));
        for (var i = 3; i < ncdata.length; i++) {
            var obj = ncdata[i];
            img = $("<img src=" + "../../static/" + obj.img + " />");
            nTitle = obj.title;
            img.addClass("nproimg")
            nSnPrice = obj.psnPrice;
            nSoPrice = obj.psnPrice;
            nroImg.eq(j).append(img);
            nroTitle.eq(j).html(pTitle);
            nsnPrice.eq(j).html(pSnPrice);
            nsoPrice.eq(j).html(pSoPrice);
            j++;
        }
    })

    //随便看看
    var seeRight = $(".seeRight");
    var seeList = $(".seeList");
    var purchase = $(".purchase")
    $.getJSON("../../static/json/havelook.json", function (data) {
        for (var i = 0; i < 8; i++) {
            var obj = data[i];
            li = $("<li><a href=‘#’><img src=" + "../../static/" + obj.img + " /></a></li>");
            h4 = $("<h4>" + obj.title + "</h4>");
            div = $("<div></div>");
            newPrice = $("<span>" + obj.newprice + "</span>");
            oldPrice = $("<span>" + obj.oldprice + "</span>");
            newPrice.addClass("seenewprice");
            oldPrice.addClass("seeoldprice");
            seeList.eq(0).append(li);
            li.find("a").append(h4);
            li.find("a").append(div);
            div.append(newPrice);
            div.append(oldPrice);
        }
        for (var i = 8; i < data.length; i++) {
            var obj = data[i];
            li = $("<li><a href=‘#’><img src=" + "../../static/" + obj.img + " /></a></li>");
            h4 = $("<h4>" + obj.title + "</h4>");
            div = $("<div></div>");
            newPrice = $("<span>" + obj.newprice + "</span>");
            oldPrice = $("<span>" + obj.oldprice + "</span>");
            newPrice.addClass("seenewprice");
            oldPrice.addClass("seeoldprice");
            seeList.eq(1).append(li);
            li.find("a").append(h4);
            li.find("a").append(div);
            div.append(newPrice);
            div.append(oldPrice);
            purchase.eq(1).css({marginTop: "20px"})
        }
    })

    //品牌推荐
    var litbrand = $(".litbrand");
    $.getJSON("../../static/json/brandshow.json", function (data) {
        for (var i = 0; i < data.length; i++) {
            var obj = data[i];
            a = $("<a href=‘#’><img src=" + "../../static/" + obj.img + " /></a>");
            litbrand.append(a);
        }
    })

    //倒计时
    var timer = setInterval(function () {
        var endtime = new Date($(".lxftime").attr("endtime")).getTime();
        var nowtime = new Date().getTime();
        var youtime = endtime - nowtime;
        var seconds = youtime / 1000;
        var minutes = Math.floor(seconds / 60);
        var hours = Math.floor(minutes / 60);
        var days = Math.floor(hours / 24);
        var CDay = days;
        var CHour = hours % 24;
        var CMinute = minutes % 60;
        var CSecond = Math.floor(seconds % 60);
        seconds--;
        $(".lxftime").html("<i>剩余时间：</i><span>" + days + "</span><em>天</em><span>" + CHour + "</span><em>时</em><span>" + CMinute + "</span><em>分</em><span>" + CSecond + "</span><em>秒</em>");
    }, 1000)

    var timer = setInterval(function () {
        var endtime = new Date($(".lxftime1").attr("endtime")).getTime();
        var nowtime = new Date().getTime();
        var youtime = endtime - nowtime;
        var seconds = youtime / 1000;
        var minutes = Math.floor(seconds / 60);
        var hours = Math.floor(minutes / 60);
        var days = Math.floor(hours / 24);
        var CDay = days;
        var CHour = hours % 24;
        var CMinute = minutes % 60;
        var CSecond = Math.floor(seconds % 60);
        seconds--;
        $(".lxftime1").html("<span>" + CHour + "</span><em>时</em><span>" + CMinute + "</span><em>分</em><span>" + CSecond + "</span><em>秒</em>");
    }, 1000)

    $(".popularity").find("a").mouseenter(function () {
        console.log()
        $(this).find("img").animate({width: "100%", height: "100%"}, 200)
    }).mouseleave(function () {
        $(this).find("img").animate({width: "90%", height: "90%"}, 200)
    })

    //获取购物车
    var carts = $.cookie("carts");
    var cartNum = $(".cart-num");
    carts = JSON.parse($.cookie("carts"));
    for (var i = 0; i < carts.length; i++) {
        cartNum.html(carts[i].num);
    }


})
