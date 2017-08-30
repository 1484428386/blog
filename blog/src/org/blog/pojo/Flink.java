package org.blog.pojo;

/**
 * 友链表
 * @author samsung
 *
 */
public class Flink extends Base {
	
	private String name;//名称
	private String url;//路径
	private String describe;//描述
	private Integer createId;//创建者编号
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getDescribe() {
		return describe;
	}
	public void setDescribe(String describe) {
		this.describe = describe;
	}
	public Integer getCreateId() {
		return createId;
	}
	public void setCreateId(Integer createId) {
		this.createId = createId;
	}
	
	
	  

}
