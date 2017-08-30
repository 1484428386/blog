
$(".addfriend").click(function(){
	var uid=$(this).attr('rel');
	$.ajax({
		url:"/news/addfriend",
		type:"POST",
		data:{id:uid},
		dataType:"html",
		error:function(){
			alert("error");
		},success:function(result){
			if(result=="nodata"){
				alert("没有数据");
			}else if(result=="notuser"){
				alert("对不起!不能自己添加自己");
			}else if(result=="isdata"){
				alert("对不起!该用户正审核或者已经是好友");
				
			}else if(result=="success"){
				alert("发送请求成功");
			}
		}
		
	});
	//$("#addfriend").html('');
});
 $(".consent").click(function(){
	var addfriendid= $(this).attr('rel');
	var userid =$(this).attr('dir');
	$.ajax({
		url:"/news/consentfriend.html",
		tyep:"POST",
		data:{addfriend:addfriendid,userid1:userid},
		dataType:"html",
		error:function(){
			alert("error");
		},success:function(result){
			if(result=="nodata"){
		    	alert("没有数据");
		    }else if(result =="error"){
		    	alert("操作失败");
		    }else{
		    	window.location.href ="/news/newslist.html";
		    }
		}
	});
	 
	 
	 
 });
$(".refuse").click(function(){
	var addfriendid= $(this).attr('rel');
	var userid =$(this).attr('dir');
	$.ajax({
		url:"/news/refusefriend",
		tyep:"POST",
		data:{addfriend:addfriendid,userid1:userid},
		dataType:"html",
		error:function(){
			alert("error");
		},success:function(result){
			if(result=="nodata"){
		    	alert("没有数据");
		    }else if(result =="error"){
		    	alert("操作失败");
		    }else{
		    	window.location.href ="/news/newslist.html";
		    }
		}
	});
	 
});
//删除好友
$(".delfriend").click(function(){
	var addfriendid= $(this).attr('rel');
	var userid =$(this).attr('dir');
	if(window.confirm("确定要删除该好友吗？"))
	{
	$.ajax({
		url:"/news/delfriend.html",
		tyep:"POST",
		data:{addfriend:addfriendid,userid1:userid},
		dataType:"html",
		error:function(){
			alert("出现未知错误!");
		},success:function(result){
			if(result=="nodata"){
		    	alert("没有数据");
		    }else if(result =="error"){
		    	alert("操作失败");
		    }else{
		    	alert("操作成功");
		    	window.location.href ="/news/newslist.html";
		    }
		}
	  });
	};
});