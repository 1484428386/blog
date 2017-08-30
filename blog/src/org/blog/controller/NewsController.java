package org.blog.controller;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import net.sf.json.JSONObject;

import org.blog.common.Constants;
import org.blog.common.SQLTools;
import org.blog.pojo.Friend;
import org.blog.pojo.News;
import org.blog.pojo.User;
import org.blog.service.friend.FriendService;
import org.blog.service.news.NewsService;
import org.blog.service.user.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mysql.jdbc.StringUtils;

@Controller
public class NewsController extends BaseController{

	@Resource
	private UserService userService;
	@Resource
	private FriendService friendService;
	@Resource
	private NewsService newsService;
	//去搜索
	@RequestMapping(value="/news/newslist.html")
	public String tonewsList(Model model) throws Exception{	   
		Integer ids = this.getCurrUser().getId();
		User user = new User();
		user.setId(ids);
		List<User> friendlist =friendService.getFriendList(user);
		List<User> friendstatuc=friendService.getFriendstatuc(user);
		model.addAttribute("friendlist", friendlist);
		model.addAttribute("friendstatuc", friendstatuc);
		//没有沟通的坏处
		model.addAttribute("user",Constants.SESSION_USER);
		return "/news/newslist";
	}
	//去好友添加页面
	@RequestMapping(value="/news/addfriend.html")
	public String addFriend(Model model){
		List<User> userlist =null;
		model.addAttribute("userlist", userlist);
		return "/news/friend";
	}
	@RequestMapping(value="/news/userbyusername.html", produces = {"text/html;charset=UTF-8"})
	public String UserByUserName(String name,Model model){

		List<User> userlist=null;
		if(name==null){
			
		}else{
			User user = new User();
			user.setUserName("%"+SQLTools.transfer(name)+"%");
			try {
				userlist=userService.getUserByUserName(user);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		model.addAttribute("name", name);
		model.addAttribute("userlist", userlist);
		return "/news/friend";
	}

	@RequestMapping(value="/news/addfriend")
	@ResponseBody
	public String addFriend(@RequestParam(value="id",required=false)String id){
		Integer uid=this.getCurrUser().getId();
		Integer ids = Integer.parseInt(id);
		if(uid==ids){
			return "notuser";
		}
		
		try {
			Friend friend = new Friend();
			friend.setCreateId(uid);
			friend.setAddFriend(ids);
			if(friendService.getBycreateid(friend)>0){
				return "isdata";
			}else{
				Friend newfriend = new Friend();
				newfriend.setCreateId(uid);
				newfriend.setStatuc(3);
				newfriend.setAddFriend(ids);
				newfriend.setAddDateTime(new Date());
				friendService.addFriend(newfriend);
				return "success";
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
		
		
	}
	
  //同意好友
	@RequestMapping(value="/news/consentfriend.html")
	@ResponseBody
	public String consent(@RequestParam(value="addfriend",required=false)String addfriend,@RequestParam(value="userid1",required=false)String userid){
		if(addfriend==null || "".equals(addfriend) || userid==null || "".equals(userid)){
			return "nodata";
		}
		Integer uid =Integer.parseInt(userid);
		//x
		 Integer addfriendid=Integer.parseInt(addfriend);
		 Friend friend = new Friend();
		 friend.setCreateId(uid);
		 friend.setAddFriend(addfriendid);
		 friend.setStatuc(1);
		 friend.setAddDateTime(new Date());
		 //t
		 Friend newfriend = new Friend();
		 newfriend.setCreateId(addfriendid);
		 newfriend.setAddFriend(uid);
		 newfriend.setStatuc(1);
		 newfriend.setAddDateTime(new Date());
		
		 if(friendService.modifyFriend(friend)){
			 try {
				 friendService.addFriend(newfriend);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			 return "success";
		 }else{
			 return "error";
		 }
		
	}
	
	@RequestMapping(value="/news/refusefriend")
	@ResponseBody
	public String refuse(@RequestParam(value="addfriend",required=false)String addfriend,@RequestParam(value="userid1",required=false)String userid){
		if(addfriend==null || "".equals(addfriend)){
			return "nodata";
		}
		Integer uid =Integer.parseInt(userid);
		 Integer addfriendid=Integer.parseInt(addfriend);
		 Friend friend = new Friend();
		 friend.setCreateId(uid);
		 friend.setAddFriend(addfriendid);
		 if(friendService.delFriend(friend)){
			 return "success";
		 }else{
			 return "error";
		 }
		
	}
	//去聊天页面
	@RequestMapping(value="/news/newsroot.html")
	public String tonews(@RequestParam(value="createId")String createId,Model model){
		//当前登录的编号
		Integer userId = this.getCurrUser().getId();
		//传过来的编号
		Integer friendId = Integer.parseInt(createId);
		
		//互换参数
		Integer FidUid = 0;
		if(friendId<userId){
			FidUid=friendId;
			friendId=userId;
			userId=FidUid;
			
		}
		//当前登录的编号转成String
		String sUserId =userId.toString();
		//要和谁聊天的编号
		String sFriendId=friendId.toString();
		//房间号
		String root=sUserId+sFriendId;
		News news = new News();
		news.setRoot(Integer.parseInt(root));
		List<News> newsList=null;
		try {
			newsList = newsService.getNewsList(news);
		} catch (Exception e) {
			e.printStackTrace();
		}
	     model.addAttribute("newsList", newsList);
	     model.addAttribute("sUserId", this.getCurrUser().getId());
	     model.addAttribute("createId", createId);
		return "/news/friendroot";
		
	}
     @RequestMapping(value="/news/addnews.html")
     @ResponseBody
     public String addNews(String news){
    	 News jsonNews=(News)JSONObject.toBean(JSONObject.fromObject(news), News.class);
    	  Integer userId = this.getCurrUser().getId();
    	  Integer friendId=jsonNews.getCreateId();
    	  //互换参数
  		  Integer FidUid = 0;
    	  if(friendId<userId){
    		  FidUid=friendId;
    		  friendId=userId;
    		  userId=FidUid;
    	  }
    	  String sUserId =userId.toString();
  		  //要和谁聊天的编号
  	      String sFriendId=friendId.toString();
  		  //房间号
  		  String root=sUserId+sFriendId;
  		    News addnews = new News();
  		    addnews.setRoot(Integer.parseInt(root));
  		    addnews.setCreateId(jsonNews.getCreateId());
  		    addnews.setUserId(this.getCurrUser().getId());
  		    addnews.setNewsText(jsonNews.getNewsText());
  		    addnews.setRocord(0);
  		    addnews.setCreateDate(new Date());
  		    try {
				newsService.addNews(addnews);
		        return "success";
			} catch (Exception e) {
				e.printStackTrace();
				return "error";
			}
    	  
     }
     @RequestMapping(value="/news/delnews.html")
     @ResponseBody
     public String delNews(@RequestParam(value="id",required=false)String id ,
    		 @RequestParam(value="createId",required=false)String createId) {
    	 if(StringUtils.isNullOrEmpty(id) || StringUtils.isNullOrEmpty(createId)){
    		 return "nodata";
    	 }
    	
    	 Integer record=null;
    	 News news = new News();
    	 news.setRocord(Integer.parseInt(createId));
    		 try {
    		
    	    		
    	    	news.setId(Integer.parseInt(id));
				record=Integer.parseInt(newsService.getNewsByRocord(news));
				if(record==0){
					newsService.modifyNews(news);
				}else{
					newsService.delNews(news);	
				}
    		 
    			
			} catch (Exception e) {
				e.printStackTrace();
			} 
    	 return "success";
     }
    //删除好友
	@RequestMapping(value="/news/delfriend.html")
	@ResponseBody
	public String delfrined(@RequestParam(value="addfriend",required=false)String addfriend,@RequestParam(value="userid1",required=false)String userid){
		if(addfriend==null || "".equals(addfriend)){
			return "nodata";
		}
		 Integer uid =Integer.parseInt(userid);
		 Integer addfriendid=Integer.parseInt(addfriend);
		 Friend friend = new Friend();
		 friend.setCreateId(uid);
		 friend.setAddFriend(addfriendid);
		 Friend delFriend = new Friend();
		 delFriend.setCreateId(addfriendid);
		 delFriend.setAddFriend(uid);
		 if(friendService.delFriend(friend)){
			 friendService.delFriend(delFriend);
			 return "success";
		 }else{
			 return "error";
		 }
		
	}
  
}