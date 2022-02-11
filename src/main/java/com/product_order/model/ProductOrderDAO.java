package com.product_order.model;

import java.util.List;

import core.dao.CoreDao;

public interface ProductOrderDAO extends CoreDao<ProductOrderVO, Integer> {

	List<ProductOrderVO> getAll();

	ProductOrderVO findByPrimaryKey(Integer id);
}
