package org.blog.service.reply;

import java.util.List;

import javax.annotation.Resource;

import org.blog.dao.reply.ReplyMapper;
import org.blog.pojo.Reply;
import org.springframework.stereotype.Service;

@Service
public class ReplyServiceImpl implements ReplyService {

	@Resource
	private ReplyMapper replyMapper;
	
	@Override
	public boolean addReply(Reply reply) {
		if (replyMapper.addReply(reply)>0) {
			return true;
		}
		return false;
	}

	// 查看评论下所有的回复
	@Override
	public List<Reply> getReplyList(Reply reply) {
		return replyMapper.getReplyList(reply);
	}

	// 删除评论下所有的回复
	@Override
	public boolean delReplyByCommentId(Reply reply) {
		if (replyMapper.delReplyByCommentId(reply)>0) {
			return true;
		}
		return false;
	}

}
