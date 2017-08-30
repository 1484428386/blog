<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/head.jsp"%>
<div
	class="col-sm-9 col-sm-offset-3 col-md-10 col-lg-10 col-md-offset-2 main"
	id="main">
	<h1 class="page-header">操作</h1>
	<ol class="breadcrumb">
		<li><a data-toggle="modal" data-target="#addUser">增加用户</a>
		</li>
	</ol>
	<h1 class="page-header">
		管理 <span class="badge">${page.totalCount}</span>
	</h1>
	<div class="table-responsive">
		<table class="table table-striped table-hover" id="findUserId">
			<thead>
				<tr>
					<th><span class="glyphicon glyphicon-th-large"></span> <span
						class="visible-lg">ID</span>
					</th>
					<th><span class="glyphicon glyphicon-user"></span> <span
						class="visible-lg">用户名</span>
					</th>
					<th><span class="glyphicon glyphicon-bookmark"></span> <span
						class="visible-lg">姓名</span>
					</th>
					<th><span class="glyphicon glyphicon-pushpin"></span> <span
						class="visible-lg">文章</span>
					</th>
					<th><span class="glyphicon glyphicon-time"></span> <span
						class="visible-lg">上次登录时间</span>
					</th>
					<th><span class="glyphicon glyphicon-pencil"></span> <span
						class="visible-lg">操作</span>
					</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${page.items != null}">
					<c:forEach items="${page.items}" var="user">
						<c:set var="out" value="${user.userName}"></c:set>

						<tr>
							<td>${user.id}</td>
							<td>${user.userName}</td>
							<td>${user.name}</td>
							<c:forEach items="${countUser}" var="count">
								<c:if test="${count.key == out}">
									<td>${count.value}</td>
								</c:if>
							</c:forEach>

							<td><fmt:formatDate value="${user.lastTime}"
									pattern="yyyy-MM-dd HH-FF-mm" />
							</td>
							<td><a class="modifyuser btn btn-info" id="${user.id}"
								rel="${user.id}" name="see">查看</a> <a id="${user.id}"
								rel="${user.id}" class="delUser btn btn-danger" name="delete">删除</a>
							</td>
						</tr>

					</c:forEach>

				</c:if>


			</tbody>
		</table>


		<footer class="message_footer">
			<nav>
				<ul class="pagination pagenav">
					<c:choose>
						<c:when test="${page.page == 1}">
							<li class="active"><a href="javascript:void();" title="首页">首页</a>
							</li>
						</c:when>
						<c:otherwise>
							<li><a href="/user/list.html?currentpage=1" title="首页">首页</a>
							</li>
						</c:otherwise>
					</c:choose>
					<c:if test="${page.prevPages!=null}">
						<c:forEach items="${page.prevPages}" var="num">
							<li><a href="/user/list.html?currentpage=${num}"
								class="number" title="${num}">${num}</a>
							</li>
						</c:forEach>
					</c:if>
					<li class="active"><a href="#" title="${page.page}">${page.page}</a>
					</li>
					<c:if test="${page.nextPages!=null}">
						<c:forEach items="${page.nextPages}" var="num">
							<li><a href="/user/list.html?currentpage=${num}"
								class="number" title="${num}">${num}</a>
							</li>
						</c:forEach>
					</c:if>
					<c:if test="${page.pageCount !=null}">
						<c:choose>
							<c:when test="${page.page == page.pageCount}">
								<li class="active"><a href="javascript:void();" title="尾页">尾页</a>
								</li>
							</c:when>
							<c:otherwise>
								<li><a href="/user/list.html?currentpage=${page.pageCount}"
									title="尾页">尾页</a>
								</li>
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


	<!--增加用户模态框-->
	<div class="modal fade" id="addUser" tabindex="-1" role="dialog"
		aria-labelledby="addUserModalLabel">
		<div class="modal-dialog" role="document" style="max-width:450px;">
			<form action="/user/addUser.html" method="post" autocomplete="off"
				draggable="false" onsubmit="return addUserFunction();">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title">增加用户</h4>
					</div>
					<div class="modal-body">
						<ul id="add_formtip"></ul>
						<table class="table" style="margin-bottom:0px;">
							<thead>
								<tr></tr>
							</thead>
							<tbody>
								<tr>
									<td wdith="20%">姓名:</td>
									<td width="80%"><input id="a_name" type="text" value=""
										class="form-control" name="name" maxlength="10"
										autocomplete="off" />
									</td>
								</tr>
								<tr>
									<td wdith="20%">用户名:</td>
									<td width="80%"><input id="a_userName" type="text"
										value="" class="form-control" name="userName" maxlength="10"
										autocomplete="off" />
									</td>
								</tr>
								<tr>
									<td wdith="20%">电话:</td>
									<td width="80%"><input id="a_phone" type="text" value=""
										class="form-control" name="phone" maxlength="13"
										autocomplete="off" />
									</td>
								</tr>
								<tr>
									<td wdith="20%">密码:</td>
									<td width="80%"><input id="a_userpwd" type="password"
										class="form-control" name="userPwd" maxlength="18"
										autocomplete="off" />
									</td>
								</tr>
								<tr>
									<td wdith="20%">确认密码:</td>
									<td width="80%"><input id="a_password2" type="password"
										class="form-control" name="new_password" maxlength="18"
										autocomplete="off" />
									</td>
								</tr>
								<tr>
									<td width="20%">用户角色</td>
									<td><select id="role" name="roleId">
											<option value="">--请选择--</option>
											<option value="1">管理员</option>
											<option value="2">普通用户</option>
									</select></td>
								</tr>
							</tbody>
							<tfoot>
								<tr></tr>
							</tfoot>
						</table>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
						<button type="submit" class="btn btn-primary">提交</button>
					</div>
				</div>
			</form>
		</div>
	</div>
	<!--用户信息模态框-->
	<div class="modal fade" id="seeUser" tabindex="-1" role="dialog"
		aria-labelledby="addUserModalLabel">
		<div class="modal-dialog" role="document" style="max-width:450px;">
			<form action="/user/modifyUser.html" method="post"
				onsubmit="return modifyUser();">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title">查看用户</h4>
					</div>
					<div class="modal-body">
						<ul id="modify_formtip"></ul>
						<table class="table" style="margin-bottom:0px;">
							<thead>

							</thead>
							<tbody>

								<tr>
									<td wdith="20%">姓名:</td>
									<td width="80%"><input id="m_id" type="hidden" name="id">
										<input id="m_name" readonly="readonly" type="text" value=""
										class="form-control" name="name" maxlength="10"
										autocomplete="off" />
									</td>
								</tr>
								<tr>
									<td wdith="20%">用户名:</td>
									<td width="80%"><input id="m_userName" readonly="readonly"
										type="text" value="" class="form-control" name="userName"
										maxlength="10" autocomplete="off" />
									</td>
								</tr>
								<tr>
									<td wdith="20%">电话:</td>
									<td width="80%"><input id="m_phone" readonly="readonly"
										type="text" value="" class="form-control" name="phone"
										maxlength="13" autocomplete="off" />
									</td>
								</tr>
								<tr>
									<td width="20%">用户角色</td>
									<td><input name="roleId" class="form-control"
										readonly="readonly" id="m_roleId">
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
					</div>
				</div>
			</form>
		</div>
	</div>
	<div></div>
	<!-- 引入底部 -->
	<%@include file="/WEB-INF/jsp/common/foot.jsp"%>
	<script src="/statics/js/bootstrap.min.js"></script>
	<script src="/statics/js/admin-scripts.js"></script>
	<script src="/statics/localjs/user.js"></script>
	</body>
	</html>