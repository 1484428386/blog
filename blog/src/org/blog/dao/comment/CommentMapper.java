package org.blog.dao.comment;

import java.util.List;

import org.blog.pojo.Comment;

public interface CommentMapper {
	// 查询该用户下的所有评论数
	public int count(Comment comment) throws Exception;
	
	//评论文章
	public int commentArticle(Comment comment);
	
	//获取当前文章下的所有评论集合
	List<Comment> getCommentListByArticleId(Comment comment);
	
	//获取当前文章下的所有评论集合数
	int getCommentListByArticleIdCount(Comment comment);
	
	//通过id获取评论内容
	Comment getCommentById(Comment comment);
	
	//删除评论及该评论下所有的回复
	int delComment(Comment comment);
}
