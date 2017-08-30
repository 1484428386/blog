

$(function(){
	
	//文件上传的异步
	$("#a_uploadbtnID").click(function(){
		var picPath=$("#filePicPath").val();
		if(picPath==null || picPath==""){
			alert("请选择上传文件!");
		}else{
			$.ajaxFileUpload({
				url:"/article/uploadPic.html",
				secureuri:false,
				fileElementId:"filePicPath",
				dataType:"json",
				error:function(){
					alert("上传失败");
				},
				success:function(result){
					if(result=="1"){
						alert("上传图片大小不得超过5M！");
					}else if(result=="2"){
						alert("上传图片格式不正确!");
					}else{
						$("#pic").append("<p><span onclick=\"delPic('"+result+"',this);\">x</span><img src=\""+result+"\" /></p>");
						$("#a_uploadbtnID").hide();
						$("#fileInputPicPath").val(result);
					}
				}
			})
		}
	});
});

function delPic(picPath,obj){
	$.post("/article/delPic.html",{"picPath":picPath},function(result){
		if(result=="success"){
			alert("删除成功");
			$("#fileInputPicPath").val("");
			$("#uniform-filePicPath span:first").html('无文件');
			document.getElementById("pic").removeChild(obj.parentElement);
			$("#a_uploadbtnID").show();
		}else{
			alert("删除失败!");
		}
	},"html");
}


















