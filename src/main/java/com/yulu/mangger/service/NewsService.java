package com.yulu.mangger.service;


import com.yulu.mangger.bean.News;

import java.util.List;

public interface NewsService {
	List<News> findNewsList(News news,int pageNum, int pageSize) throws Exception;

	List<News> findNewsSerachList(News news,int pageNum, int pageSize) throws Exception;

	News findNewsById(Integer id) throws Exception;

	void edit_do(News news) throws Exception;

	void delete_do(Integer id) throws Exception;

	void add_do(News news) throws Exception;

}
