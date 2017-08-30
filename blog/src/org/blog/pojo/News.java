package org.blog.pojo;

import java.util.Date;

public class News extends Base {
	private String newsText;//内容
	private Date createDate;//时间
	private Integer createId;//收消息人编号
	private Integer userId;//发消息人编号
	private Integer root;//房间号
	private Integer rocord;//消息显示
	private String userName;
	
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getNewsText() {
		return newsText;
	}
	public void setNewsText(String newsText) {
		this.newsText = newsText;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public Integer getCreateId() {
		return createId;
	}
	public void setCreateId(Integer createId) {
		this.createId = createId;
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public Integer getRoot() {
		return root;
	}
	public void setRoot(Integer root) {
		this.root = root;
	}
	public Integer getRocord() {
		return rocord;
	}
	public void setRocord(Integer rocord) {
		this.rocord = rocord;
	}
	

}
