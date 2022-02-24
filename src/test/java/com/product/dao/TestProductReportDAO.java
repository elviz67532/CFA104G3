package com.product.dao;

import static org.junit.jupiter.api.Assertions.assertNotEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.sql.Timestamp;
import java.util.List;

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import com.product_report.model.ProductReportDAO;
import com.product_report.model.ProductReportDAOJDBCImpl;
import com.product_report.model.ProductReportVO;

import core.DualKey;

public class TestProductReportDAO {
	private ProductReportDAO dao;

	@BeforeEach
	public void before() {
		dao = new ProductReportDAOJDBCImpl();
	}

	@AfterEach
	public void after() {
		dao = null;
	}

//	@Test
//	public void testInsert() {
//		ProductReportVO productReportVO = new ProductReportVO();
//
//		byte[] array12 = new byte[2];
//		array12[0] = (byte) 0xd0;
//		array12[1] = (byte) 0xea;
//
//		productReportVO.setProductId(3);
//		productReportVO.setMemberId(3);
//		productReportVO.setContent("apexlegend111");
//		productReportVO.setDate(new Timestamp(System.currentTimeMillis()));
//		productReportVO.setPhoto(array12);
//		productReportVO.setStatus(1);
//
//		int row = dao.insert(productReportVO);
//		assertNotEquals(row, 0);
//	}
//
	@Test
	public void testDeleteById() {
		DualKey<Integer, Integer> id = new DualKey<>(1, 4);
		int row = dao.deleteById(id);
		assertNotEquals(row, 0);
	}
	
	@Test
	public void testUpdate() {
		ProductReportVO productReportVO = new ProductReportVO();

		byte[] array12 = new byte[2];
		array12[0] = (byte) 0xdd;
		array12[1] = (byte) 0xee;


		productReportVO.setContent("王八蛋你再抱錯你試試看");
		productReportVO.setDate(new Timestamp(System.currentTimeMillis()));
		productReportVO.setPhoto(array12);
		productReportVO.setStatus(1);
		productReportVO.setProductId(1);
		productReportVO.setMemberId(4);
		int row = dao.update(productReportVO);
		assertNotEquals(row, 0);
	}
//	
	@Test
	public void testSelectById() {
		DualKey<Integer, Integer> id = new DualKey<>(1, 1);
		ProductReportVO productReportVO = dao.selectById(id);
		assertNotNull(productReportVO);
	}
//
//	@Test
//	public void testSelectAll() {
//		List<ProductReportVO> vos = dao.selectAll();
//		assertTrue(vos.size() > 0);
//	}
//	@Test
//	public void testgetonebyid( ) {
//		ProductReportVO VO = dao.getOneById(2);				
//		assertNotNull(VO);
//	}
	
	@Test
	public void testchangestatus() {
		ProductReportVO productReportVO = new ProductReportVO();

		productReportVO.setStatus(2);
		productReportVO.setProductId(1);
		productReportVO.setMemberId(2);
		int row = dao.changeStatus(productReportVO);
		assertNotEquals(row, 0);
	}
	
	
}
