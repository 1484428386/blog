package org.blog.controller;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;

import org.blog.common.JsonDateValueProcessor;
import org.blog.pojo.Reply;
import org.blog.service.reply.ReplyService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mysql.jdbc.StringUtils;

@Controller
@RequestMapping(value="/reply")
public class ReplyController extends BaseController {
	
	@Resource
	private ReplyService replyService;
	
	//回复评论
	@RequestMapping(value="/replyComment.html")
	public String replyComment(@RequestParam String replyText,
			@RequestParam String articleId,
			@RequestParam String commentId,
			@RequestParam(value="parentName",required=false)String parentName) {
		Reply reply=new Reply();
		reply.setReplyDate(new Date());
		reply.setCommentId(Integer.parseInt(commentId));
		reply.setReplyName(this.getCurrUser().getUserName());
		reply.setReplyText(replyText);
		if (!StringUtils.isNullOrEmpty(parentName)) {
			reply.setParentName(parentName);
		}
		replyService.addReply(reply);
		return "redirect:/article/see-article.html?id="+articleId;
	}
	
	//查看该评论下所有的回复
	@RequestMapping(value="/getReplyList.html",produces={"text/html;charset=UTF-8"})
	@ResponseBody
	public String getReplyList(@RequestParam String id) {
		Reply reply=new Reply();
		reply.setCommentId(Integer.parseInt(id));
		List<Reply> replyList=replyService.getReplyList(reply);
		JsonConfig jsonConfig=new JsonConfig();
		jsonConfig.registerJsonValueProcessor(Date.class, new JsonDateValueProcessor());
		if (replyList!=null) {
			return JSONArray.fromObject(replyList,jsonConfig).toString();
		}else {
			return null;
		}
	}
	
}
