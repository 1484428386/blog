package org.blog.service.friend;

import java.util.List;

import org.blog.pojo.Friend;
import org.blog.pojo.User;

public interface FriendService {
	//添加
	public boolean addFriend(Friend friend)throws Exception;
	//根据查询编号查询用
	public int getBycreateid(Friend friend)throws Exception;
	//查询好友
	public List<User> getFriendList(User user);
	//审核好友
	public List<User> getFriendstatuc(User user);
	//同意好友
	public boolean modifyFriend(Friend friend);
	//拒绝好友
	public boolean delFriend(Friend friend);
	//删除所有有关userid的列
    public boolean delfriendUser(Friend friend);
  

}
