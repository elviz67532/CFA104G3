package com.product_order.model;

import java.sql.Timestamp;
import java.util.List;

import com.product.model.ProductVO;

public class ProductOrderServiceImpl implements ProductOrderService {

	private ProductOrderDAO dao;

	public ProductOrderServiceImpl() {
		dao = new ProductOrderDAOJDBCImpl();
	}

	@Override
	public ProductOrderVO addProductOrder(Integer customerMemberId, Integer sellerMemberId, String productName,
			String phone, String address, Timestamp date, Integer amountOfProduct, Integer status,
			Integer amountOfPrice) {

		ProductOrderVO vo = new ProductOrderVO();

		vo.setCustomerMemberId(customerMemberId);
		vo.setSellerMemberId(sellerMemberId);
		vo.setProductName(productName);
		vo.setPhone(phone);
		vo.setAddress(address);
		vo.setDate(date);
		vo.setAmountOfProduct(amountOfProduct);
		vo.setStatus(status);
		vo.setAmountOfPrice(amountOfPrice);

		dao.insert(vo);

		return vo;
	}

	@Override
	public ProductOrderVO updateProductOrder(Integer id, Integer productId, Integer customerMemberId,
			Integer sellerMemberId, String productName, String phone, String address, Timestamp date,
			Integer amountOfProduct, Integer status, Integer amountOfPrice) {

		ProductOrderVO vo = new ProductOrderVO();

		vo.setId(id);
		vo.setProductId(productId);
		vo.setCustomerMemberId(customerMemberId);
		vo.setSellerMemberId(sellerMemberId);
		vo.setProductName(productName);
		vo.setPhone(phone);
		vo.setAddress(address);
		vo.setDate(date);
		vo.setAmountOfProduct(amountOfProduct);
		vo.setStatus(status);
		vo.setAmountOfPrice(amountOfPrice);

		dao.update(vo);

		System.out.println("商品訂單已修改");
		return vo;
	}

	@Override
	public void deleteProductOrder(Integer id) {
		dao.deleteById(id);
	}

	@Override
	public ProductOrderVO getOneProductOrder(Integer id) {
		return dao.selectById(id);
	}

	@Override
	public List<ProductOrderVO> getAll() {
		return dao.selectAll();
	}

//	@Override
//	public boolean getDataFromProduct(ProductVO productVO) {
//
//		ProductOrderVO vo = new ProductOrderVO();
//
//		vo.setId(ProductVO.getProductId());
//		vo.setSellerMemberId(ProductVO.getSellerMemberId());
//
//		dao.insert(vo);
//
//		return true;
//	}
}
