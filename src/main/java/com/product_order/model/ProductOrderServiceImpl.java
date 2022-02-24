package com.product_order.model;

import java.sql.Timestamp;
import java.util.List;

import com.activity.model.ActivityVO;
import com.product.model.ProductVO;

public class ProductOrderServiceImpl implements ProductOrderService {

	private ProductOrderDAO dao;

	public ProductOrderServiceImpl() {
		dao = new ProductOrderDAOJDBCImpl();
	}

	@Override
	public ProductOrderVO addProductOrder(Integer productId, Integer customerMemberId, Integer sellerMemberId,
			String productName, String phone, String address, Integer amountOfProduct, Integer amountOfPrice) {

		ProductOrderVO vo = new ProductOrderVO();

		vo.setProductId(productId);
		vo.setCustomerMemberId(customerMemberId);
		vo.setSellerMemberId(sellerMemberId);
		vo.setProductName(productName);
		vo.setPhone(phone);
		vo.setAddress(address);
		vo.setDate(new Timestamp(System.currentTimeMillis()));
		vo.setAmountOfProduct(amountOfProduct);
		vo.setStatus(0);
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
	public ProductOrderVO retrieveById(Integer id) {
		return dao.selectById(id);
	}

	@Override
	public List<ProductOrderVO> retrieveBySellerId(int memberId) {
		return dao.retrieveBySellerId(memberId);
	}

	@Override
	public List<ProductOrderVO> retrieveByBuyerId(int memberId) {
		return dao.retrieveByBuyerId(memberId);
	}

	@Override
	public List<ProductOrderVO> getAll() {
		return dao.selectAll();
	}

//	public boolean changeStatus(Integer id, Integer status) {
//
//		int row = dao.changeStatus(id, status);
//
//		return row > 0;
//	}

	@Override
	public ProductOrderVO changeStatus(Integer id, Integer status) {
		ProductOrderVO vo = new ProductOrderVO();
		vo.setId(id);
		vo.setStatus(status);
		dao.updateStatus(vo);
		return vo;
	}

	public ProductOrderVO waitGO(Integer id) {
		return changeStatus(id, 0);
	}

	public ProductOrderVO go(Integer id) {
		return changeStatus(id, 1);
	}

	public ProductOrderVO complete(Integer id) {
		return changeStatus(id, 2);

	}

	public ProductOrderVO accountOne(Integer id) {
		return changeStatus(id, 3);

	}

	public ProductOrderVO accountTwo(Integer id) {
		return changeStatus(id, 4);
	}

	public ProductOrderVO cancelOne(Integer id) {
		return changeStatus(id, 5);
	}

	public ProductOrderVO returnOne(Integer id) {
		return changeStatus(id, 6);
	}

	public ProductOrderVO cancelTwo(Integer id) {
		return changeStatus(id, 7);
	}

	public ProductOrderVO returnTwo(Integer id) {
		return changeStatus(id, 8);

	}

	public ProductOrderVO sellerCancelOne(Integer id) {
		return changeStatus(id, 9);

	}

	public ProductOrderVO sellerCancelTwo(Integer id) {
		return changeStatus(id, 10);

	}

	@Override
	public ProductOrderVO reviseOrder(Integer id, String productName, String phone, String address) {
		ProductOrderVO vo = new ProductOrderVO();
		vo.setId(id);
		vo.setProductName(productName);
		vo.setPhone(phone);
		vo.setAddress(address);
		dao.reviseOrder(vo);
		return vo;
	}

}
