package com.faq.model;

import java.util.List;

import core.dao.CoreDao;

public interface FaqDAO extends CoreDao<FaqVO, Integer> {

	FaqVO findByPrimaryKey(Integer id);

	List<FaqVO> getAll();
}

