package org.blog.dao.news;

import java.util.List;

import org.blog.pojo.News;

public interface NewsMapper {
  //查询聊天信息
  public List<News> getNewsList(News news)throws Exception;
  //添加
  public int addNews(News news)throws Exception;
  //修改
  public int modifyNews(News news)throws Exception;
  //删除
  public int delNews(News news)throws Exception;
  //查询
  public String getNewsByRocord(News news)throws Exception;
  //删除所有有关userid的列
  public int delNewsUser(News news)throws Exception;
  

}
