<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/head.jsp"%>
    <div class="col-sm-9 col-sm-offset-3 col-md-10 col-lg-10 col-md-offset-2 main" id="main">
        <h1 class="page-header">操作</h1>
        <ol class="breadcrumb">
          <li><a href="/login/dellogintime.html">清除所有登录记录</a></li>
          <li><a href="/login/delbyusername.html">清除本人登录记录</a></li>
        </ol>
        <h1 class="page-header">管理 <span class="badge">${page.totalCount}</span></h1>
        <div class="table-responsive">
          <table class="table table-striped table-hover">
            <thead>
              <tr>
                <th><span class="glyphicon glyphicon-th-large"></span> <span class="visible-lg">ID</span></th>
                <th><span class="glyphicon glyphicon-user"></span> <span class="visible-lg">用户</span></th>
                <th><span class="glyphicon glyphicon-time"></span> <span class="visible-lg">时间</span></th>
                <th><span class="glyphicon glyphicon-pencil"></span> <span class="visible-lg">操作</span></th>
              </tr>
            </thead>
            <tbody>
            
            <c:if test="${page.items !=null}">
              <c:forEach items="${page.items}" var="time">
              <tr>
                <td>${time.id}</td>
                <td class="article-title">${time.userName}</td>
                <td><fmt:formatDate value="${time.loginTime}" pattern="yyyy-MM-dd  hh:FF:mm"/></td>
                <td><a class="dellogintime btn btn-danger" rel="${time.id}">删除</a></td>
              </tr>
              </c:forEach>
            </c:if> 
            </tbody>
          </table>
        </div> 
        
        <footer class="message_footer">
		<nav>
			<ul class="pagination pagenav">
				<c:choose>
					<c:when test="${page.page == 1}">
						<li class="active"><a href="javascript:void();" title="首页">首页</a>
						</li>
					</c:when>
					<c:otherwise>
						<li><a href="/login/logintimeList.html?currentpage=1" title="首页">首页</a></li>
					</c:otherwise>
				</c:choose>
				<c:if test="${page.prevPages!=null}">
					<c:forEach items="${page.prevPages}" var="num">
						<li><a href="/login/logintimeList.html?currentpage=${num}"
				 class="number" title="${num}">${num}</a></li>
					</c:forEach>
				</c:if>
				<li class="active"><a href="#" title="${page.page}">${page.page}</a>
				</li>
				<c:if test="${page.nextPages!=null}">
					<c:forEach items="${page.nextPages}" var="num">
						<li><a href="/login/logintimeList.html?currentpage=${num}"
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
							<li><a href="/login/logintimeList.html?currentpage=${page.pageCount}" title="尾页">尾页</a></li>
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
  </div>
</section>
<!-- 引入底部 -->
<%@include file="/WEB-INF/jsp/common/foot.jsp"%>
<script src="/statics/js/bootstrap.min.js"></script> 
<script src="/statics/js/admin-scripts.js"></script> 
<script src="/statics/localjs/logintime.js"></script> 

</body>
</html>
