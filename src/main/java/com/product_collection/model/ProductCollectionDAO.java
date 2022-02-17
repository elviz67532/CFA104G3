package com.product_collection.model;

import java.util.List;

import core.DualKey;
import core.dao.CoreDao;

public interface ProductCollectionDAO extends CoreDao<ProductCollectionVO, DualKey<Integer, Integer>> {

	List<ProductCollectionVO> selectByMemId(int memberId);
	
}

