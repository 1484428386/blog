<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/head.jsp"%>
    <div class="col-sm-9 col-sm-offset-3 col-md-10 col-lg-10 col-md-offset-2 main" id="main">
    <h1 class="page-header">操作</h1>
        <ol class="breadcrumb">
          <li><a  href="/news/addfriend.html" >增加好友</a></li>
        </ol>
        <h1 class="page-header">我的好友 </h1>
        <div class="table-responsive">
          <table class="table table-striped table-hover" id="findUserId">
            <thead>
              <tr>
                <th><span class="glyphicon glyphicon-user"></span> <span class="visible-lg">用户名</span></th>
                <th><span class="glyphicon glyphicon-bookmark"></span> <span class="visible-lg">姓名</span></th>
                <th><span class="glyphicon glyphicon-pushpin"></span> <span class="visible-lg">电话</span></th>
                <th><span class="glyphicon glyphicon-pencil"></span> <span class="visible-lg">操作</span></th>
              </tr>
            </thead>
            <thead>
              <c:if test="${friendlist!=null}">
                <c:forEach items="${friendlist}" var="user">
                 <tr>
                   <td>
                     ${user.userName}
                   </td>
                   <td>
                     ${user.name}
                   </td>
                   <td>
                     ${user.phone}
                   </td>
                   <td>
                       <a href="/news/newsroot.html?createId=${user.addFriend}" class="btn btn-success">回复</a>
                       <a rel="${user.addFriend}"   dir="${user.createId}" class="delfriend btn btn-danger" >删除好友</a>
                   </td>
                 </tr>
                </c:forEach>
                  </c:if>
           <c:if test="${friendstatuc!=null}" >
            <c:forEach items="${friendstatuc}" var="statuc">
               <tr> 
                   <td> ${statuc.userName}</td>
                   <td>${statuc.name}</td>
                   <td>${statuc.phone} </td>
                   <td>
                        <a rel="${statuc.addFriend}" dir="${statuc.createId}" class="consent btn btn-success">同意</a>
                        <a rel="${statuc.addFriend}"  dir="${statuc.createId}" class="refuse btn btn-danger">拒绝</a>
                   </td>
                </tr>
              </c:forEach>         
               </c:if>
                        
            
            </thead>
              
            </tbody>
          </table>
          
        </div>
    </div>
  


<!--聊天记录模态框-->
<div class="modal fade"  id="friendroot" tabindex="-1" role="dialog" aria-labelledby="addUserModalLabel">
  <div class="modal-dialog" role="document" style="max-width:450px;">
    <form action="/user/modifyUser.html" method="post"   onsubmit="return modifyUser();">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
          <h4 class="modal-title" >修改用户</h4>
        </div>
        <div class="modal-body">
        <ul id="modify_formtip"></ul>
          <table class="table" style="margin-bottom:0px;">
            <thead>
             
            </thead>
            <tbody>
               
              <tr>
                <td wdith="20%">姓名:</td>
                <td width="80%">
                <input id="m_id" type="hidden" name="id">
                 <input id="m_name"  type="text" value="" class="form-control" name="name" maxlength="10" autocomplete="off" /></td>
              </tr>
              <tr>
                <td wdith="20%">用户名:</td>
                <td width="80%"><input id="m_userName" type="text" value="" class="form-control" name="userName" maxlength="10" autocomplete="off" /></td>
              </tr>
              <tr>
                <td wdith="20%">电话:</td>
                <td width="80%"><input id="m_phone" type="text" value="" class="form-control" name="phone" maxlength="13" autocomplete="off" /></td>
              </tr>
              <tr>
                <td wdith="20%">密码:</td>
                <td width="80%"><input id="m_userpwd"  type="password" value="" class="form-control" name="m_password" maxlength="18" autocomplete="off" /></td>
              </tr>
              <tr>
                <td wdith="20%">新密码:</td>
                <td width="80%"><input id="m_password2" type="password" class="form-control" name="userPwd" maxlength="18" autocomplete="off" /></td>
              </tr>
              <tr>
                 <td width="20%">用户角色</td>
                 <td>
                  <select id="m_roleId" name="roleId">
                  <!-- <option value="">--请选择--</option>
                  <option value="1">管理员</option>
                  <option value="2">普通用户</option> -->
                 </select> 
                 </td>
              </tr>
            </tbody>
            <tfoot>
              <tr></tr>
            </tfoot>
          </table>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
          <button type="submit" id="modifyUser"  class="btn btn-primary">提交</button>
        </div>
      </div>
    </form>
  </div>
</div>

<div>



</div>
<!-- 引入底部 -->
<%@include file="/WEB-INF/jsp/common/foot.jsp"%>
<script src="/statics/js/bootstrap.min.js"></script> 
<script src="/statics/js/admin-scripts.js"></script> 
 <script src="/statics/localjs/friend.js"></script>
</body>
</html>
