function inputCheck(){
	var content=$("#article-content").val();
	if(content=="" || content==null){
		alert("公告内容不能为空!");
		return false;
	}
	return true;
}