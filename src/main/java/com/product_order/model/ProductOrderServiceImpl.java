package com.product_order.model;

import java.sql.Timestamp;
import java.util.List;

public class ProductOrderServiceImpl implements ProductOrderService {

	private ProductOrderDAO dao;

	public ProductOrderServiceImpl() {
		dao = new ProductOrderDAOJDBCImpl();
	}

	public ProductOrderVO addProductOrder(Integer productId, Integer customerMemberId, Integer sellerMemberId,
			String productName, String phone, String address, Timestamp date, Integer amountOfProduct, Integer status,
			Integer amountOfPrice) {

		ProductOrderVO peroductOrderVO = new ProductOrderVO();

		peroductOrderVO.setProductId(productId);
		peroductOrderVO.setCustomerMemberId(customerMemberId);
		peroductOrderVO.setSellerMemberId(sellerMemberId);
		peroductOrderVO.setProductName(productName);
		peroductOrderVO.setPhone(phone);
		peroductOrderVO.setAddress(address);
		peroductOrderVO.setDate(date);
		peroductOrderVO.setAmountOfProduct(amountOfProduct);
		peroductOrderVO.setStatus(status);
		peroductOrderVO.setAmountOfPrice(amountOfPrice);

		dao.insert(peroductOrderVO);

		return peroductOrderVO;
	}

	public ProductOrderVO updateProductOrder(Integer id, Integer productId, Integer customerMemberId,
			Integer sellerMemberId, String productName, String phone, String address, Timestamp date,
			Integer amountOfProduct, Integer status, Integer amountOfPrice) {

		ProductOrderVO peroductOrderVO = new ProductOrderVO();

		peroductOrderVO.setId(id);
		peroductOrderVO.setProductId(productId);
		peroductOrderVO.setCustomerMemberId(customerMemberId);
		peroductOrderVO.setSellerMemberId(sellerMemberId);
		peroductOrderVO.setProductName(productName);
		peroductOrderVO.setPhone(phone);
		peroductOrderVO.setAddress(address);
		peroductOrderVO.setDate(date);
		peroductOrderVO.setAmountOfProduct(amountOfProduct);
		peroductOrderVO.setStatus(status);
		peroductOrderVO.setAmountOfPrice(amountOfPrice);
		dao.update(peroductOrderVO);

		return peroductOrderVO;
	}

	public void deleteProductOrder(Integer id) {
		dao.deleteById(id);
	}

	public ProductOrderVO getOneProductOrder(Integer id) {
		return dao.findByPrimaryKey(id);
	}

	public List<ProductOrderVO> getAll() {
		return dao.getAll();
	}
}
