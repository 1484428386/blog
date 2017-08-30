<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>个人博客管理系统</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="Charisma, a fully featured, responsive, HTML5, Bootstrap admin template.">
	<meta name="author" content="Muhammad Usman">
	<link rel="stylesheet" href="/statics/css/bootstrap.min.css">
	<link rel="stylesheet" href="/statics/css/style.css">
	<link rel="stylesheet" href="/statics/css/font-awesome.min.css">
	<link rel="apple-touch-icon-precomposed" href="/statics/images/icon/icon.png">
	<link rel="shortcut icon" href="/statics/images/icon/favicon.ico">
	<script src="/statics/js/jquery-2.1.4.min.js"></script>
</head>
<body class="user-select">
<section class="container-fluid">
  <header>
    <nav class="navbar navbar-default navbar-fixed-top">
      <div class="container-fluid">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false"> <span class="sr-only">切换导航</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
          <a class="navbar-brand" href="/main.html">博客管理系统</a></div>
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1"  >
          <ul class="nav navbar-nav navbar-right">
            <li class="dropdown"> <a class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">${userSession.userName} <span class="caret"></span></a>
              <ul class="dropdown-menu dropdown-menu-left">
                <li><a title="查看或修改个人信息" data-toggle="modal" data-target="#seeUserInfo">个人信息</a></li>
                <li><a title="查看您的登录记录" data-toggle="modal" data-target="#seeUserLoginlog">登录记录</a></li>
              </ul>
            </li>
            <li><a href="/loginOut.html" onClick="if(!confirm('是否确认退出？'))return false;">退出登录</a></li>
            <li><a data-toggle="modal" data-target="#WeChat">帮助</a></li>
          </ul>
          <form action="" method="post" class="navbar-form navbar-right" role="search">
          </form>
        </div>
      </div>
    </nav>
  </header>
  
  
  
  
  <div class="row">
    <aside class="col-sm-3 col-md-2 col-lg-2 sidebar">
      <ul class="nav nav-sidebar navmenu" id="navmenu">
        <li><a href="/main.html">总览</a></li>
        <li><a href="/article/article.html">文章</a></li>
        <li><a href="/notice/toNotice.html">公告</a></li>
        <li><a href="/comment/toComment.html">评论</a></li>
        <li><a href="/news/newslist.html" data-toggle="tooltip">好友</a></li>
        <li><a href="/flink/filnkList.html">友情链接</a></li>
        <c:if test="${userSession.roleId==1}">
        	<li><a class="dropdown-toggle" id="userMenu" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">用户</a>
         	 <ul class="dropdown-menu" aria-labelledby="userMenu">
          		<li><a href="/user/list.html">管理用户</a></li>
            	<li><a href="/login/logintimeList.html">管理登录日志</a></li>
          	 </ul>
        	</li>
        </c:if>
      </ul>
    </aside>
