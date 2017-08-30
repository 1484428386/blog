package org.blog.service.friend;

import java.util.List;

import javax.annotation.Resource;

import org.blog.dao.friend.FriendMapper;
import org.blog.pojo.Friend;
import org.blog.pojo.User;
import org.springframework.stereotype.Service;

@Service
public class FriendServiceImpl implements FriendService{

	@Resource
	private FriendMapper friendMapper;
	//添加
	@Override
	public boolean addFriend(Friend friend)throws Exception{
		boolean falg=false;
		if(friendMapper.addFriend(friend)>0){
			falg=true;
		}
		return falg;
	}
	@Override
	public int getBycreateid(Friend friend) throws Exception {
		return friendMapper.getBycreateid(friend);
	}
	@Override
	public List<User> getFriendList(User user) {
		return friendMapper.getFriendList(user);
	}
	@Override
	public boolean modifyFriend(Friend friend) {
		boolean falg =false;
		if(friendMapper.modifyFriend(friend)>0){
			falg=true;
		}
		return falg;
	}
	@Override
	public boolean delFriend(Friend friend) {
		boolean falg =false;
		if(friendMapper.delFriend(friend)>0){
			falg=true;
		}
		return falg;
	}
	@Override
	public List<User> getFriendstatuc(User user) {
		return friendMapper.getFriendstatuc(user);
	}
	@Override
	public boolean delfriendUser(Friend friend) {
		boolean falg = false;
		if(friendMapper.delfriendUser(friend)>0){
			falg=true;
		}
		return falg;
	}
	
}
