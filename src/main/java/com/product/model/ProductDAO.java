package com.product.model;

import java.util.List;
import java.util.Set;

import core.dao.CoreDao;

// 商品
public interface ProductDAO extends CoreDao<ProductVO, Integer>{
	// 由商品名稱搜尋商品
	public List<ProductVO> getProductsByName(String prodName);
	// 由商品類型搜尋商品
	public List<ProductVO> getProductsByType(Integer prodType);
	
	public String insert_get_key(ProductVO productVO);
	
	public List<ProductVO> getCollection(List<Integer> productIds);
}
