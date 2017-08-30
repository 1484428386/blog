package org.blog.pojo;

import java.util.Date;


/**
 * 评论表
 * @author samsung
 *
 */
public class Comment extends Base {
	
	private String commentText;//评论内容
	private Date createDate;//评论日期
	private Integer articleId;//文章编号
	private String reviewer;//评论人
	
	public String getReviewer() {
		return reviewer;
	}
	public void setReviewer(String reviewer) {
		this.reviewer = reviewer;
	}
	public String getCommentText() {
		return commentText;
	}
	public void setCommentText(String commentText) {
		this.commentText = commentText;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public Integer getArticleId() {
		return articleId;
	}
	public void setArticleId(Integer articleId) {
		this.articleId = articleId;
	}
	
	
	
	
	

}
