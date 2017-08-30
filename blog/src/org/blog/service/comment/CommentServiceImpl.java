package org.blog.service.comment;

import java.util.List;

import javax.annotation.Resource;

import org.blog.dao.comment.CommentMapper;
import org.blog.pojo.Comment;
import org.springframework.stereotype.Service;

@Service
public class CommentServiceImpl implements CommentService {
	@Resource
	private CommentMapper commentMapper;

	// 查询评论总记录数
	@Override
	public int count(Comment comment) throws Exception {
		return commentMapper.count(comment);
	}

	// 评论文章
	@Override
	public boolean commentArticle(Comment comment) {
		if (commentMapper.commentArticle(comment)>0) {
			return true;
		}
		return false;
	}

	// 获取当前文章下的所有评论集合
	@Override
	public List<Comment> getCommentListByArticleId(Comment comment) {
		return commentMapper.getCommentListByArticleId(comment);
	}

	// 获取当前文章下的所有评论集合数
	@Override
	public int getCommentListByArticleIdCount(Comment comment) {
		return commentMapper.getCommentListByArticleIdCount(comment);
	}

	// 通过id获取评论内容
	@Override
	public Comment getCommentById(Comment comment) {
		return commentMapper.getCommentById(comment);
	}

	// 删除评论及该评论下所有的回复
	@Override
	public boolean delComment(Comment comment) {
		if (commentMapper.delComment(comment)>0) {
			return true;
		}
		return false;
	}

}
