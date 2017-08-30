package org.blog.service.reply;

import java.util.List;

import org.blog.pojo.Reply;

public interface ReplyService {
	// 添加回复
	boolean addReply(Reply reply);

	// 查看评论下所有的回复
	List<Reply> getReplyList(Reply reply);

	// 删除评论下所有的回复
	boolean delReplyByCommentId(Reply reply);
}
