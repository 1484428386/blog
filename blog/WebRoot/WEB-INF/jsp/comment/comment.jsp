<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/head.jsp"%>
    <div class="col-sm-9 col-sm-offset-3 col-md-10 col-lg-10 col-md-offset-2 main" id="main">
      <h1 class="page-header">管理 <span class="badge">${page.totalCount}</span></h1>
        <div class="table-responsive">
          <table class="table table-striped table-hover">
            <thead>
              <tr>
                <th><span class="glyphicon glyphicon-th-large"></span> <span class="visible-lg">选择</span></th>
                <th><span class="glyphicon glyphicon-file"></span> <span class="visible-lg">摘要</span></th>
                <th><span class="glyphicon glyphicon-time"></span> <span class="visible-lg">日期</span></th>
                <th><span class="glyphicon glyphicon-pencil"></span> <span class="visible-lg">操作</span></th>
              </tr>
            </thead>
            <tbody>
            	<c:forEach var="comments" items="${page.items}">
            		<tr>
		                <td><input id="${comments.id}" type="checkbox" class="input-control commentId" name="checkbox[]" value="" /></td>
		                <td class="article-title">
		                	<c:if test="${fn:length(comments.commentText)>12}">
	                        	${fn:substring(comments.commentText, 0, 12)}...
	                  	 	</c:if> 
	                  	 	<c:if test="${fn:length(comments.commentText)<=12}">
	                         	${comments.commentText}
	                   		</c:if>
		                </td>
		                <td><fmt:formatDate value="${comments.createDate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
		                <td>
		                	<a rel="${comments.id}" class="btn btn-info" name="see">查看</a> 
		                	<a rel="${comments.id}" class="btn btn-danger" name="delete">删除</a></td>
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
                <button class="btn btn-default checkbox_delete" data-toggle="tooltip" data-placement="bottom" title="删除全部选中" name="checkbox_delete">删除</button>
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
							href="/comment/toComment.html?startNum=1"
							title="首页">首页</a></li>
					</c:otherwise>
				</c:choose>
				<c:if test="${page.prevPages!=null}">
					<c:forEach items="${page.prevPages}" var="num">
						<li><a
							href="/comment/toComment.html?startNum=${num}"
							class="number" title="${num}">${num}</a></li>
					</c:forEach>
				</c:if>
				<li class="active"><a href="#" title="${page.page}">${page.page}</a>
				</li>
				<c:if test="${page.nextPages!=null}">
					<c:forEach items="${page.nextPages}" var="num">
						<li><a
							href="/comment/toComment.html?startNum=${num}"
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
								href="/comment/toComment.html?startNum=${page.pageCount}"
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
<!--查看评论模态框-->
<div class="modal fade" id="seeComment" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
          <h4 class="modal-title" >查看评论</h4>
        </div>
        <div class="modal-body">
          <table class="table" style="margin-bottom:0px;">
            <thead>
              <tr> </tr>
            </thead>
            <tbody>
              <tr>
                <td wdith="20%">评论编号:</td>
                <td width="80%" class="see-comment-id"></td>
              </tr>
              <tr>
                <td wdith="20%">文章编号:</td>
                <td width="80%" class="see-article-id"></td>
              </tr>
              <tr>
                <td wdith="20%">评论内容:</td>
                <td width="80%" class="see-comment-content"></td>
              </tr>
           	  <tr>
              	<td wdith="20%">评论人:</td>
                <td width="80%" class="see-comment-reviewer"></td>
              </tr>
              <tr>
                <td wdith="20%">评论时间:</td>
                <td width="80%" class="see-comment-createDate"></td>
              </tr>
            </tbody>
            <tfoot>
              <tr></tr>
            </tfoot>
          </table>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">朕已阅</button>
        </div>
      </div>
  </div>
</div>
<!-- 引入底部 -->
<%@include file="/WEB-INF/jsp/common/foot.jsp"%>
<script src="/statics/js/bootstrap.min.js"></script> 
<script src="/statics/js/admin-scripts.js"></script> 
<script src="/statics/localjs/comment.js"></script>
</body>
</html>