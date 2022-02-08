package com.product.dao;

import static org.junit.jupiter.api.Assertions.assertNotEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.sql.Timestamp;
import java.util.List;

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import com.product_order.model.ProductOrderDAO;
import com.product_order.model.ProductOrderDAOJDBCImpl;
import com.product_order.model.ProductOrderVO;

public class TestProductOrderDAO {
	private ProductOrderDAO dao;

	@BeforeEach
	public void before() {
		dao = new ProductOrderDAOJDBCImpl();
	}

	@AfterEach
	public void after() {
		dao = null;
	}

	@Test
	public void testInsert() {
		ProductOrderVO vo = new ProductOrderVO();

		vo.setId(1);
		vo.setProductId(4245);
		vo.setCustomerMemberId(1124);
		vo.setSellerMemberId(2457);
		vo.setProductName("Haru");
		vo.setPhone("0988888888");
		vo.setAddress("秋名市秋名路88號");
		vo.setDate(Timestamp.valueOf("2086-08-08 00:00:00"));
		vo.setAmountOfProduct(88);
		vo.setStatus(1);
		vo.setAmountOfPrice(88000);

		int row = dao.insert(vo);
		assertNotEquals(row, 0);
	}

	@Test
	public void testDeleteById() {
		int row = dao.deleteById(1);
		assertNotEquals(row, 0);
	}

	@Test
	public void testUpdate() {
		ProductOrderVO vo = new ProductOrderVO();

		vo.setId(1);
		vo.setProductId(4245);
		vo.setCustomerMemberId(1124);
		vo.setSellerMemberId(2457);
		vo.setProductName("Haha");
		vo.setPhone("0988880000");
		vo.setAddress("秋名市秋名路89號");
		vo.setDate(Timestamp.valueOf("2086-08-08 01:01:01"));
		vo.setAmountOfProduct(88);
		vo.setStatus(1);
		vo.setAmountOfPrice(88000);

		int row = dao.update(vo);
		assertNotEquals(row, 0);
	}

	@Test
	public void testSelectById() {
		ProductOrderVO vo = dao.selectById(1);
		assertNotNull(vo);
	}

	@Test
	public void testSelectAll() {
		List<ProductOrderVO> vos = dao.selectAll();
		assertTrue(vos.size() > 0);
	}
}
