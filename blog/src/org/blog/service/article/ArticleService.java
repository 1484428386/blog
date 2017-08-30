package org.blog.service.article;

import java.util.List;

import org.blog.pojo.Article;

public interface ArticleService {
	// 查询评论集合
	List<Article> getArticleList(Article article);

	// 查询评论总数
	int getArticleListCount(Article article);

	// 查询单个的文章对象
	Article getArticle(Article article);

	// 修改的通用方法
	boolean modifyArticle(Article article);

	// 添加文章对象
	boolean addArticle(Article article);

	// 删除文章
	boolean delArticle(Article article);
}
