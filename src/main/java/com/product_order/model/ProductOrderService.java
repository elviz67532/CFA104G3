package com.product_order.model;

import java.sql.Timestamp;
import java.util.List;

import com.activity.model.ActivityVO;
import com.product.model.ProductVO;

public interface ProductOrderService {

	ProductOrderVO addProductOrder(Integer productId, Integer customerMemberId, Integer sellerMemberId,
			String productName, String phone, String address, Integer amountOfProduct, Integer amountOfPrice);

	ProductOrderVO updateProductOrder(Integer id, Integer productId, Integer customerMemberId, Integer sellerMemberId,
			String productName, String phone, String address, Timestamp date, Integer amountOfProduct, Integer status,
			Integer amountOfPrice);

//	boolean changeStatus(Integer id, Integer status);

	public ProductOrderVO changeStatus(Integer id, Integer status);

	void deleteProductOrder(Integer id);

	List<ProductOrderVO> getAll();

	ProductOrderVO getOneProductOrder(Integer id);

	ProductOrderVO retrieveById(Integer id);

	ProductOrderVO reviseOrder(Integer id, String productName, String phone, String address);

	List<ProductOrderVO> retrieveByBuyerId(int memberId);

	List<ProductOrderVO> retrieveBySellerId(int memberId);

//	boolean getDataFromProduct(ProductVO productVO);

}
