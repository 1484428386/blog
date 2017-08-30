package org.blog.controller;

import java.beans.PropertyEditorSupport;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.blog.common.Constants;
import org.blog.pojo.User;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

public class BaseController {
	
	public User currUser;

	public User getCurrUser() {
		HttpServletRequest request= ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
		HttpSession session=request.getSession(false);
		if(session!=null){
			currUser=(User) session.getAttribute(Constants.SESSION_USER);
		}
		return currUser;
	}

	public void setGetCurrUser(User getCurrUser) {
		this.currUser = getCurrUser;
	}
	
	 @InitBinder
	 public void InitBinder(WebDataBinder dataBinder){
			dataBinder.registerCustomEditor(Date.class, new PropertyEditorSupport() {
			    public void setAsText(String value) {
			        try {
			            setValue(new SimpleDateFormat("yyyy-MM-dd").parse(value));
			        } catch(ParseException e) {
			            setValue(null);
			        }
			    }
			    public String getAsText() {
			        return new SimpleDateFormat("yyyy-MM-dd").format((Date) getValue());
			    }        

			});
		}
	 
	

}
