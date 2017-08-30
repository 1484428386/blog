<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/head.jsp"%>
<div
	class="col-sm-9 col-sm-offset-3 col-md-10 col-lg-10 col-md-offset-2 main"
	id="main">
	<form action="/Article/checkAll" method="post">
		<h1 class="page-header">操作</h1>
		<ol class="breadcrumb">
			<li><a href="/article/article.html?articleType=all">所有文章</a></li>
			<li><a href="/article/article.html?articleType=my">我的文章</a></li>
			<li><a href="/article/add-article.html">增加文章</a></li>
		</ol>
	</form>
	<h1 class="page-header">
		管理 <span class="badge">${page.totalCount}</span>
	</h1>
	<div class="table-responsive">
		<form action="/article/article.html" method="post"
			class="navbar-form navbar-right search" role="search">
			<div class="input-group">
				<input type="text" class="form-control" name="title"
					autocomplete="off" placeholder="键入标题模糊查询"
					<c:if test="${title!=null}">value=${title}</c:if>> <span
					class="input-group-btn">
					<button class="btn btn-default" type="submit">搜索</button> </span>
			</div>
		</form>
		<table class="table table-striped table-hover">
			<thead>
				<tr>
					<th><span class="glyphicon glyphicon-file"></span> <span
						class="visible-lg">标题</span></th>
					<th><span class="glyphicon glyphicon-list"></span> <span
						class="visible-lg">描述</span></th>
					<th class="hidden-sm"><span
						class="glyphicon glyphicon-comment"></span> <span
						class="visible-lg">评论</span></th>
					<th><span class="glyphicon glyphicon-time"></span> <span
						class="visible-lg">发表日期</span></th>
					<th><span class="glyphicon glyphicon-list"></span> <span
						class="visible-lg">发表人</span></th>
					<th><span class="glyphicon glyphicon-pencil"></span> <span
						class="visible-lg">操作</span></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${page.items}" var="article">
					<tr>
						<td class="article-title">${article.title}</td>
						<td><c:if test="${fn:length(article.describe)>12}">
                        	${fn:substring(article.describe, 0, 12)}...
                  	 	</c:if> <c:if test="${fn:length(article.describe)<=12}">
                         	${article.describe}
                   		</c:if>
						</td>
						<td class="hidden-sm">${article.commentCount}</td>
						<td><fmt:formatDate value="${article.createDate}"
								pattern="yyyy-MM-dd" /></td>
						<td>${article.createName}</td>
						<td><a id="${article.id}" class="btn btn-success commentArticle">评论</a> 
							<a href="/article/see-article.html?id=${article.id}"
							class="btn btn-info modifymember">查看</a> <c:choose>
								<c:when
									test="${article.createName==userSession.userName and userSession.roleId==2}">
									<a rel="${article.id}" class="btn btn-danger delmember">删除</a>
								</c:when>
								<c:otherwise>
									<c:if test="${userSession.roleId==1}">
										<a rel="${article.id}" class="btn btn-danger delmember">删除</a>
									</c:if>
								</c:otherwise>
							</c:choose>
						</td>
					</tr>
				</c:forEach>
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
						<li><a
							href="/article/article.html?startNum=1&articleType=${articleType}&title=${title}"
							title="首页">首页</a></li>
					</c:otherwise>
				</c:choose>
				<c:if test="${page.prevPages!=null}">
					<c:forEach items="${page.prevPages}" var="num">
						<li><a
							href="/article/article.html?startNum=${num}&articleType=${articleType}&title=${title}"
							class="number" title="${num}">${num}</a></li>
					</c:forEach>
				</c:if>
				<li class="active"><a href="#" title="${page.page}">${page.page}</a>
				</li>
				<c:if test="${page.nextPages!=null}">
					<c:forEach items="${page.nextPages}" var="num">
						<li><a
							href="/article/article.html?startNum=${num}&articleType=${articleType}&title=${title}"
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
								href="/article/article.html?startNum=${page.pageCount}&articleType=${articleType}&title=${title}"
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
</div>
</div>
</section>
<!-- 引入底部 -->
<%@include file="/WEB-INF/jsp/common/foot.jsp"%>
<!--评论模态框-->
<div id="commentArticle" class="modal fade">
	<form action="/comment/commentArticle.html" method="post"
		onsubmit="return commentCheck();">
		<input type="hidden" name="articleId">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">个人评论</h4>
				</div>
				<div class="modal-body">
					<table class="table" id="finda">
						<tr>
							<td width="20%">标题:</td>
							<td width="80%"><input type="text" readonly="readonly"
								class="form-control" name="title" maxlength="10"
								autocomplete="off" /></td>
						</tr>
						<tr>
							<td width="20%">标题图片:</td>
							<td width="80%" name="picPath">
						</tr>
						<tr>
							<td width="20%">内容:</td>
							<td width="80%"><div class="form-control" name="content"></div>
						</tr>
						<tr>
							<td width="20%">日期:</td>
							<td width="80%"><input type="text" readonly="readonly"
								class="form-control" name="createDate" maxlength="10"
								autocomplete="off" /></td>
						</tr>
						<tr>
							<td width="20%">评论内容:</td>
							<td width="80%"><textarea name="commentText"
									class="form-control"></textarea></td>
						</tr>
					</table>
				</div>
				<div class="modal-footer">
					<button class="btn btn-default" data-dismiss="modal">关闭</button>
					<input type="submit" class="btn btn-primary" value="评论">
				</div>
			</div>
		</div>
	</form>
</div>
<script src="/statics/js/bootstrap.min.js"></script>
<script src="/statics/localjs/article.js"></script>
<script src="/statics/js/admin-scripts.js"></script>
</body>
</html>