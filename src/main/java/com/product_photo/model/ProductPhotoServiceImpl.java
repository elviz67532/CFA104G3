package com.product_photo.model;

import java.sql.Blob;

public class ProductPhotoServiceImpl implements ProductPhotoService {

	ProductPhotoDAOJDBCImpl dao = new ProductPhotoDAOJDBCImpl();

	public void insert(Integer prodPhProdId, String photoPath) {
		dao.insertId(prodPhProdId, photoPath);
	}

	public void delete(Integer prodPhId) {
		dao.deleteById(prodPhId);
	}

	public Blob getByProdId(Integer prodPhProdId) {
		Blob blob = dao.getBlob(prodPhProdId);

		return blob;
	}

	public void deleteByProdId(Integer prodId) {
		dao.deleteByProdId(prodId);
	}

	public ProductPhotoVO findByProdId(Integer photoId) {
		return dao.selectById(photoId);
	}
}
