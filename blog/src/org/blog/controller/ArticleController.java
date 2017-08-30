package org.blog.controller;

import java.io.File;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang.math.RandomUtils;
import org.blog.common.Constants;
import org.blog.common.JsonDateValueProcessor;
import org.blog.common.PageSupport;
import org.blog.pojo.Article;
import org.blog.pojo.Comment;
import org.blog.pojo.User;
import org.blog.service.article.ArticleService;
import org.blog.service.comment.CommentService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.mysql.jdbc.StringUtils;

@Controller
public class ArticleController extends BaseController {
	
	@Resource
	private ArticleService articleService;
	@Resource
	private CommentService commentService;
	
	//去文章首页(包括查询)
	@RequestMapping(value="/article/article.html")
	public String toArticle(@RequestParam(value="title",required=false)String title,
			@RequestParam(value="articleType",required=false)String articleType,
			@RequestParam(value="startNum",required=false)Integer startNum,
			Model model,HttpSession session) {
		PageSupport page=new PageSupport();
		Article article=new Article();
		if (startNum==null) {
			startNum=1;
		}
		if (!StringUtils.isNullOrEmpty(title)) {
			article.setTitle(title);
		}
		if (!StringUtils.isNullOrEmpty(articleType)) {
			session.setAttribute(Constants.ARTICLETYPE, articleType);
		}
		if (session.getAttribute(Constants.ARTICLETYPE)!=null&&session.getAttribute(Constants.ARTICLETYPE).equals("my")) {
			article.setCreateName(this.getCurrUser().getUserName());
		}
		page.setPage(startNum);
		page.setTotalCount(articleService.getArticleListCount(article));
		article.setStartNum((page.getPage()-1)*page.getPageSize());
		article.setPageSize(page.getPageSize());
		List<Article> articleList=articleService.getArticleList(article);
		
		//在显示之前重新查询该文章下所有的评论数,并修改(别的地方删除评论时没有修改文章的评论数字段)
		for (int i = 0; i < articleList.size(); i++) {
			Comment comment=new Comment();
			comment.setArticleId(articleList.get(i).getId());
			Article article2=new Article();
			article2.setId(articleList.get(i).getId());
			article2.setCommentCount(commentService.getCommentListByArticleIdCount(comment));
			articleService.modifyArticle(article2);
		}
		page.setItems(articleService.getArticleList(article));
		model.addAttribute("page",page);
		model.addAttribute("articleType",articleType);
		model.addAttribute("title",title);
		return "/article/article";
	}
	
	//获取文章的异步
	@RequestMapping(value="/article/searcharticle.html",produces={"text/html;charset=UTF-8"})
	@ResponseBody
	public String getArticle(@RequestParam String id) {
		try {
			Article article=new Article();
			article.setId(Integer.parseInt(id));
			article=articleService.getArticle(article);
			//对json格式的日期进行处理
			JsonConfig jsonConfig=new JsonConfig();
			jsonConfig.registerJsonValueProcessor(Date.class, new JsonDateValueProcessor());
			JSONObject jo=JSONObject.fromObject(article,jsonConfig);
			return jo.toString();
		} catch (Exception e) {
			e.printStackTrace();
			return "failed";
		}
	}
	
	//去添加文章页面
	@RequestMapping(value="/article/add-article.html")
	public String toAddArticle(@ModelAttribute("article")Article article) {
		return "/article/add-article";
	}
	
	//添加文章
	@RequestMapping(value="/article/addArticle.html")
	public String addArticle(Article article,HttpSession session) {
		article.setCreateDate(new Date());
		article.setCommentCount(0);
		article.setCreateName(((User)session.getAttribute(Constants.SESSION_USER)).getUserName());
		if (articleService.addArticle(article)) {
			return "redirect:/article/article.html";
		}else {
			return "redirect:/article/add-article.html";
		}
	}
	
	//去查看文章页面
	@RequestMapping(value="/article/see-article.html")
	public String toSeeArticle(@RequestParam String id,
			@RequestParam(value="startNum",required=false) Integer startNum,
			Model model) {
		Article article=new Article();
		article.setId(Integer.parseInt(id));
		
		PageSupport page=new PageSupport();
		Comment comment=new Comment();
		comment.setArticleId(Integer.parseInt(id));
		if (startNum==null) {
			startNum=1;
		}
		page.setPage(startNum);
		page.setTotalCount(commentService.getCommentListByArticleIdCount(comment));
		comment.setStartNum((page.getPage()-1)*page.getPageSize());
		comment.setPageSize(page.getPageSize());
		
		//评论集合
		page.setItems(commentService.getCommentListByArticleId(comment));
		
		//存储了评论集合和分页
		model.addAttribute("page",page);
		//文章内容的对象
		model.addAttribute("article",articleService.getArticle(article));
		return "/article/see-article";
	}
	
	//文件上传(上传图片)
	@RequestMapping(value="/article/uploadPic.html")
	@ResponseBody
	public String uploadPic(@RequestParam(value="filePicPath")MultipartFile picPath,HttpServletRequest request) {
		//上传路径
		String path=request.getSession().getServletContext().getRealPath("statics"+File.separator+"uploadFiles");
		//获取文件名
		String oldFileName=picPath.getOriginalFilename();
		//获取后缀
		String suffer=FilenameUtils.getExtension(oldFileName);
		//设置文件上传的最大值
		int fileSize=5000;
		if (picPath.getSize()/1024>fileSize) {
			return "1";
		}else if(suffer.equalsIgnoreCase("jpg")||suffer.equalsIgnoreCase("png")||
				suffer.equalsIgnoreCase("jpeg")||suffer.equalsIgnoreCase("pneg")){
			//新的文件名
			String newFileName=System.currentTimeMillis()+RandomUtils.nextInt(10000)+"_pic.jpg";
			File newFile=new File(path,newFileName);
			if (!newFile.exists()) {
				newFile.mkdirs();
			}
			try {
				picPath.transferTo(newFile);
			} catch (Exception e) {
				e.printStackTrace();
			} 
			return request.getContextPath()+"/statics/uploadFiles/"+newFileName;
		}else {
			return "2";
		}
	}
	
	//异步删除标题图片
	@RequestMapping(value="/article/delPic.html")
	@ResponseBody
	public String delPic(@RequestParam(value="picPath") String picPath,HttpServletRequest request) {
		String[] paths=picPath.split("/");
		String path=request.getSession().getServletContext().getRealPath(paths[1]+File.separator+paths[2]+File.separator+paths[3]);
		File newFile=new File(path);
		if(newFile.delete()){
			return "success";
		}else {
			return "error";
		}
	}
	
	//删除文章
	@RequestMapping(value="/article/delArticle.html")
	@ResponseBody
	public String delArticle(@RequestParam String id,HttpServletRequest request) {
		Article article=new Article();
		article.setId(Integer.parseInt(id));
		article=articleService.getArticle(article);
		String picPath=article.getPicPath();
		if (articleService.delArticle(article)) {
			if (picPath!=null && !picPath.equals("")) {
				String str=this.delPic(picPath,request);
				if (!str.equals("success")) {
					return "error";
				}
			}
			return "success";
		}
		return "error";
	}
}
