$(function(){
	var checkCode = $("input[name='checkCode']")
	var loginBtn = $(".loginBtn")
	//用户名验证
	console.log($.cookie("flag"))
	if($.cookie("flag")=="1"){
		alert("账号或密码错误")
	}
	// name.children().blur(function(){
	// 	if(!telAry.test(name.children().val()) && !mailAry.test(name.children().val())){
	// 		$(this).parent().animate({left:"15px"},500);
	// 		$(this).parent().animate({left:"-15px"},500);
	// 		$(this).parent().animate({left:"0px"},500);
	// 		stop.show();
	// 		stop.delay(2000).hide(0);
	// 	}
	// })

	// 匹配账号字段
		$.get("/imagecheck/", function (data) {
				$("#im").attr("src", "/"+data)
			}
		)
	function checkcode(){
		$.get("/imagecheck/", function (data) {
				$("#im").attr("src", "/"+data)
			},
		);
	}
	checkcode()
	$("#im").click(checkcode)
	loginBtn.click(function(e){

		//toLowerCase()将字符串变为小写的，实现了只要字母输入正确就可以，不管大小写
		if($.cookie("imgcode").toLowerCase()===checkCode.val().toLowerCase()){
			console.log("验证成功")
		}
		else{
			alert("验证码输入错误！")
			e.preventDefault()
			checkcode()
			console.log("验证失败")
			return
		}


	})

})
