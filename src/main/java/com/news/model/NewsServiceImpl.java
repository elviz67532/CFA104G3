package com.news.model;

import java.sql.Timestamp;
import java.util.List;

public class NewsServiceImpl {

	private NewsDAO dao;

	public NewsServiceImpl() {
		dao = new NewsDAOJDBCImpl();
	}
	

	public NewsVO insert(String content, byte[] image, Timestamp date,
			Integer type, String title) {
		NewsVO pojo = new NewsVO();

		
		pojo.setContent(content);
		pojo.setImage(image);
		pojo.setDate(date);
		pojo.setType(type);
		pojo.setTitle(title);
		dao.insert(pojo);

		return pojo;

	}

	
	public NewsVO update(Integer id, String content, byte[] image, Timestamp date,
			Integer type, String title) {
		
		NewsVO pojo = new NewsVO();

		pojo.setId(id);
		pojo.setContent(content);
		pojo.setImage(image);
		pojo.setDate(date);
		pojo.setType(type);
		pojo.setTitle(title);
		
		dao.update(pojo);

		return pojo;

	}
	

	public void delete(Integer id) {
		dao.deleteById(id);
	}


	public NewsVO selectOneNews(Integer id) {
		return dao.selectById(id);
	}


	public List<NewsVO> selectAllNews() {
		return dao.selectAll();
	}
	
	public List<NewsVO> selectAllByType(Integer type){
		return dao.selectByType(type);
	}	
}
