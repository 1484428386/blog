package org.blog.dao.article;

import java.util.List;

import org.blog.pojo.Article;

public interface ArticleMapper {
	//查询评论集合
	List<Article> getArticleList(Article Article);
	
	//查询评论总数
	int getArticleListCount(Article Article);
	
	//查询单个的文章对象
	Article getArticle(Article article);
	
	//修改的通用方法
	int modifyArticle(Article article);
	
	//添加文章对象
	int addArticle(Article article);
	
	//删除文章
	int delArticle(Article article);
}