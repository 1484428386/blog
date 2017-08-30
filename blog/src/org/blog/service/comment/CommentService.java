package org.blog.service.comment;

import java.util.List;

import org.blog.pojo.Comment;
import org.blog.pojo.User;

public interface CommentService {

	// 查询评论总记录数
	public int count(Comment comment) throws Exception;

	// 评论文章
	public boolean commentArticle(Comment comment);

	// 获取当前文章下的所有评论集合
	List<Comment> getCommentListByArticleId(Comment comment);

	// 获取当前文章下的所有评论集合数
	int getCommentListByArticleIdCount(Comment comment);

	// 通过id获取评论内容
	Comment getCommentById(Comment comment);

	// 删除评论及该评论下所有的回复
	boolean delComment(Comment comment);
}
