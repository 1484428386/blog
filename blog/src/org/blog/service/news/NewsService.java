package org.blog.service.news;

import java.util.List;

import org.blog.pojo.News;

public interface NewsService {
	//查询聊天信息
	public List<News> getNewsList(News news)throws Exception;
	//添加
	public boolean addNews(News news)throws Exception;
	//修改
	public boolean modifyNews(News news)throws Exception;
	//删除
	public boolean delNews(News news)throws Exception;
	//查询
	public String getNewsByRocord(News news)throws Exception;
	//删除所有有关userid的列
	public boolean delNewsUser(News news)throws Exception;
	


}
