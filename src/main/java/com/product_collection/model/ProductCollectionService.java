package com.product_collection.model;

import java.util.List;

public interface ProductCollectionService {

	void DeleteById();

	ProductCollectionVO Insert(Integer PRODC_MEM_ID, Integer PRODC_PROD_ID);

	List<ProductCollectionVO> SelectAll();

}
