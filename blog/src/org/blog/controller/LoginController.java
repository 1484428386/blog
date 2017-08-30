package org.blog.controller;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

import org.blog.common.Constants;
import org.blog.pojo.Article;
import org.blog.pojo.Comment;
import org.blog.pojo.LoginTime;
import org.blog.pojo.User;
import org.blog.service.article.ArticleService;
import org.blog.service.comment.CommentService;
import org.blog.service.flink.FlinkService;
import org.blog.service.logintime.LoginTimeService;
import org.blog.service.user.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class LoginController {
	
	@Resource
	private ArticleService articleService;
	@Resource
	private UserService userService;
	@Resource
	private LoginTimeService loginTimeService;
	@Resource
	private CommentService commentService;
	@Resource
	private FlinkService flinkService;
	
	//处理登录页面
    @RequestMapping(value="/login.html",method=RequestMethod.POST)
    @ResponseBody
	public String doLogin(@RequestParam String user,HttpSession session){
    	User jsonUser=(User)JSONObject.toBean(JSONObject.fromObject(user), User.class);
		User _user=null;
    	if(user==null || "".equals(user)){
    		return "nodata";
    	}else{
    		try {
        		if(userService.loginCodeIsExit(jsonUser)>0){
        			_user=userService.login(jsonUser);
        			
        			if(_user==null){
        				return "pwderror";
        			}else{
        				LoginTime loginTime=loginTimeService.getLoginTime(_user);
        				if (loginTime!=null) {
							_user.setLastTime(loginTime.getLoginTime());
							userService.modifyUser(_user);
						}
        				loginTime=new LoginTime();
						loginTime.setLoginTime(new Date());
        				loginTime.setUserId(_user.getId());
        				loginTime.setUserName(_user.getUserName());
        				loginTimeService.addLoginTime(loginTime);
        				session.setAttribute(Constants.SESSION_USER,_user );
            			return "success";	
        			}
        			
        		}else{
        			return "nologincode";
        		}
        		
    		} catch (Exception e) {
    			e.printStackTrace();
    			return "failed";
    		}  
    	}
    	
	}
    
    //去主页面
    @RequestMapping(value="/main.html", produces = {"text/html;charset=UTF-8"})
    public String gomain(Model model,HttpSession session){
    	User user =(User) session.getAttribute(Constants.SESSION_USER);
    	if (user==null) {
			return "/login";
		}
    	Integer visitcount=0;
		try {
			List<Integer> visit = userService.getByVisit();
			for (int i = 0; i < visit.size(); i++) {
			    if(visit.get(i)==null){
			    continue;
			    }
				visitcount=visitcount+visit.get(i);
			}
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		LoginTime loginTime=new LoginTime();
    	Article article=new Article();
    	Comment comment=new Comment();
    	comment.setReviewer(user.getUserName());
    	article.setCreateName(user.getUserName());
    	loginTime.setUserId(user.getId());
    	session.setAttribute("userLoginTimeList", loginTimeService.getUserLoginTime(loginTime));
    	model.addAttribute("loginTimeCount",loginTimeService.count());
    	model.addAttribute("articleCoutn",articleService.getArticleListCount(article));
    	try {
			model.addAttribute("commentCount",commentService.count(comment));
			model.addAttribute("flinkCount",flinkService.count(user));
		} catch (Exception e) {
			e.printStackTrace();
		}
    	model.addAttribute("visitcount", visitcount);
    	return "index";
    }
    
    
    //注销
    @RequestMapping(value="/loginOut.html")
    public String loginOut(HttpSession session) {
		session.removeAttribute(Constants.SESSION_USER);
		return "/login";
	}
    
    

}
