$(".dellogintime").click(function(){
	var d_id=$(this).attr('rel');
	alert(d_id);
	if(window.confirm("此操作不可逆，是否确认？")){
		$.ajax({
			url:"/login/delbyid.html",
			type:"POST",
			data:{id:d_id},
			datetype:"html",
			timeout: 1000,
			error:function(){
				alert("error");
			},success:function(result){
				  if(result=="nodata"){
					  alert("没有数据");
				  }else if(result=="success"){
					  alert("删除成功");
					  window.location.href ="/login/logintimeList.html";				  
				  }
				  
			}
		});
	};
	
	
});