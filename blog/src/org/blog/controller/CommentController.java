package org.blog.controller;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

import org.blog.common.JsonDateValueProcessor;
import org.blog.common.PageSupport;
import org.blog.pojo.Article;
import org.blog.pojo.Comment;
import org.blog.pojo.Reply;
import org.blog.service.article.ArticleService;
import org.blog.service.comment.CommentService;
import org.blog.service.reply.ReplyService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mysql.jdbc.StringUtils;

//文章的controller
@Controller
@RequestMapping(value="/comment")
public class CommentController extends BaseController{
	
	@Resource
	private CommentService commentService;
	@Resource
	private ArticleService articleService;
	@Resource
	private ReplyService replyService;
	
	//评论文章
	@RequestMapping(value="/commentArticle.html",produces={"text/html;charset=UTF-8"})
	public String commentArticle(@RequestParam String articleId,@RequestParam String commentText,HttpSession session) {
		Comment comment=new Comment();
		comment.setArticleId(Integer.parseInt(articleId));
		comment.setCommentText(commentText);
		comment.setCreateDate(new Date());
		comment.setReviewer(this.getCurrUser().getUserName());
		commentService.commentArticle(comment);
		//评论文章的同时更新评论数
		Article article=new Article();
		article.setId(Integer.parseInt(articleId));
		Article _article=articleService.getArticle(article);
		article.setCommentCount(_article.getCommentCount()+1);
		
		articleService.modifyArticle(article);
		return "redirect:/article/article.html";
	}
	
	//通过id获取评论内容
	@RequestMapping(value="/getCommentContent.html",produces={"text/html;charset=UTF-8"})
	@ResponseBody
	public String getCommentContent(@RequestParam String id,
			@RequestParam(value="name",required=false)String name) {
		JSONObject json=new JSONObject();
		JsonConfig jsonConfig=new JsonConfig();
		jsonConfig.registerJsonValueProcessor(Date.class, new JsonDateValueProcessor());
		System.out.println("=========>>>>>>>>>>>>>>>>>>>>>"+name);
		if (StringUtils.isNullOrEmpty(name)) {
			System.out.println("=========>>>>>>>>>>>获取文章内容");
			//获取文章内容
			Comment comment=new Comment();
			comment.setId(Integer.parseInt(id));
			comment=commentService.getCommentById(comment);
			json=JSONObject.fromObject(comment,jsonConfig);
		}else {
			System.out.println("=========>>>>>>>>>>>获取回复内容");
			//获取回复内容
			Reply reply=new Reply();
			reply.setId(Integer.parseInt(id));
			List<Reply> replyList=replyService.getReplyList(reply);
			reply=replyList.get(0);
			json=JSONObject.fromObject(reply,jsonConfig);
		}
		return json.toString();
	}
	
	//删除评论及该评论下所有的回复  或者  删除单个留言
	@RequestMapping(value="/delCommentAndAllReply.html")
	@ResponseBody
	public String delCommentAndAllReply(@RequestParam String id,
			@RequestParam String name) {
		
		Comment comment=new Comment();
		Reply reply=new Reply();
		
		//删除文章下的单个评论
		if (name.equals("comment")) {
			comment.setId(Integer.parseInt(id));
			reply.setCommentId(Integer.parseInt(id));
			
			//评论下没有回复
			if (replyService.getReplyList(reply).size()==0) {
				if (commentService.delComment(comment)) {
					return "success";
				}else {
					return "error";
				}
			}
			//评论下有回复
			if (commentService.delComment(comment)&&replyService.delReplyByCommentId(reply)) {
				return "success";
			}else {
				return "error";
			}
		}else {
			//删除单个回复
			reply.setId(Integer.parseInt(id));
			if(replyService.delReplyByCommentId(reply)){
				return "success";
			}else {
				return "error";
			}
		}
		
		
	}
	
	//去评论页面
	@RequestMapping("/toComment.html")
	public String toComment(Model model,@RequestParam(value="startNum",required=false)String startNum) {
		if (startNum==null) {
			startNum="1";
		}
		Comment comment=new Comment();
		PageSupport page=new PageSupport();
		page.setPage(Integer.parseInt(startNum));
		comment.setReviewer(this.getCurrUser().getUserName());
		comment.setStartNum((page.getPage()-1)*page.getPageSize());
		comment.setPageSize(page.getPageSize());
		try {
			page.setTotalCount(commentService.count(comment));
			page.setItems(commentService.getCommentListByArticleId(comment));
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("page",page);
		return "/comment/comment";
	}
}
