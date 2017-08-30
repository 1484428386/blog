<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/head.jsp"%>
    <div class="col-sm-9 col-sm-offset-3 col-md-10 col-lg-10 col-md-offset-2 main" id="main">
    
       
        <h1 class="page-header">添加好友页面</h1>
      
        <div class="table-responsive">
          <table style="float: right;">
              <tr>
                <td wdith="20%" style="color:red ;">用户名:</td>
                <td>
                <form class="input-group"  action="/news/userbyusername.html" method="post">
                 <input name="name" value="${name}" type="text"  class="form-control"  placeholder="键入关键字搜索" >
                 <span class="input-group-btn">
                 <input class="btn btn-default friendUser" type="submit" value="搜索">
                 </span> 
                </form>
              </td>
              </tr>
         </table>
          <table class="table table-striped table-hover" id="findUserId">
            <thead>
              <tr>
                <th><span class="glyphicon glyphicon-user"></span> <span class="visible-lg">用户名</span></th>
                <th><span class="glyphicon glyphicon-bookmark"></span> <span class="visible-lg">姓名</span></th>
                <th><span class="glyphicon glyphicon-pushpin"></span> <span class="visible-lg">电话</span></th>
                <th><span class="glyphicon glyphicon-pencil"></span> <span class="visible-lg">操作</span></th>
              </tr>
              <c:if test="${userlist!=null}">
                <c:forEach items="${userlist}" var="user">
                <tr>
                <td>${user.userName}</td>
                <td>${user.name}</td>
                <td>${user.phone}</td>
                <td><a class="addfriend" rel="${user.id}">添加</a></td>
                </tr>
            </c:forEach>
              </c:if>
          
            </thead>
         
          </table>
          
        
        </div>
    </div>
  



<!--用户信息模态框-->

<!-- 引入底部 -->
<%@include file="/WEB-INF/jsp/common/foot.jsp"%>
<script src="/statics/js/bootstrap.min.js"></script> 
<script src="/statics/js/admin-scripts.js"></script> 
 <script src="/statics/localjs/friend.js"></script> 
</body>
</html>
