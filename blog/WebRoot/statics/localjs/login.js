$("#signinSubmit").click(function() {
	var user = new Object();
	user.userName = $.trim($("#userName").val());
	user.userPwd = $.trim($("#userPwd").val());
	if (user.userName == "" || user.userName == null) {
		$("#userName").focus();
		$("#formtip").css("color", "red");
		$("#formtip").html("对不起，登录账号不能为空。");
	} else if (user.userPwd == "" || user.userPwd == null) {
		$("#userPwd").focus();
		$("#formtip").css("color", "red");
		$("#formtip").html("对不起，登录密码不能为空。");
	} else {
		$("#formtip").html("");

		$.ajax({
			url : '/login.html',
			type : 'POST',
			data : {
				user : JSON.stringify(user)
			},
			dataType : 'html',
			timeout : 1000,
			error : function() {
				$("#formtip").css("color", "red");
				$("#formtip").html("登录失败！请重试。");
			},
			success : function(result) {
				if (result != "" && "success" == result) {
					window.location.href = "/main.html";
				} else if ("failed" == result) {
					$("#formtip").css("color", "red");
					$("#formtip").html("登陆失败！请重试。");
					$("#userName").val('');
					$("#userPwd").val('');
				} else if ("nologincode" == result) {
					$("#formtip").css("color", "red");
					$("#formtip").html("登录账号不存在，请重试。");
				} else if ("nodata" == result) {
					$("#formtip").css("color", "red");
					$("#formtip").html("对不起，没有任何数据需要处理！请重试。");
				} else if ("pwderror" == result) {
					$("#formtip").css("color", "red");
					$("#formtip").html("登录密码错误，请重试。");
				}
			}
		});
	}
});