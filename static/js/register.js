$(function(){
    // 验证码切换
    console.log("haha")
    $.get("/imagecheck/",function(data){
        console.log(data)
        $("#imgcheck").attr("src", "/"+data)
    })
    $("#imgcheck").click(function(){
        $.get("/imagecheck/",function(data){
        console.log(data)
        $("#imgcheck").attr("src", "/"+data)
    })
    })

    //验证码匹配

    //账号格式还有是否已经被注册
    var flaga = true
    var account = /^\w{6,12}$/
    $("#account input").change(function(){
        $("#account span").show()
        $.get("/getaccount/",{"account":$("#account input").val()},function(data){
            if(data['exist']&&account.test($("#account input").val())){
                $("#account i").hide()
                $("#account span").removeClass("glyphicon-remove").addClass("glyphicon-ok")
                $("#account").addClass("has-success").removeClass("has-error")
            }
            else{
                $("#account i").show()
                $("#account span").removeClass("glyphicon-ok").addClass("glyphicon-remove")
                $("#account").removeClass("has-success").addClass("has-error")
                flaga=false
            }
        })
    })



    function success(tag){
        tag.find("i").hide()
        tag.find("span").removeClass("glyphicon-remove").addClass("glyphicon-ok")
        tag.addClass("has-success").removeClass("has-error")
    }
    function fail(tag){
        tag.find("i").show()
        tag.find("span").removeClass("glyphicon-ok").addClass("glyphicon-remove")
        tag.removeClass("has-success").addClass("has-error")
    }
//    昵称匹配
    var flagn=true
    var name = /^[a-zA-Z\u4e00-\u9fa5]+$/
    $("#name input").change(function(){
        $("#name").find("span").show()
        if (name.test($(this).val())){
            success($("#name"))
        }
        else{
            fail($("#name"))
            flagn=false
        }
    })
//    密码匹配
    var flagp1=true
    var passwd1 = /^\w{6,12}$/
    $("#passwd1 input").change(function(){
        $("#passwd1").find("span").show()
        if(passwd1.test($(this).val())){
            success($("#passwd1"))
        }
        else{
            fail($("#passwd1"))
            flagp1=false
        }
    })
    // 二次匹配
    var flagp2=true
    $("#passwd2 input").change(function(){
        $("#passwd2").find("span").show()
        if($(this).val() == $("#passwd1 input").val()){
            success($("#passwd2"))
        }
        else{
            fail($("#passwd2"))
            $("#passwd2 input").val("")
            flagp2=false
        }
    })
    var flag=flaga&flagp1&flagn&flagp2
    $("#submit input").click(function (e) {
        console.log(flagp2,flagp1,flagn,flaga,flag)
        console.log($.cookie("imgcode"),$("#imgcode input"))
        if(flag & $("#imgcode input").val().toLowerCase()===$.cookie("imgcode").toLowerCase()){
        }
        else{
            e.preventDefault()

            $.get("/imagecheck/",function(data){
            console.log(data)
            $("#imgcheck").attr("src", "/"+data)
            })
            $("#imgcode input").val("")
            alert("请仔细核对信息")

        }
    })


})