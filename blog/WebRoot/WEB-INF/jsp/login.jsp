<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>个人博客管理系统</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" href="/statics/css/bootstrap.min.css">
	<link rel="stylesheet" href="/statics/css/style.css">
	<link rel="stylesheet" href="/statics/css/login.css">
	<link rel="apple-touch-icon-precomposed" href="/statics/images/icon/icon.png">
	<link rel="shortcut icon" href="/statics/images/icon/favicon.ico">
	<script src="/statics/js/jquery-2.1.4.min.js"></script>
  </head>
 <body class="user-select">
<div class="container">
  <div class="siteIcon"><img src="statics/images/icon/icon.png" alt="" data-toggle="tooltip" data-placement="top" title="欢迎使用个人博客管理系统" draggable="false" /></div>
   <div class="form-signin" > 
    <h2 class="form-signin-heading">用户登录</h2>
    <label for="userName" class="sr-only">用户名</label>
    <input type="text" id="userName" name="username" class="form-control" placeholder="请输入用户名" required autofocus autocomplete="off" maxlength="10">
    <label for="userPwd" class="sr-only">密码</label>
    <input type="password" id="userPwd" name="userpwd" class="form-control" placeholder="请输入密码" required autocomplete="off" maxlength="18">
    <ul id="formtip"></ul>
    <button class="btn btn-lg btn-primary btn-block" type="submit" id="signinSubmit">登录</button>
 </div> 
</div>
<script src="/statics/js/bootstrap.min.js"></script> 
<script src="/statics/localjs/login.js"></script>
</body>
</html>
