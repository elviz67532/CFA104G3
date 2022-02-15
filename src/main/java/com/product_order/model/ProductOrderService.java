package com.product_order.model;

import java.sql.Timestamp;
import java.util.List;

import com.product.model.ProductVO;

public interface ProductOrderService {

	ProductOrderVO addProductOrder(Integer productId, Integer customerMemberId, Integer sellerMemberId,
			String productName, String phone, String address, Timestamp date, Integer amountOfProduct, Integer status,
			Integer amountOfPrice);

	ProductOrderVO updateProductOrder(Integer id, Integer productId, Integer customerMemberId, Integer sellerMemberId,
			String productName, String phone, String address, Timestamp date, Integer amountOfProduct, Integer status,
			Integer amountOfPrice);

	void deleteProductOrder(Integer id);

	List<ProductOrderVO> getAll();

	ProductOrderVO getOneProductOrder(Integer id);

	
//	boolean getDataFromProduct(ProductVO productVO);

}
