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

	@Test
	public void testInsert() {
		ProductReportVO productReportVO = new ProductReportVO();

		byte[] array12 = new byte[2];
		array12[0] = (byte) 0xd0;
		array12[1] = (byte) 0xea;

		productReportVO.setProductId(1);
		productReportVO.setMemberId(2);
		productReportVO.setContent("apexlegend111");
		productReportVO.setDate(new Timestamp(System.currentTimeMillis()));
		productReportVO.setPhoto(array12);
		productReportVO.setStatus(1);

		int row = dao.insert(productReportVO);
		assertNotEquals(row, 0);
	}

	@Test
	public void testDeleteById() {
		DualKey<Integer, Integer> id = new DualKey<>(1, 2);
		int row = dao.deleteById(id);
		assertNotEquals(row, 0);
	}
	
	@Test
	public void testUpdate() {
		ProductReportVO productReportVO = new ProductReportVO();

		byte[] array12 = new byte[2];
		array12[0] = (byte) 0xdd;
		array12[1] = (byte) 0xee;

		productReportVO.setProductId(1);
		productReportVO.setMemberId(2);
		productReportVO.setContent("apexlegend1113");
		productReportVO.setDate(new Timestamp(System.currentTimeMillis()));
		productReportVO.setPhoto(array12);
		productReportVO.setStatus(2);

		int row = dao.update(productReportVO);
		assertNotEquals(row, 0);
	}
	
	@Test
	public void testSelectById() {
		DualKey<Integer, Integer> id = new DualKey<>(1, 2);
		ProductReportVO productReportVO = dao.selectById(id);
		assertNotNull(productReportVO);
	}

	@Test
	public void testSelectAll() {
		List<ProductReportVO> vos = dao.selectAll();
		assertTrue(vos.size() > 0);
	}
}
