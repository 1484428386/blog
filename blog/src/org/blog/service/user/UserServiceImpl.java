package org.blog.service.user;

import java.util.List;

import javax.annotation.Resource;

import org.blog.dao.user.UserMapper;
import org.blog.pojo.User;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {

	@Resource
	private UserMapper userMapper;
	
	//登录
	@Override
	public User login(User user) throws Exception {
      return userMapper.login(user);
	}
	
	@Override
	public int loginCodeIsExit(User user) throws Exception {
		return userMapper.loginCodeIsExit(user);
	}
	
	@Override
	public int modifyUser(User user) throws Exception {
		return userMapper.modifyUser(user);
	}

	@Override
	public int count() throws Exception {
		return userMapper.count();
	}

	@Override
	public List<User> getUserList(User user) throws Exception {
		return userMapper.getUserList(user);
	}

	@Override
	public boolean addUser(User user) throws Exception {
		boolean falg=false;
		if(userMapper.addUser(user)>0){
			falg=true;
		}
		return falg;
	}

	@Override
	public User getUserById(User user) throws Exception {
		return userMapper.getUserById(user);
	}

	@Override
	public String getUserPwd(User user) throws Exception {
		return userMapper.getUserPwd(user);
	}

	@Override
	public boolean delUser(User user) throws Exception {
		boolean falg=false;
		if(userMapper.delUser(user)>0){
			falg=true;
		}
		return falg;
	}

	@Override
	public List<Integer> getByVisit() throws Exception {
		return userMapper.getByVisit();
	}

	@Override
	public List<User> getUserByUserName(User user) throws Exception {
		return userMapper.getUserByUserName(user);
	}

}
