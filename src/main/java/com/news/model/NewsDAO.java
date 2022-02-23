package com.news.model;

import java.util.List;

import core.dao.CoreDao;

public interface NewsDAO extends CoreDao<NewsVO, Integer> {
	
	List<NewsVO> selectByType(Integer type);
}
