package org.blog.controller;

import java.util.List;

import javax.annotation.Resource;

import org.blog.common.PageSupport;
import org.blog.pojo.LoginTime;
import org.blog.service.logintime.LoginTimeService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class LoginTimeController extends BaseController{
	@Resource
	private LoginTimeService loginTimeService;
	
	@RequestMapping(value="/login/logintimeList.html")
	public String getList(@RequestParam(value="currentpage",required=false)Integer currentpage,Model model){
		PageSupport page = new PageSupport();
		LoginTime loginTime =new  LoginTime();
		page.setTotalCount(loginTimeService.count());
	    if(page.getTotalCount()>0){
	    	if(currentpage!=null){
	    		page.setPage(currentpage);
	    		if(page.getPage()<0){
	    			page.setPage(1);
	    		}
	    		if(page.getPage()>page.getPageCount()){
	    			page.setPage(page.getPageCount());
	    		}
	    	}
	    }
	    loginTime.setStartNum((page.getPage()-1)*page.getPageSize());
	    loginTime.setPageSize(page.getPageSize());
	    List<LoginTime> list = loginTimeService.getLoginTimeList(loginTime);
	    page.setItems(list);
	    
	    model.addAttribute("page", page);
		return "user/loginlog";
	}
   //根据编号精确查询
	@RequestMapping(value="/login/delbyid.html")
	@ResponseBody
	public String delByid(@RequestParam(value="id",required=false)String id){
		if(id==null || "".equals(id)){
			return "nodata";
		}
		LoginTime loginTime = new LoginTime();
		loginTime.setId(Integer.parseInt(id));
		try {
			loginTimeService.delById(loginTime);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "success";
	}
	
	//清除本人所有登录信息
	@RequestMapping(value="/login/delbyusername.html")
	public String delByUserName(){
		LoginTime loginTime = new LoginTime();
		String userName = this.getCurrUser().getUserName();
		loginTime.setUserName(userName);
		loginTimeService.delByUserName(loginTime);
		return "redirect:/login/logintimeList.html";
	}
	//删除所有登录者信息
	@RequestMapping(value="/login/dellogintime.html")
	public String delLoginTime(){
		loginTimeService.delLoginTime();
		return "redirect:/login/logintimeList.html";
	}
	
	
	
}
