package org.blog.dao.reply;

import java.util.List;

import org.blog.pojo.Reply;

public interface ReplyMapper {
	//添加回复
	int addReply(Reply reply);
	
	//查看评论下所有的回复
	List<Reply> getReplyList(Reply reply);
	
	//删除评论下所有的回复
	int delReplyByCommentId(Reply reply);
	
}
