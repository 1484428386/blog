<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/head.jsp"%>
    <div class="col-sm-9 col-sm-offset-3 col-md-10 col-lg-10 col-md-offset-2 main" id="main">
      <form action="/Flink/checkAll" method="post" >
        <h1 class="page-header">操作</h1>
        <ol class="breadcrumb">
          <li><a href="/flink/toaddflink.html">增加友情链接</a></li>
        </ol>
        <h1 class="page-header">管理 <span class="badge">${page.totalCount}</span></h1>
        <div class="table-responsive">
          <table class="table table-striped table-hover">
            <thead>
              <tr>
                <th><span class="glyphicon glyphicon-th-large"></span> <span class="visible-lg">选择</span></th>
                <th><span class="glyphicon glyphicon-bookmark"></span> <span class="visible-lg">名称</span></th>
                <th><span class="glyphicon glyphicon-link"></span> <span class="visible-lg">URL</span></th>
                <th><span class="glyphicon glyphicon-pencil"></span> <span class="visible-lg">操作</span></th>
              </tr>
            </thead>
            <tbody id="functionList">
               
               <c:forEach items="${page.items}" var="flink">
               <tr>
                <td >
                <input class="checkbox" id="${flink.id}" type="checkbox" class="input-control sss" name="checkbox"/>
                </td>
                <td class="article-title">${flink.name}</td>
                <td>${flink.url}</td>
                <td><a href="/flink/flinkbyid.html?id=${flink.id}" class="btn btn-warning">修改</a> <a class="delflink btn btn-danger" rel="${flink.id}">删除</a></td>
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
                <button id="delfilink" type="button" class="btn btn-default" data-toggle="tooltip" data-placement="bottom" title="删除全部选中" name="checkbox_delete">删除</button>
              </div>
            </div>
            
          </nav>
        </footer>
      </form>
      
      <footer class="message_footer">
		<nav>
			<ul class="pagination pagenav">
				<c:choose>
					<c:when test="${page.page == 1}">
						<li class="active"><a href="javascript:void();" title="首页">首页</a>
						</li>
					</c:when>
					<c:otherwise>
						<li><a href="/flink/filnkList.html?currentpage=1" title="首页">首页</a></li>
					</c:otherwise>
				</c:choose>
				<c:if test="${page.prevPages!=null}">
					<c:forEach items="${page.prevPages}" var="num">
						<li><a href="/flink/filnkList.html?currentpage=${num}"
				 class="number" title="${num}">${num}</a></li>
					</c:forEach>
				</c:if>
				<li class="active"><a href="#" title="${page.page}">${page.page}</a>
				</li>
				<c:if test="${page.nextPages!=null}">
					<c:forEach items="${page.nextPages}" var="num">
						<li><a href="/flink/filnkList.html?currentpage=${num}"
				 class="number" title="${num}">${num}</a></li>
					</c:forEach>
				</c:if>
				<c:if test="${page.pageCount !=null}">
					<c:choose>
						<c:when test="${page.page == page.pageCount}">
							<li class="active"><a href="javascript:void();" title="尾页">尾页</a>
							</li>
						</c:when>
						<c:otherwise>
							<li><a href="/flink/filnkList.html?currentpage=${page.pageCount}" title="尾页">尾页</a></li>
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
     
    </div>
  
<!-- 引入底部 -->
<%@include file="/WEB-INF/jsp/common/foot.jsp"%>
<script src="/statics/js/bootstrap.min.js"></script> 
<script src="/statics/js/admin-scripts.js"></script> 
<script src="/statics/localjs/flink.js"></script>
</body>
</html>