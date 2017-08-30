<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/head.jsp"%>
<div class="col-sm-9 col-sm-offset-3 col-md-10 col-lg-10 col-md-offset-2 main" id="main">
	<div class="row">
		<div class="add-article-form">
			<div class="col-md-9">
				<h1 class="page-header">查看文章</h1>

				<div class="add-article-box">
					<h2 class="add-article-box-title">
						<span>文章标题</span>
					</h2>
					<div class="add-article-box-content">
						<input type="text" readonly="readonly" class="form-control"
							name="keywords" autocomplete="off" value="${article.title}">
					</div>
				</div>

				<div class="add-article-box">
					<h2 class="add-article-box-title">
						<span>文章内容</span>
					</h2>
					<div class="add-article-box-content" id="seeArticleContent">${article.content}</div>
				</div>


				<!-- 评论 -->
				<div class="row-fluid sortable">
					<div class="box span12">
						<div class="add-article-box">
							<div class="box-header well" data-original-title>
								<h2>
									<i class="icon-user"></i> 评论列表
								</h2>
							</div>

							<div>
								<ul style="padding-left: 15px" id="commentAndReply">
									<c:forEach items="${page.items}" var="comment">
										<li>
											${comment.reviewer}  :
											<span>&nbsp;&nbsp;&nbsp;&nbsp;${comment.commentText}</span><br/>
											<span style="margin-right: 200px;">&nbsp;&nbsp;<fmt:formatDate value='${comment.createDate}' pattern='yyyy-MM-dd HH:mm:ss' /></span>
											<span>
												<c:choose>
													<c:when test="${comment.reviewer==userSession.userName}">
														<a id="${comment.id}" name="comment" class="btn btn-danger" onClick="del(this)">删除</a>
													</c:when>
													<c:otherwise>
														<a id="${comment.id}" class="btn btn-success replyComment">回复</a>
													</c:otherwise>
												</c:choose>
											</span>
											<div class="myComment" id="${comment.id}" rel="${comment.reviewer}"></div>
										</li>
										<hr/>
									</c:forEach>
								</ul>
							</div>
							<footer class="message_footer">
								<nav>
									<ul class="pagination pagenav">
										<c:choose>
											<c:when test="${page.page == 1}">
												<li class="active"><a href="javascript:void();"
													title="首页">首页</a></li>
											</c:when>
											<c:otherwise>
												<li><a
													href="/article/see-article.html?startNum=1&id=${article.id}"
													title="首页">首页</a>
												</li>
											</c:otherwise>
										</c:choose>
										<c:if test="${page.prevPages!=null}">
											<c:forEach items="${page.prevPages}" var="num">
												<li><a
													href="/article/see-article.html?startNum=${num}&id=${article.id}"
													class="number" title="${num}">${num}</a>
												</li>
											</c:forEach>
										</c:if>
										<li class="active"><a href="#" title="${page.page}">${page.page}</a>
										</li>
										<c:if test="${page.nextPages!=null}">
											<c:forEach items="${page.nextPages}" var="num">
												<li><a
													href="/article/see-article.html?startNum=${num}&id=${article.id}"
													title="${num}"> ${num} </a>
												</li>
											</c:forEach>
										</c:if>
										<c:if test="${page.pageCount !=null}">
											<c:choose>
												<c:when test="${page.page == page.pageCount}">
													<li class="active"><a href="javascript:void();"
														title="尾页">尾页</a></li>
												</c:when>
												<c:otherwise>
													<li><a
														href="/article/see-article.html?startNum=${page.pageCount}&id=${article.id}"
														title="尾页">尾页</a>
													</li>
												</c:otherwise>
											</c:choose>
										</c:if>
										<c:if test="${page.pageCount == null}">
											<li class="active"><a href="javascript:void();"
												title="尾页">尾页</a></li>
										</c:if>
									</ul>
								</nav>
							</footer>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-3">
				<h1 class="page-header">&nbsp;</h1>
				<div id="wq" class="add-article-box">
					<h2 class="add-article-box-title">
						<span>标题图片</span>
					</h2>
					<div class="add-article-box-content">
						<c:choose>
							<c:when test="${article.picPath==null or article.picPath==''}">
              			暂无
              		</c:when>
							<c:otherwise>
								<img src="${article.picPath}">
							</c:otherwise>
						</c:choose>
					</div>
				</div>
				<div class="add-article-box">
					<h2 class="add-article-box-title">
						<span>文章描述</span>
					</h2>
					<div class="add-article-box-content">
						<textarea class="form-control" readonly="readonly" name="describe"
							autocomplete="off">${article.describe}</textarea>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</div>
</section>

<!-- 回复评论 -->
<div id="replyComment" class="modal fade">
	<form action="/reply/replyComment.html" method="post" onsubmit="return replyCheck();">
		<input type="hidden" id="userName" value="${userSession.userName}">
		<input type="hidden" name="commentId">
		<input type="hidden" name="articleId" value="${article.id}">
		<input type="hidden" name="parentName">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">回复评论</h4>
				</div>
				<div class="modal-body">
					<table class="table" id="replyTable">
						<tr>
							<td width="20%">评论:</td>
							<td width="80%"><input type="text" readonly="readonly"
								class="form-control" name="commentText" maxlength="10"
								autocomplete="off" /></td>
						</tr>
						<tr>
							<td width="20%">回复内容:</td>
							<td width="80%"><textarea name="replyText"
									class="form-control replyText"></textarea></td>
						</tr>
					</table>
				</div>
				<div class="modal-footer">
					<button class="btn btn-default" data-dismiss="modal">关闭</button>
					<input type="submit" class="btn btn-primary" value="回复">
				</div>
			</div>
		</div>
	</form>
</div>

<!-- 引入底部 -->
<%@include file="/WEB-INF/jsp/common/foot.jsp"%>
<script src="/statics/js/bootstrap.min.js"></script>
<script src="/statics/js/admin-scripts.js"></script>
<script src="/statics/localjs/see-article.js"></script>
</body>
</html>
