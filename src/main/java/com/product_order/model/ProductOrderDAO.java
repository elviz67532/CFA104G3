package com.product_order.model;

import java.util.*;

import core.dao.CoreDao;

public interface ProductOrderDAO extends CoreDao<ProductOrderVO, Integer> {

//	int changeStatus(int id, int status);

	int updateStatus(ProductOrderVO vo);

	int reviseOrder(ProductOrderVO vo);

	List<ProductOrderVO> retrieveBySellerId(int memberId);

	List<ProductOrderVO> retrieveByBuyerId(int memberId);

//	public void insertOrder(ProductOrderVO shop_OrderFrontVO);// 新增訂單

//	public void updateOrderForFront(ProductOrderVO Shop_OrderVO); // 前台更新訂單

//	public void updateOrderReturnFront(ProductOrderVO shop_OrderVO); // 更新退貨訂單

//	public ProductOrderVO findByShopOrderId(Integer shop_order_id); // 單一會員一筆訂單查詢(使用訂單ID)

//	public Set<ProductOrderVO> getAllReturnOfOne(Integer mem_id); // 顯示一個人全部的退貨訂單

//	public Set<ProductOrderVO> getAllOrderOfOne(Integer mem_id); // 顯示一人全部訂單

//	public List<ProductOrderVO> getAllOrder(); // 顯示全部列表

//	public ProductOrderVO findById(Integer id);

}
