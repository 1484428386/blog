$("#addnews").click(function(){
	if($("#newsText").val()==null || $("#newsText").val()==""){
		alert("不能发送空消息");
		return false;
	}
	var news=new Object();
	 news.newsText =$.trim($("#newsText").val());
	 news.createId=$.trim($("#createId").val());
	
	$.ajax({
		url:"/news/addnews.html",
		type:"POST",
		data:{news:JSON.stringify(news)},
		dataType:"html",
		timeout:1000,
		error:function(){
			alert("出现未知错误!");
		},success:function(result){
			if(result=="nodata"){
				alert("没有数据");
			}else if(result=="error"){
				alert("error");
			}else if(result=="success"){
				window.location.href ="/news/newsroot.html?createId="+news.createId+"";
			}
		}
		
	});
});

$(".delnews").click(function(){
    var createId=$("#createId").val();
	var checks=$("input[name='checkox']:checked");
	if(checks.length==0){
		alert("未选中任何数据!");
		return false;
	}
	checks.each(function(){
		$.ajax({
			url:"/news/delnews.html",
			type:"POST",
			data:{id:$(this).val(),createId:createId},
			tiemout:1000,
			dataType:"html",
			error:function(){
				alert("出现未知错误!");
			},success:function(result){
				if(result=="nodate"){
					alert("没有数据");
				}else if(result=="error"){
					alert("error11");	
				}
			}
			
		});
		
	});
	alert("操作成功");
	window.location.href ="/news/newsroot.html?createId="+createId+"";
});