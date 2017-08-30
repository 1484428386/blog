function modifyflink(){
	$("#modify_formtip").html('');
	var reg=/(http):\/\/[\w\-_]+(\.[\w\-_]+)+([\w\-\.,@?^=%&:/~\+#]*[\w\-\@?^=%&/~\+#])?/;
    var result = true;
    if($("#modify-name").val()==null || $("#modify-name").val()==""){
    	$("#modify_formtip").css("color","red");
    	$("#modify_formtip").html("<li>对不起,名称不能为空</li>");
    	result=false;
    }
    if($("#modify-url").val()==null ||$("#modify-url").val()==""){
    	$("#modify_formtip").css("color","red");
    	$("#modify_formtip").html("<li>对不起,url不能为空</li>");
    	result=false;
    }
    if(reg.test($("#modify-url").val())==false){
    	$("#modify_formtip").css("color","red");
    	$("#modify_formtip").html("<li>对不起,url不正确</li>");
    	result=false;
    }
    if($("#modify-describe").val()==null || $("#modify-describe").val()== ""){
    	$("#modify_formtip").css("color","red");
    	$("#modify_formtip").html("<li>对不起,描述不能为空</li>");
    	result=false;
    }
    if(result==true){
    	alert("修改成功");
    }
    return result;
}

function  addFlink(){
	$("#add_flink").html("");
	var reg=/(http|ftp|https):\/\/[\w\-_]+(\.[\w\-_]+)+([\w\-\.,@?^=%&:/~\+#]*[\w\-\@?^=%&/~\+#])?/;
	var result = true;
	if($("#add_describe").val()=="" || $("#add_describe").val()==null){
    	$("#add_flink").css("color","red");
    	$("#add_flink").html("<li>对不起,描述不能为空</li>");
    	result=false;
    }
    if(reg.test($("#add-url").val())==false){
    	$("#add_flink").css("color","red");
    	$("#add_flink").html("<li>对不起,url格式不正确</li>");
    	result=false;
    }
    if($("#add-url").val()==""||$("#add-url").val()==""){
    	$("#add_flink").css("color","red");
    	$("#add_flink").html("<li>对不起,url不能为空</li>");
    	result=false;
    }
    if($("#add-name").val()==""||$("#add-name").val()==null){
    	$("#add_flink").css("color","red");
    	$("#add_flink").html("<li>对不起,名称不能为空</li>");
    	result=false;
    }
    if(result==true){
    	alert("添加成功");
    	}
    return result;
}
$(".delflink").click(function(){
	var d_id=$(this).attr("rel");
	if(window.confirm("确定要删除url吗？"))
	{
	  $.ajax({
		  url:"/flink/delflink.html",
		  type:"POST",
		  data:{id:d_id},
		  datetype:"html",
		  timeout: 1000,
		  error:function(){
			  alert("出现未知错误!");
		  },success:function(result){
			  if(result=="nodata"){
				  alert("没有数据");
			  }else if(result=="success"){
				  alert("删除成功");
				  window.location.href ="/flink/filnkList.html";
			  }
		  }
		  
	  });
	};
	
});


$("#delfilink").click(function(){
		var checks=$("input[name='checkbox']:checked");
		//alert(checks.length);
		var ids="0-";
		
		checks.each(function(){
			ids+=$(this).attr("id")+"-";
		});
		if(ids=="0-"){
			alert("你没有选中的列");
			
		}else{
			$.ajax({
				url:"/flink/fordelfink.html",
				type:"POST",
				data:{ids:ids},
				dataType:"html",
				cache:false,
				error:function(){
					alert("error");
				},success:function(result){
					if(result=="nodata"){
						alert("没有数据");
					}else if(result="success"){
						alert("删除成功");
						 window.location.href ="/flink/filnkList.html";
					}else if(result=="error"){
						alert("删除错误");
					}
				}
			});
		}
		
		
				
});
	