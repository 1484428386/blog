<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!--个人信息模态框-->
<div class="modal fade" id="seeUserInfo" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<form action="" method="post" onsubmit="return checkInput();">
			<input type="hidden" value="${userSession.userPwd}" name="userPwd" />
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">个人信息</h4>
				</div>
				<div class="modal-body">
					<table class="table" style="margin-bottom:0px;">
						<thead>
							<tr>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td wdith="25%"><span class="mainInput">*</span> 姓名:</td>
								<td width="75%"><input type="text"
									value="${userSession.name}" class="form-control" name="name"
									maxlength="10" autocomplete="off" />
								</td>
							</tr>
							<tr>
								<td wdith="25%"><span class="mainInput">*</span> 用户名:</td>
								<td width="75%"><input type="text"
									value="${userSession.userName}" class="form-control"
									name="username" maxlength="10" autocomplete="off" />
								</td>
							</tr>
							<tr>
								<td wdith="25%">电话:</td>
								<td width="75%"><input type="text"
									value="${userSession.phone}" class="form-control" name="phone"
									maxlength="13" autocomplete="off" />
								</td>
							</tr>
							<tr>
								<td wdith="25%"><span class="mainInput">*</span> 旧密码:</td>
								<td width="75%"><input type="password" class="form-control"
									name="old_password" maxlength="18" autocomplete="off" />
								</td>
							</tr>
							<tr>
								<td wdith="25%"><span class="mainInput">*</span> 新密码:</td>
								<td width="75%"><input type="password" class="form-control"
									name="password" maxlength="18" autocomplete="off" />
								</td>
							</tr>
							<tr>
								<td wdith="25%"><span class="mainInput">*</span> 确认密码:</td>
								<td width="75%"><input type="password" class="form-control"
									name="new_password" maxlength="18" autocomplete="off" />
								</td>
							</tr>
						</tbody>
						<tfoot>
							<tr>
								<td colspan="2" id="errorInfo"></td>
							</tr>
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

<!--个人登录记录模态框-->
<div class="modal fade" id="seeUserLoginlog" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title">登录记录</h4>
			</div>
			<div class="modal-body">
				<table class="table" style="margin-bottom:0px;">
					<thead>
						<tr>
							<th>编号</th>
							<th>登录时间</th>
							<th>状态</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${userLoginTimeList}" var="loginTime">
							<tr>
								<td>${loginTime.id}</td>
								<td><fmt:formatDate value="${loginTime.loginTime}"
								pattern="yyyy-MM-dd HH:mm:ss" /></td>
								<td>成功</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">朕已阅</button>
			</div>
		</div>
	</div>
</div>

<!--微信二维码模态框-->
<div class="modal fade user-select" id="WeChat" tabindex="-1"
	role="dialog" aria-labelledby="WeChatModalLabel">
	<div class="modal-dialog" role="document"
		style="margin-top:120px;max-width:280px;">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="WeChatModalLabel"
					style="cursor:default;">微信扫一扫</h4>
			</div>
			<div class="modal-body" style="text-align:center">
				<img src="/statics/images/weixin.jpg" alt="" style="cursor:pointer" />
			</div>
		</div>
	</div>
</div>
<!--提示模态框-->
<div class="modal fade user-select" id="areDeveloping" tabindex="-1"
	role="dialog" aria-labelledby="areDevelopingModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="areDevelopingModalLabel"
					style="cursor:default;">该功能正在日以继夜的开发中…</h4>
			</div>
			<div class="modal-body">
				<img src="/statics/images/baoman/baoman_01.gif" alt="深思熟虑" />
				<p
					style="padding:15px 15px 15px 100px; position:absolute; top:15px; cursor:default;">很抱歉，程序猿正在日以继夜的开发此功能，本程序将会在以后的版本中持续完善！</p>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" data-dismiss="modal">朕已阅</button>
			</div>
		</div>
	</div>
</div>
