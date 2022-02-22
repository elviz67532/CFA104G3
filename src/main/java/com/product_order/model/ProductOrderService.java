package com.product_order.model;

import java.sql.Timestamp;
import java.util.List;

import com.activity.model.ActivityVO;
import com.product.model.ProductVO;

public interface ProductOrderService {

	ProductOrderVO addProductOrder(Integer customerMemberId, Integer sellerMemberId, String productName, String phone,
			String address, Timestamp date, Integer amountOfProduct, Integer status, Integer amountOfPrice);

	ProductOrderVO updateProductOrder(Integer id, Integer productId, Integer customerMemberId, Integer sellerMemberId,
			String productName, String phone, String address, Timestamp date, Integer amountOfProduct, Integer status,
			Integer amountOfPrice);

//	boolean changeStatus(Integer id, Integer status);

	public ProductOrderVO changeStatus(Integer id, Integer status);

	void deleteProductOrder(Integer id);

	List<ProductOrderVO> getAll();

	ProductOrderVO getOneProductOrder(Integer id);

	ProductOrderVO retrieveById(Integer id);

//	boolean getDataFromProduct(ProductVO productVO);

}
