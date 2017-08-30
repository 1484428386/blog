package org.blog.pojo;

import java.util.Date;

public class Friend extends Base {
	
	private Integer createId;
	private Integer statuc;
	private Date addDateTime;
	private Integer addFriend;
	
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
	public Integer getStatuc() {
		return statuc;
	}
	public void setStatuc(Integer statuc) {
		this.statuc = statuc;
	}
	public Date getAddDateTime() {
		return addDateTime;
	}
	public void setAddDateTime(Date addDateTime) {
		this.addDateTime = addDateTime;
	}
	

}
