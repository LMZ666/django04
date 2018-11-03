$(function(){
    var imgCode = $("#imgCode")
    var change = $(".change")
    var codeinput = $("#code")
    var registerBtn = $(".registerBtn")
    var account = $("#rePh")
    var m1 = $("#m1")
    var m2 = $("#m2")
    account.blur(function(){
        $.get("/getusers/",data={"account":account.val()},function(data){
            if (data==="True"){
                alert("用户已经存在！")
                account.val("")
                account.attr("focus","true")
            }
        })
    })
    // 图形验证码
        function changeCode(){
        $.get("/imagecheck/",function(data){
            imgCode.attr("src","/imagecheck/")
            console.log($.cookie("code"))
        },
        );
    }
    imgCode.click(changeCode)
    codeinput.blur(function(){
        if ($(this).val().toLowerCase()!==$.cookie("code").toLowerCase()){
            changeCode()
            alert("请重新输入！")
        }
    })
    registerBtn.click(function(e){
        if (m1.val()!==m2.val()){
            e.preventDefault()
            alert("两次密码输入不一致！")
            return
        }
        else if (m1.val().length>20|m1.val().length<10){
            e.preventDefault()
            alert("密码长度必须在10-20之间")
            return
        }

    })

})