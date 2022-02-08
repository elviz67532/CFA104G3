package com.product.dao;

import static org.junit.jupiter.api.Assertions.assertNotEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.util.List;

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import com.product_photo.model.ProductPhotoDAO;
import com.product_photo.model.ProductPhotoDAOJDBCImpl;
import com.product_photo.model.ProductPhotoVO;

public class TestProductPhotoDAO {
	private ProductPhotoDAO dao;

	@BeforeEach
	public void before() {
		dao = new ProductPhotoDAOJDBCImpl();
	}

	@AfterEach
	public void after() {
		dao = null;
	}

	@Test
	public void testInsert() {
		ProductPhotoVO productPhotoVO = new ProductPhotoVO();

		byte[] array = new byte[2];
		array[0] = (byte) 0xd0;
		array[1] = (byte) 0xea;

		productPhotoVO.setProductId(2);
		productPhotoVO.setPhoto(array);

		int row = dao.insert(productPhotoVO);
		assertNotEquals(row, 0);
	}

	@Test
	public void testUpdate() {
		ProductPhotoVO productPhotoVO = new ProductPhotoVO();

		byte[] array1 = new byte[2];
		array1[0] = (byte) 0x69;
		array1[1] = (byte) 0x3a;

		productPhotoVO.setId(1);
		productPhotoVO.setPhoto(array1);

		int row = dao.update(productPhotoVO);
		assertNotEquals(row, 0);
	}

	@Test
	public void testDeleteById() {
		int row = dao.deleteById(1);
		assertNotEquals(row, 0);
	}

	@Test
	public void testSelectById() {
		ProductPhotoVO productPhotoVO = dao.selectById(1);
		assertNotNull(productPhotoVO);
	}

	@Test
	public void testSelectAll() {
		List<ProductPhotoVO> list = dao.selectAll();
		assertTrue(list.size() > 0);
	}
}
