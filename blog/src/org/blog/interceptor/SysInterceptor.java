package org.blog.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.blog.common.Constants;
import org.blog.pojo.User;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class SysInterceptor extends HandlerInterceptorAdapter {
	
	@Override
	public boolean preHandle(HttpServletRequest request,HttpServletResponse response,
							Object handler) throws Exception {  
	   //intercept  
	   HttpSession session = request.getSession();  
	   
	   User user =  ((User)session.getAttribute(Constants.SESSION_USER));
	   
	   if(null == user){
		   response.sendRedirect("/");
		   return false;
	   }
	   return true;
	}
}
