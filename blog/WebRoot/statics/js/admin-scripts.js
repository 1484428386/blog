//当浏览器窗口大小改变时重载网页
/*window.onresize=function(){
    window.location.reload();
}*/

//页面加载时给img和a标签添加draggable属性
(function () {
    $('img').attr('draggable', 'false');
    $('a').attr('draggable', 'false');
})();
 
//设置Cookie
function setCookie(name, value, time) {
    var strsec = getsec(time);
    var exp = new Date();
    exp.setTime(exp.getTime() + strsec * 1);
    document.cookie = name + "=" + escape(value) + ";expires=" + exp.toGMTString();
}
function getsec(str) {
    var str1 = str.substring(1, str.length) * 1;
    var str2 = str.substring(0, 1);
    if (str2 == "s") {
        return str1 * 1000;
    } else if (str2 == "h") {
        return str1 * 60 * 60 * 1000;
    } else if (str2 == "d") {
        return str1 * 24 * 60 * 60 * 1000;
    }
}
 
//获取Cookie
function getCookie(name) {
    var arr, reg = new RegExp("(^| )" + name + "=([^;]*)(;|$)");
    if (arr = document.cookie.match(reg)) {
        return unescape(arr[2]);
    } else {
        return null;
    }
}

var checkall=document.getElementsByName("checkbox[]");  
//全选
function select(){
	for(var $i=0;$i<checkall.length;$i++){  
		checkall[$i].checked=true;  
	}  
};
//反选
function reverse(){
	for(var $i=0;$i<checkall.length;$i++){  
		if(checkall[$i].checked){  
			checkall[$i].checked=false;  
		}else{  
			checkall[$i].checked=true;  
		}  
	}  
}     
//全不选     
function noselect(){ 
	for(var $i=0;$i<checkall.length;$i++){  
		checkall[$i].checked=false;  
	}  
} 
 
//IE6-9禁止用户选中文本
/*document.body.onselectstart = document.body.ondrag = function () {
    return false;
};*/
 
//启用工具提示
$('[data-toggle="tooltip"]').tooltip();
 

//禁止右键菜单
/*window.oncontextmenu = function(){
	return false;
};*/

/*自定义右键菜单*/
/*(function () {
    var oMenu = document.getElementById("rightClickMenu");
    var aLi = oMenu.getElementsByTagName("li");
	//加载后隐藏自定义右键菜单
	//oMenu.style.display = "none";
    //菜单鼠标移入/移出样式
    for (i = 0; i < aLi.length; i++) {
        //鼠标移入样式
        aLi[i].onmouseover = function () {
            $(this).addClass('rightClickMenuActive');
			//this.className = "rightClickMenuActive";
        };
        //鼠标移出样式
        aLi[i].onmouseout = function () {
            $(this).removeClass('rightClickMenuActive');
			//this.className = "";
        };
    }
    //自定义菜单
    document.oncontextmenu = function (event) {
		$(oMenu).fadeOut(0);
        var event = event || window.event;
        var style = oMenu.style;
        $(oMenu).fadeIn(300);
		//style.display = "block";
        style.top = event.clientY + "px";
        style.left = event.clientX + "px";
        return false;
    };
    //页面点击后自定义菜单消失
    document.onclick = function () {
        $(oMenu).fadeOut(100);
		//oMenu.style.display = "none"
    }
})();*/

/*禁止键盘操作*/
/*document.onkeydown=function(event){
	var e = event || window.event || arguments.callee.caller.arguments[0];
	if((e.keyCode === 123) || (e.ctrlKey) || (e.ctrlKey) && (e.keyCode === 85)){
		return false;
	}
}; */

function checkInput(){
    var name=$("#seeUserInfo").find("input[name='name']").val();
    var username=$("#seeUserInfo").find("input[name='username']").val();
    var userPwd=$("#seeUserInfo").find("input[name='userPwd']").val();
    var old_password=$("#seeUserInfo").find("input[name='old_password']").val();;
    var phone=$("#seeUserInfo").find("input[name='phone']").val();
    var password=$("#seeUserInfo").find("input[name='password']").val();
    var new_password=$("#seeUserInfo").find("input[name='new_password']").val();

    $("#errorInfo").css("color", "red");

    if(name==null || name==""){
        $("#seeUserInfo").find("input[name='name']").focus();
        $("#errorInfo").text("姓名不能为空!");
        return false;
    }
    if(username==null || username==""){
        $("#seeUserInfo").find("input[name='username']").focus();
        $("#errorInfo").text("用户名不能为空!");
        return false;
    }
    if(phone.length!=11&phone.length!=0){
        $("#seeUserInfo").find("input[name='phone']").focus();
        $("#errorInfo").text("电话长度必须是11位!");
        return false;
    }
    if(userPwd!=old_password){
        $("#seeUserInfo").find("input[name='old_password']").focus();
        $("#errorInfo").text("旧密码输入有误!");
        return false;
    }
    if(password.length<6){
        $("#seeUserInfo").find("input[name='password']").focus();
        $("#errorInfo").text("新密码长度不能小于6!");
        return false;
    }
    if(password!=new_password){
        $("#seeUserInfo").find("input[name='new_password']").focus();
        $("#errorInfo").text("确认密码输入有误!");
        return false;
    }
    return true;
}

