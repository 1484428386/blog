$(function () {
    $("#main table tbody tr td a").click(function () {
        var name = $(this);
        var id = name.attr("rel"); //对应id   
        if (name.attr("name") === "see") {
            $.ajax({
                type: "POST",
                url: "/comment/getCommentContent.html",
                data: "id=" + id,
                cache: false, //不缓存此页面   
                success: function (data) {
                    var data = JSON.parse(data);
                    $('.see-comment-id').html(data.id);
                    $('.see-article-id').html(data.articleId);
                    $('.see-comment-content').html(data.commentText);
                    $('.see-comment-reviewer').html(data.reviewer);
                    $('.see-comment-createDate').html(data.createDate);
                    $('#seeComment').modal('show');
                },
                error:function(){
                	alert("获取评论对象失败!");
                }
            });
        } else if (name.attr("name") === "delete") {
            if (window.confirm("确定要删除该评论吗？")) {
                $.ajax({
                    type: "POST",
                    url: "/comment/delCommentAndAllReply.html",
                    data: {id:id,name:"comment"},
                    cache: false, //不缓存此页面   
                    success: function (data) {
                        window.location.reload();
                    },
                    error:function(){
                    	alert("删除评论失败!");
                    }
                });
            };
        };
        return false;
    });
  
  $(".checkbox_delete").click(function(){
	  var checks=$("input[name='checkbox[]']:checked");
	  if(checks.length == 0){ 
		  alert('未选中任何项！');
		  return false;
	  }
	  
	  checks.each(function(){
		  $.ajax({
              type: "POST",
              url: "/comment/delCommentAndAllReply.html",
              data: {id:$(this).attr("id"),name:"comment"},
              cache: false, //不缓存此页面   
              success: function (data) {
            	  if(data=="error"){
            		  alert("删除评论失败!");
            		  return false;
            	  }
              },
              error:function(){
            	  alert("删除评论失败!");
            	  return false;
              }
          });
	  })
	  
	  alert("删除成功");
	  window.location.href="/comment/toComment.html";
  })
});