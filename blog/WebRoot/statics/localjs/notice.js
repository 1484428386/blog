$(function(){
	$(".seeNotice").click(function(){
		var id=$(this).attr("rel");
		$.ajax({
			url:"/notice/getNotice.html",
			data:{id:id},
			dataType:"html",
			success:function(result){
				var mm=eval('('+result+')')
				$("#showNotice tr td input[name=title]").val(mm.title);
				$("#showNotice tr td div[name=content]").html(mm.content);
				$("#showNotice tr td input[name=createDate]").val(mm.createDate);
				$("#seeNotice").modal("show");
			},
			error:function(){
				alert("获取公告内容失败!");
				return false;
			}
		});
	});
	
	$(".delNotice").click(function(){
		var name = $(this);
		var id = name.attr("rel"); //对应id  
		if (name.html() == "删除") 
		{
			if(window.confirm("确定要删除该公告吗？"))
			{
				$.ajax({
					type: "POST",
					url: "/notice/delNotice.html",
					data: "id=" + id,
					cache: false, //不缓存此页面   
					success: function (data) {
						window.location.reload();
					}
				});
			};
		}
	});  
	
	$(".delAllChe").click(function(){
		var checks=$("input[name='checkbox[]']:checked");
		if(checks.length==0){
			alert('未选中任何项！');
			return false;
		}
		checks.each(function(){
			$.ajax({
				url:"/notice/delNotice.html",
				data:{id:$(this).attr("id")},
				dataType:"html",
				error:function(){
					alert("删除失败!");
					return false;
				},
				success:function(result){
					if(result=="error"){
						alert("删除失败!");
						return false;
					}
				}
			});
		});
		alert("删除成功!");
		window.location.href="/notice/toNotice.html";
	});
})

