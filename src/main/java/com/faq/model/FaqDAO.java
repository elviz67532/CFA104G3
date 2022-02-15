package com.faq.model;

import java.util.List;

import core.dao.CoreDao;

public interface FaqDAO extends CoreDao<FaqVO, Integer> {

	public FaqVO findByPrimaryKey(Integer id);

	List<FaqVO> getAll();
	
}
