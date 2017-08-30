//判断用户是否存在
$("#a_userName").blur(function(){
	var aun=$("#a_userName").val();
	if(aun !="" ){
		$.post("/user/logincodeisexit.html",{'userName':aun},function(result){
			if(result=="repeat"){
				$("#add_formtip").css("color","red");
				$("#add_formtip").html("<li>对不起，该用户名已存在。<li>");
				$("#add_formtip").attr("key","1");
				return false;
				
			}else if(result=="failed"){
				alert("操作超时");
			}else if(result=="only"){
				$("#add_formtip").css("color","green");
				$("#add_formtip").html("<li>该用户名可以使用。<li>");
				$("#add_formtip").attr("key","0");
			}
			
		},'html');
	}
});

//添加提交事件
function addUserFunction(){
	$("#add_formtip").html("");
	var result =true;
	if($("#role").val() == ""){
		$("#add_formtip").css("color","red");
		$("#add_formtip").append("<li>对不起，角色不能为空。</li>");
		result = false;
	}
	if($.trim($("#a_userName").val()) == "" || $("#a_userName").val() == null){
		$("#add_formtip").css("color","red");
		$("#add_formtip").append("<li>对不起，用户名不能为空。</li>");
		result = false;
	}else{
		if($("#add_formtip").attr("key") == "1"){
			$("#add_formtip").css("color","red");
			$("#add_formtip").append("<li>对不起，该用户名已存在。</li>");
			result = false;
		}
		
	}
	if($.trim($("#a_name").val())=="" || $("#a_name").val()==null){
		$("#add_formtip").css("color","red");
		$("#add_formtip").append("<li>对不起，姓名不能为空。</li>");
		result = false;
	}
    if($.trim($("#a_phone").val())=="" || $("#a_phone").val()==null){
    	$("#add_formtip").css("color","red");
    	$("#add_formtip").append("<li>对不起，电话不能为空。</li>");
		result = false;
	}
    if($("#a_phone").val().length!=11){
    	$("#add_formtip").css("color","red");
    	$("#add_formtip").append("<li>对不起，电话长度必须等于11位。</li>");
		result = false;
    }
    if($.trim($("#a_password2").val())=="" || $("#a_password2").val()==null){
    	$("#add_formtip").css("color","red");
    	$("#add_formtip").append("<li>对不起，确认密码不能为空。</li>");
		result = false;
    }else if($("#a_password2").val()!= $("#a_userpwd").val()){
    	$("#add_formtip").css("color","red");
    	$("#add_formtip").append("<li>对不起，两次密码不一致。</li>");
		result = false;
    }
    
    if($.trim($("#a_userpwd").val())=="" || $("#a_userpwd").val()==null){
    	$("#add_formtip").css("color","red");
    	$("#add_formtip").append("<li>对不起，密码不能为空。</li>");
		result = false;
    }else if($("#a_userpwd").val().length<6){
    	$("#add_formtip").css("color","red");
    	$("#add_formtip").append("<li>对不起，密码长度必须大于或等于6为。</li>");
		result = false;
    }
     if(result==true){
    	 alert("添加成功 ^_^");
     } 
     //alert("添加成功 ^_^");
	return result;
	
}


//显示模态框
$("#findUserId tbody td a").click(function(e){
	var name=$(this);
	var id=name.attr('rel');
	if(name.attr('name') === 'see'){
	$('#seeUser').modal("show");	
	}
});

//查看
$(".modifyuser").click(function(e){
	var m_id=$(this).attr("id");
	$.ajax({
		url:'/user/getUserByid.html',
		type:'POST',
		data:{id:m_id},
		dataType:'html',
		timeout: 1000,
		error:function(){
			alert("出现未知错误!");
		},success:function(result){
			if(result=="failed"){
				alert('操作超时');
			}else if(result=="nodata"){
				alert('没有数据');
			}else{
				m = eval('(' + result + ')');
				$("#m_name").val(m.name);
				$("#m_userName").val(m.userName);
				$("#m_phone").val(m.phone);
				$("#m_id").val(m.id);
				$("#m_roleId").val(m.roleName);
			}
		}
	});
});

$("#modifyUser").click(function(){
	$("modify_formtip").html("");
	if($("#m_name").val()==null || $("#m_name").val()==""){
		$("#modify_formtip").css("color","red");
		$("#modify_formtip").html("<li>用户名不能为空</li>")
	}
});

//删除用户
$(".delUser").click(function(){
	var d_id =$(this).attr("id");
	if(window.confirm("确定要删除该用户吗？"))
	{
	$.ajax({
		url:"/user/delusre.html",
	    type:"POST",
		data:{id:d_id},
	    datatype:"html",	
	    timeout: 1000,
		error:function(){
			alert("出现未知错误!");
		},success:function(result){
			if(result=="nodata"){
				alert('没有数据');
			}else if(result="success"){
				alert('删除成功');
				window.location.href ="/user/list.html";
			}
			
		}
	    
		
	});
	};
	
});


