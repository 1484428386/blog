package org.blog.service.user;

import java.util.List;

import org.blog.pojo.User;

public interface UserService {
	//登录
	public User login(User user)throws Exception;
	//判断用户是否存在
	public int loginCodeIsExit(User user)throws Exception;
	//修改通用方法
	public int modifyUser(User user)throws Exception;
	//获取总记录数
	public int count()throws Exception;
	//分页显示用户
	public List<User> getUserList(User user)throws Exception;
	//添加用户
	public boolean addUser(User user)throws Exception;
	//根据编号精确查询
	public User getUserById(User user)throws Exception;
	//查询用户密码
	public String getUserPwd(User user)throws Exception;
	//删除用户
	public boolean delUser(User user)throws Exception;
	//查询所有的用户的登录次数
	public List<Integer> getByVisit()throws Exception;
	//根据用户名模糊查询用户信息
	public List<User> getUserByUserName(User user)throws Exception;
}
