$(function(){
	$(".replyComment").click(function(e){
		var commentId=$(this).attr("id");
		$.ajax({
			url:"/comment/getCommentContent.html",
			data:{id:commentId},
			dataType:"html",
			error:function(){
				alert("获取评论内容失败!");
			},
			success:function(result){
				var m=eval('('+result+')')
				$("#replyTable tr td input[name=commentText]").val(m.commentText);
				$("#replyComment form input[name=commentId]").val(m.id);
				$("#replyComment form input[name=parentName]").val(m.reviewer);
				e.preventDefault();
				$("#replyComment").modal("show");
			}
		})
	});
	
	
	
	
	$(".myComment").each(function(){
		var reply=$(this);
		var result="";
		var id=reply.attr("id");
		var userName=$("#userName").val();
		$.ajax({
			url:"/reply/getReplyList.html",
			data:{id:id},
			dataType:"html",
			success:function(data){
				if(data!=null){
					rr=eval('('+data+')');
					for(var j=0;j<rr.length;j++){
						result=result+"&nbsp;&nbsp;"+rr[j].replyName+"  : @ "+rr[j].parentName+" &nbsp;&nbsp;&nbsp;&nbsp;"
						+rr[j].replyText+"<br/>&nbsp;&nbsp;"+rr[j].replyDate;
						if(rr[j].replyName==userName){
							result=result+"&nbsp;&nbsp;&nbsp;<a style='margin-left: 190px;' name='reply' onClick='del(this)' class='btn btn-danger' id='"+rr[j].id+"'>删除</a>";
						}else{
							result=result+"&nbsp;&nbsp;&nbsp;<a style='margin-left: 190px;' name='reply' onClick='reply(this)' class='btn btn-success' id='"+rr[j].id+"'>回复</a>";
						}
						result=result+"<br/>";
					}
					reply.html(result);
				}
			},
			error:function(){
				alert("获取回复列表失败!");
			}
		});
	})
	
})


function replyCheck(){
	var replyText=$(".replyText").val();
	if(replyText==null||replyText==""){
		alert("回复内容不能为空!");
		return false;
	}
	return true;
}


function del(aa){
	var id=$(aa).attr("id");
	var delName=$(aa).attr("name");
	var articleId=$("#replyComment form input[name=articleId]").val();
	
	if(window.confirm("确定要删除该评论吗？"))
	{
		$.ajax({
			type: "POST",
			url: "/comment/delCommentAndAllReply.html",
			data: {id:id,name:delName},
			cache: false, //不缓存此页面   
			success: function (data) {
				if(data=="success"){
					window.location.href="/article/see-article.html?id="+articleId;
				}else{
					alert("删除失败");
				}
				
			}
		});
	};
	
}

function reply(aa){
	var replyId=$(aa).attr("id");
	var name=$(aa).attr("name");
	
	$.ajax({
		url:"/comment/getCommentContent.html",
		data:{id:replyId,name:name},
		dataType:"html",
		error:function(){
			alert("获取评论内容失败!");
		},
		success:function(result){
			var m=eval('('+result+')')
			$("#replyTable tr td input[name=commentText]").val(m.replyText);
			$("#replyComment form input[name=commentId]").val(m.commentId);
			$("#replyComment form input[name=parentName]").val(m.replyName);
			$("#replyComment").modal("show");
		}
	})
}