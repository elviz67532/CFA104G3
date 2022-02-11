package com.product_collection.model;

import java.util.List;

import core.DualKey;

public class ProductCollectionServiceImpl implements ProductCollectionService {

	private ProductCollectionDAO dao;

	public ProductCollectionServiceImpl() {
		dao = new ProductCollectionDAOJDBCImpl();
	}

	@Override
	public ProductCollectionVO Insert(Integer PRODC_MEM_ID, Integer PRODC_PROD_ID) {
		ProductCollectionVO productCollectionVO = new ProductCollectionVO();

		productCollectionVO.setMemberId(PRODC_MEM_ID);
		productCollectionVO.setProductId(PRODC_PROD_ID);
		dao.insert(productCollectionVO);

		return productCollectionVO;

	}

	@Override
	public void DeleteById() {
		DualKey<Integer, Integer> id = new DualKey<Integer, Integer>(null, null);
		dao.deleteById(id);
	}

	@Override
	public List<ProductCollectionVO> SelectAll() {
		return dao.selectAll();
	}
}
