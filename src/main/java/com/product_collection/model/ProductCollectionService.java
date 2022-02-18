package com.product_collection.model;

import java.util.List;

public interface ProductCollectionService {

	void deleteById();

	ProductCollectionVO insert(Integer memberId, Integer productId);

	List<ProductCollectionVO> selectAll();

	List<ProductCollectionVO> getByMemId(int memberId);

}
