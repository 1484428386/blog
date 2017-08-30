package org.blog.service.news;

import java.util.List;

import javax.annotation.Resource;

import org.blog.dao.news.NewsMapper;
import org.blog.pojo.News;
import org.springframework.stereotype.Service;

@Service
public class NewsServiceImpl implements NewsService {
    @Resource 
    public NewsMapper newsMapper;
	
	@Override
	public List<News> getNewsList(News news) throws Exception {
		return newsMapper.getNewsList(news);
	}

	//添加
	@Override
	public boolean addNews(News news) throws Exception {
		boolean falg = false;
		if(newsMapper.addNews(news)>0){
			falg=true;
		}
		return falg;
	}

	@Override
	public boolean modifyNews(News news) throws Exception {
		boolean falg=false;
		if(newsMapper.modifyNews(news)>0){
			falg=true;
		}
		return falg;
	}

	@Override
	public boolean delNews(News news) throws Exception {
		boolean falg=false;
		if(newsMapper.delNews(news)>0){
			falg=true;
		}
		return falg;
	}

	@Override
	public String getNewsByRocord(News news) throws Exception {
		return newsMapper.getNewsByRocord(news);
	}

	@Override
	public boolean delNewsUser(News news) throws Exception {
		boolean falg = false;
		if(newsMapper.delNewsUser(news)>0){
			falg=true;
		}
		return falg;
	}
	

}
