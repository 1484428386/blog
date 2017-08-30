package org.blog.service.logintime;

import java.util.List;

import javax.annotation.Resource;

import org.blog.dao.logintime.LoginTimeMapper;
import org.blog.pojo.LoginTime;
import org.blog.pojo.User;
import org.springframework.stereotype.Service;

@Service
public class LoginTimeServiceImpl implements LoginTimeService {

	@Resource
	private LoginTimeMapper loginTimeMapper;

	// 添加登录信息
		@Override
		public boolean addLoginTime(LoginTime loginTime) {
			if (loginTimeMapper.addLoginTime(loginTime)>0) {
				return true;
			}
			return false;
		}

		// 查询上次登录时间
		@Override
		public LoginTime getLoginTime(User user) {
			return loginTimeMapper.getLoginTime(user);
		}

		//查询所有登录的信息
		@Override
		public int count() {
			return loginTimeMapper.count();
		}

		@Override
		public List<LoginTime> getLoginTimeList(LoginTime loginTime) {
			return loginTimeMapper.getLoginTimeList(loginTime);
		}

		@Override
		public int delById(LoginTime loginTime) {
			
			return loginTimeMapper.delById(loginTime);
		}

		@Override
		public int delLoginTime() {
			return loginTimeMapper.delLoginTime();
		}

		@Override
		public int delByUserName(LoginTime loginTime) {
			return loginTimeMapper.delByUserName(loginTime);
		}

		// 查询个人的登录记录
		@Override
		public List<LoginTime> getUserLoginTime(LoginTime loginTime) {
			return loginTimeMapper.getUserLoginTime(loginTime);
		}
}
