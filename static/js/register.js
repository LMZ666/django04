$(function(){
    var imgCode = $("#imgCode")
    var change = $(".change")
    var codeinput = $("#code")
    var registerBtn = $(".registerBtn")
    var account = $("#rePh")
    var m1 = $("#m1")
    var m2 = $("#m2")

    function changeCode(){
        $.get("/imagecheck/",function(data){
            console.log($.cookie("code"))
            imgCode.attr("src","/imagecheck/")
        },
        );
    }
    // 图形验证码
    change.click(changeCode)
    imgCode.click(changeCode)
    codeinput.blur(function(){
        console.log($.cookie("code"))
        console.log($(this).val())
        if ($(this).val().lower!==$.cookie("code").lower){
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