package org.blog.pojo;

import java.util.Date;

public class User extends Base  {

    private String userName;

    private String userPwd;

    private String phone;

    private String name;

    private Integer roleId;

    private String roleName;

    private Integer visit;

    private Date lastTime;
    
    public Integer statuc;
    private Integer addFriend;
	private Integer createId;
    
    
	public Integer getStatuc() {
		return statuc;
	}

	public void setStatuc(Integer statuc) {
		this.statuc = statuc;
	}

	public Integer getAddFriend() {
		return addFriend;
	}

	public void setAddFriend(Integer addFriend) {
		this.addFriend = addFriend;
	}

	public Integer getCreateId() {
		return createId;
	}

	public void setCreateId(Integer createId) {
		this.createId = createId;
	}

	public Date getLastTime() {
		return lastTime;
	}

	public void setLastTime(Date lastTime) {
		this.lastTime = lastTime;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserPwd() {
		return userPwd;
	}

	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getRoleId() {
		return roleId;
	}

	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}

	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	public Integer getVisit() {
		return visit;
	}

	public void setVisit(Integer visit) {
		this.visit = visit;
	}

}