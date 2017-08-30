package org.blog.service.article;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.blog.dao.article.ArticleMapper;
import org.blog.pojo.Article;
import org.springframework.stereotype.Service;

@Service
public class ArticleServiceImpl implements ArticleService {

	@Resource
	private ArticleMapper articleMapper;
	
	// 查询评论集合
	@Override
	public List<Article> getArticleList(Article article) {
		return articleMapper.getArticleList(article);
	}

	// 查询评论总数
	@Override
	public int getArticleListCount(Article article) {
		return articleMapper.getArticleListCount(article);
	}

	// 查询单个的文章对象
	@Override
	public Article getArticle(Article article) {
		return articleMapper.getArticle(article);
	}

	// 修改的通用方法
	@Override
	public boolean modifyArticle(Article article) {
		if (articleMapper.modifyArticle(article)>0) {
			return true;
		}
		return false;
	}

	// 添加文章对象
	@Override
	public boolean addArticle(Article article) {
		if (articleMapper.addArticle(article)>0) {
			return true;
		}
		return false;
	}

	// 删除文章
	@Override
	public boolean delArticle(Article article) {
		if (articleMapper.delArticle(article)>0) {
			return true;
		}
		return false;
	}

}
