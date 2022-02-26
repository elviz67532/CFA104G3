package com.product.model;

import java.sql.Timestamp;
import java.util.List;

import core.dao.CoreDao;

public class ProductServiceImpl implements ProductService {

	private ProductDAO dao;

	public ProductServiceImpl() {
		dao = new ProductDAOImpl();
	}

	public String addProduct(String prodName, Integer prodMemId, Integer prodType, String prodDesc,
			Integer prodPrice, Timestamp prodUptime, String prodLoc, Integer prodStatus) {

		ProductVO productVO = new ProductVO();

		productVO.setName(prodName);
		productVO.setSellerMemberId(prodMemId);
		productVO.setType(prodType);
		productVO.setDescription(prodDesc);
		productVO.setPrice(prodPrice);
		productVO.setLaunchedDate(prodUptime);
		productVO.setLocation(prodLoc);
		productVO.setStatus(prodStatus);

		String key = dao.insert_get_key(productVO);

		return key;
	}

	public ProductVO updateProduct(Integer prodId, String prodName, Integer prodMemId, Integer prodType,
			String prodDesc, Integer prodPrice, Timestamp prodUptime, String prodLoc, Integer prodStatus) {

		ProductVO productVO = new ProductVO();

		productVO.setId(prodId);
		productVO.setName(prodName);
		productVO.setSellerMemberId(prodMemId);
		productVO.setType(prodType);
		productVO.setDescription(prodDesc);
		productVO.setPrice(prodPrice);
		productVO.setLaunchedDate(prodUptime);
		productVO.setLocation(prodLoc);
		productVO.setStatus(prodStatus);

		int r = dao.update(productVO);

		return productVO;
	}

	public void delete(Integer prodId) {
		dao.deleteById(prodId);
	}

	public ProductVO getOneProduct(Integer prodId) {
		return dao.selectById(prodId);
	}

	public List<ProductVO> getAll() {
		return dao.selectAll();
	}

	public List<ProductVO> getProductsByType(Integer prodType) {
		return dao.getProductsByType(prodType);
	}
	
	public List<ProductVO> getIdForCollection(List<Integer> productIds){
		return dao.getCollection(productIds);
	}
	
	public List<ProductVO> getFromMember(Integer sellerMemberId){
		return dao.getProductsByMem(sellerMemberId);
	}
	
	public void updateStatus(Integer prodId) {
		dao.updateStatus(prodId);
	}
}
