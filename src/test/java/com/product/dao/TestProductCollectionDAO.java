package com.product.dao;

import static org.junit.jupiter.api.Assertions.assertNotEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.util.List;

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import com.product_collection.model.ProductCollectionDAO;
import com.product_collection.model.ProductCollectionDAOJDBCImpl;
import com.product_collection.model.ProductCollectionVO;

import core.DualKey;


public class TestProductCollectionDAO {
	private ProductCollectionDAO dao;

	@BeforeEach
	public void before(){
		dao = new ProductCollectionDAOJDBCImpl();
	}

	@AfterEach
	public void after(){
		dao = null;
	}

	@Test
	public void testInsert() {
		ProductCollectionVO productCollectionVO = new ProductCollectionVO();
	
		productCollectionVO.setMemberId(2);
		productCollectionVO.setProductId(3);
		
		int row = dao.insert(productCollectionVO);
		assertNotEquals(row, 0);
	}
	
//	@Test
//	public void testDeleteById() {
//		DualKey<Integer, Integer> id = new DualKey<>(2, 3);
//		int row = dao.deleteById(id);
//		assertNotEquals(row, 0);
//	}
//	
//	@Test
//	public void testSelectById() {
//		DualKey<Integer, Integer> id = new DualKey<>(2, 3);
//		ProductCollectionVO productCollectionVO = dao.selectById(id);
//		assertNotNull(productCollectionVO);
//	}
//	
//	@Test
//	public void testSelectAll() {
//		List<ProductCollectionVO> vos = dao.selectAll();
//		assertTrue(vos.size() > 0);
//	}
}
