$(function(){
	//是否确认删除
	$("#main table tbody tr td a").click(function(){
			var name = $(this);
			var id = name.attr("rel"); //对应id  
			if (name.html() == "删除") 
			{
				if(window.confirm("确定要删除该文章吗？"))
				{
					$.ajax({
						type: "POST",
						url: "/article/delArticle.html",
						data: "id=" + id,
						cache: false, //不缓存此页面   
						success: function (data) {
							if(data=="success"){
								window.location.href="/article/article.html";
							}else{
								alert("删除失败");
							}
							
						}
					});
				};
			};
		}); 
	//评论的异步获取
	$(".commentArticle").click(function(e){
		var id=$(this).attr("id");
		$.ajax({
			url:"/article/searcharticle.html",
			type:'POST',
			data:{id:id},
			dataType:'html',
			timeout:1000,
			error:function(){
				alert("出现未知错误,请联系管理员!");
			},
			success:function(result){
				if(result=="failed"){
					alert("操作超时!");
				}else{
					var m=eval('('+result+')');
					$("#finda tr td input[name=title]").val(m.title);
					$("#finda tr td div[name=content]").append(m.content);
					$("#finda tr td input[name=createDate]").val(m.createDate);
					$("#commentArticle form input[name=articleId]").val(m.id);
					if(m.picPath==null || m.picPath==""){
						$("#finda tr td[name=picPath]").append("暂无");
					}else{
						$("#finda tr td[name=picPath]").append("<img src='"+m.picPath+"'>");
					}
					
					e.preventDefault();
					$("#commentArticle").modal("show");
				}
			}
		});
	});
	
});


//提交评论的判空
function commentCheck(){
	var commentText=$("#finda tr td textarea").val();
	if(commentText==null||commentText==""){
		alert("评论内容不能为空!");
		return false;
	}
	return true;
}

