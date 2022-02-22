package com.product_photo.model;

import java.sql.Blob;

import core.dao.CoreDao;

public interface ProductPhotoDAO extends CoreDao<ProductPhotoVO, Integer> {
	
	int insertId(Integer prodPhProdId, String photoPath);
	
	Blob getBlob(Integer prodPhProdId);
	
	void deleteByProdId(Integer prodPhProdId);
}
