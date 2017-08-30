<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/head.jsp"%>
    <div class="col-sm-9 col-sm-offset-3 col-md-10 col-lg-10 col-md-offset-2 main" id="main">
      <form action="" method="post" >
      	<!-- 管理员可见(增加公告) -->
        <c:if test="${userSession.roleId==1}">
        	<h1 class="page-header">操作</h1>
	        <ol class="breadcrumb">
	          <li><a href="/notice/add-notice.html">增加公告</a></li>
	        </ol>
        </c:if>
        
        <h1 class="page-header">公告 <span class="badge">${page.totalCount}</span></h1>
        <div class="table-responsive">
          <table class="table table-striped table-hover">
            <thead>
              <tr>
                <th><span class="glyphicon glyphicon-th-large"></span> <span class="visible-lg">选择</span></th>
                <th><span class="glyphicon glyphicon-file"></span> <span class="visible-lg">标题</span></th>
                <th><span class="glyphicon glyphicon-time"></span> <span class="visible-lg">日期</span></th>
                <th><span class="glyphicon glyphicon-pencil"></span> <span class="visible-lg">操作</span></th>
              </tr>
            </thead>
            <tbody>
				<c:forEach var="notice" items="${page.items}">
            	  <tr>
	                <td><input type="checkbox" class="input-control" id="${notice.id}" name="checkbox[]" value="" /></td>
	                <td class="article-title">${notice.title}</td>
	                <td><fmt:formatDate pattern="yyyy-MM-dd" value="${notice.createDate}" /></td>
	                <td>
	                	<a class="btn btn-info seeNotice" rel="${notice.id}">查看</a> 
	                	<c:if test="${userSession.roleId==1}">
	                		<a class="btn btn-danger delNotice" rel="${notice.id}">删除</a>
	                	</c:if>
	                </td>
	              </tr>
            	</c:forEach>              
            </tbody>
          </table>
        </div>
        <footer class="message_footer">
          <nav>
            <div class="btn-toolbar operation" role="toolbar">
              <div class="btn-group" role="group"> <a class="btn btn-default" onClick="select()">全选</a> <a class="btn btn-default" onClick="reverse()">反选</a> <a class="btn btn-default" onClick="noselect()">不选</a> </div>
              <div class="btn-group" role="group">
                <button class="btn btn-default delAllChe" data-toggle="tooltip" data-placement="bottom" title="删除全部选中" name="checkbox_delete">删除</button>
              </div>
            </div>
            <ul class="pagination pagenav">
              <c:choose>
					<c:when test="${page.page == 1}">
						<li class="active"><a href="javascript:void();" title="首页">首页</a>
						</li>
					</c:when>
					<c:otherwise>
						<li><a
							href="/notice/toNotice.html?startNum=1"
							title="首页">首页</a></li>
					</c:otherwise>
				</c:choose>
				<c:if test="${page.prevPages!=null}">
					<c:forEach items="${page.prevPages}" var="num">
						<li><a
							href="/notice/toNotice.html?startNum=${num}"
							class="number" title="${num}">${num}</a></li>
					</c:forEach>
				</c:if>
				<li class="active"><a href="#" title="${page.page}">${page.page}</a>
				</li>
				<c:if test="${page.nextPages!=null}">
					<c:forEach items="${page.nextPages}" var="num">
						<li><a
							href="/notice/toNotice.html?startNum=${num}"
							title="${num}"> ${num} </a></li>
					</c:forEach>
				</c:if>
				<c:if test="${page.pageCount !=null}">
					<c:choose>
						<c:when test="${page.page == page.pageCount}">
							<li class="active"><a href="javascript:void();" title="尾页">尾页</a>
							</li>
						</c:when>
						<c:otherwise>
							<li><a
								href="/notice/toNotice.html?startNum=${page.pageCount}"
								title="尾页">尾页</a></li>
						</c:otherwise>
					</c:choose>
				</c:if>
				<c:if test="${page.pageCount == null}">
					<li class="active"><a href="javascript:void();" title="尾页">尾页</a>
					</li>
				</c:if>
            </ul>
          </nav>
        </footer>
      </form>
    </div>
  </div>
</section>
<!-- 引入底部 -->
<%@include file="/WEB-INF/jsp/common/foot.jsp"%>
<!-- 查看公告 -->
<div class="modal fade" id="seeNotice" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" >查看公告</h4>
      </div>
      <div class="modal-body">
        <table class="table" style="margin-bottom:0px;" id="showNotice">
          <tr>
			 <td width="20%">标题:</td>
			 <td width="80%">
			 	<input readonly="readonly" class="form-control" name="title" autocomplete="off" />
			 </td>
		  </tr>
          <tr>
			<td width="20%">公告内容:</td>
			<td width="80%"><div name="content"></div></td>
		  </tr>
		  <tr>
			<td width="20%">发布时间:</td>
			<td width="80%">
				<input readonly="readonly" class="form-control" name="createDate" autocomplete="off" />
			</td>
		  </tr>
        </table>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">朕已阅</button>
      </div>
    </div>
  </div>
</div>
<script src="/statics/js/bootstrap.min.js"></script> 
<script src="/statics/js/admin-scripts.js"></script> 
<script src="/statics/localjs/notice.js"></script>
</body>
</html>