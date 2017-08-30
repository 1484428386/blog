package org.blog.controller;


import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

import org.blog.common.JsonDateValueProcessor;
import org.blog.common.PageSupport;
import org.blog.pojo.Article;
import org.blog.pojo.Friend;
import org.blog.pojo.News;
import org.blog.pojo.User;
import org.blog.service.article.ArticleService;
import org.blog.service.friend.FriendService;
import org.blog.service.news.NewsService;
import org.blog.service.user.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class UserController extends BaseController{
	@Resource
	private FriendService friendService;
	@Resource
	private NewsService newsService;
	@Resource
	private UserService userService;
	@Resource
	private ArticleService articleService;
	
	//显示所有用户(分页)
	@RequestMapping(value="/user/list.html",method=RequestMethod.GET)
	public String userList(@RequestParam(value="currentpage",required=false)Integer currentpage,Model model){
	    User user = new User();
	    PageSupport page = new PageSupport();
	    try {
	    	 page.setTotalCount(userService.count());
		} catch (Exception e) {
			e.printStackTrace();
		}
	   
	    if(page.getPageCount()>0){
	    	if(currentpage!=null){
		    	page.setPage(currentpage);
		    }
	    	if(page.getPage()<0){
	    		page.setPage(1);
	    	}
	    	if(page.getPage()>page.getPageCount()){
	    		page.setPage(page.getPageCount());
	    	}
	    }
	    user.setStartNum((page.getPage()-1)*page.getPageSize());
	    user.setPageSize(page.getPageSize());
	    List<User> getUserList = new ArrayList<User>();
		
	    Map<String, Integer> countUser = new HashMap<String, Integer>();
	    try {
	    	getUserList=userService.getUserList(user);
	    	Integer count=0;
	        //查询所有文章记录数
	    	Article article =new Article();
	    	for (User user2 : getUserList) {
	    		String name = user2.getUserName();
	    		article.setCreateName(name);
	    		count=articleService.getArticleListCount(article);
	    		countUser.put(name, count);
			}
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	    if(getUserList!=null){
	    	 page.setItems(getUserList);
	    }else{
	    	page.setItems(null);
	    }
	     model.addAttribute("page", page);
	     model.addAttribute("countUser", countUser);
	    return "user/manage-user";
	}
	//判断用户是否存在
	@RequestMapping(value="/user/logincodeisexit.html",method=RequestMethod.POST)
	@ResponseBody
	public String logincodeisexit(@RequestParam(value="userName",required=false)String userName){
		User user =new User();
		user.setUserName(userName);
		try {
			if(userService.loginCodeIsExit(user)>0){
				return "repeat";
			}else{
				return "only";
			}
		} catch (Exception e) {
			e.printStackTrace();
			return "failed";
		}
		
	}
	
	//添加用户
	@RequestMapping(value="/user/addUser.html",method=RequestMethod.POST)
	public String addUser(@ModelAttribute("addUser")User user){
		if(user.getRoleId()==1){
			user.setRoleName("系统管理员");
		}else{
			user.setRoleName("普通用户");
		}
		user.setVisit(0);
		try {
			userService.addUser(user);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/user/list.html";
	}
	//根据编号查询
	@RequestMapping(value="/user/getUserByid.html",method=RequestMethod.POST, produces = {"text/html;charset=UTF-8"})
	@ResponseBody
    public String getUserById(@RequestParam(value="id",required=false) String id){
		String cjson="";
		if(id== null || "".equals(id)){
			cjson ="nodata";
		}
		try {	
			User user = new User();
			user.setId(Integer.parseInt(id));
			user = userService.getUserById(user);
			JsonConfig jsonConfig = new JsonConfig();
			jsonConfig.registerJsonValueProcessor(Date.class,new JsonDateValueProcessor());
			JSONObject jo =JSONObject.fromObject(user, jsonConfig);
			cjson =jo.toString();

			/*JsonConfig jsonConfig = new JsonConfig();
			jsonConfig.registerJsonValueProcessor(Date.class, new JsonDateValueProcessor());
			JSONObject jo =JSONObject.fromObject(user, jsonConfig);
			cjson =jo.toString();*/
		} catch (Exception e) {
			e.printStackTrace();
			cjson ="failed";
		}
	
	   return cjson;
	}

	
	//查询用户密码
	@RequestMapping(value="/user/getUserpwd.html")
	@ResponseBody
	public String getUser_Pwd(@RequestParam(value="pwd",required=false)String pwd){
		Integer id =this.getCurrUser().getId();
		try {
			User user =new User();
			user.setId(id);
			String userPwd=userService.getUserPwd(user);
			if(userPwd==pwd || pwd.equals(userPwd)){
				return "success";
			}
			//cojs=UserPwd;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "notpwd";
	}
	@RequestMapping(value="/user/modifyUser.html",method=RequestMethod.POST)
	public String modifyUser(@ModelAttribute("modifyUser")User modifyUser){
		Integer id=this.getCurrUser().getId();
		modifyUser.setId(id);
		if(modifyUser.getRoleId()==1){
			modifyUser.setRoleName("系统管理员");
		}else{
			modifyUser.setRoleName("普通用户");
		}
		try {
			userService.modifyUser(modifyUser);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/user/list.html";
	}
	
	@RequestMapping(value="/user/delusre.html",method=RequestMethod.POST)
	@ResponseBody
	public String delUser(@RequestParam(value="id",required=false)String id){
	   if(id ==null || "".equals(id)){
		   return "nodata";
	   } 
	   
		try {
			 User user = new User();
			 user.setId(Integer.parseInt(id));
			 System.out.println("===============================>>>>>.."+id);
			 //删除好友表
			 Friend friend = new Friend();
			 Friend friend2 = new Friend();
			 friend.setCreateId(Integer.parseInt(id));
			 friend2.setAddFriend(Integer.parseInt(id));
			 friendService.delfriendUser(friend);
			 friendService.delfriendUser(friend2);
			 //删除消息表
			 News news = new News();
			 News news2 = new News();
			 news.setCreateId(Integer.parseInt(id));
			 news2.setUserId(Integer.parseInt(id));
			 newsService.delNewsUser(news);
			 newsService.delNewsUser(news2);
			 
			 userService.delUser(user);
			
		} catch (Exception e) {
			e.printStackTrace();
			
		}
		 return "success";
		
	}
	@RequestMapping(value="/user/getUserByids.html", produces = {"text/html;charset=UTF-8"})
	@ResponseBody
	public String getUserByids(){
	String result="nodata";
	 Integer id = this.getCurrUser().getId();
	 User user = new User();
	 user.setId(id);
	 try {
		 user=userService.getUserById(user); 
		 JsonConfig jsonConfig = new JsonConfig();
		 jsonConfig.registerJsonValueProcessor( Date.class, new JsonDateValueProcessor());
		 JSONObject jo = JSONObject.fromObject(user, jsonConfig);
		 result =jo.toString();
	} catch (Exception e) {
	 e.printStackTrace();
	}
	 return result;

	
	}
	
}
