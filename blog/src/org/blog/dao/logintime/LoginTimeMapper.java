package org.blog.dao.logintime;

import java.util.List;

import org.blog.pojo.LoginTime;
import org.blog.pojo.User;

public interface LoginTimeMapper {
	// 添加登录信息
	int addLoginTime(LoginTime loginTime);

	// 查询上次登录时间
	LoginTime getLoginTime(User user);

	// 查询所有登录的信息
	int count();

	// 分页显示用户登录日志
	List<LoginTime> getLoginTimeList(LoginTime loginTime);

	// 根据编号删除
	int delById(LoginTime loginTime);

	// 删除所有
	int delLoginTime();

	// 根据当前登录的人删除
	int delByUserName(LoginTime loginTime);
	
	//查询个人的登录记录
	List<LoginTime> getUserLoginTime(LoginTime loginTime);
}
