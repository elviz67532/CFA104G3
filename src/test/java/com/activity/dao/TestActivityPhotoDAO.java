package com.activity.dao;

import static org.junit.jupiter.api.Assertions.assertNotEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.util.List;

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import com.activity_photo.model.ActivityPhotoDAO;
import com.activity_photo.model.ActivityPhotoDAOJDBCImpl;
import com.activity_photo.model.ActivityPhotoVO;

public class TestActivityPhotoDAO {
	private ActivityPhotoDAO dao;

	@BeforeEach
	public void before() {
		dao = new ActivityPhotoDAOJDBCImpl();
	}

	@AfterEach
	public void after() {
		dao = null;
	}

	@Test
	public void testInsert() {
		ActivityPhotoVO pojo = new ActivityPhotoVO();

		byte[] data = new byte[1];
		data[0] = 0x05;
		pojo.setActivityId(1);
		pojo.setPhoto(data);

		int row = dao.insert(pojo);
		assertNotEquals(row, 0);
	}

	@Test
	public void testDeleteById() {
		int row = dao.deleteById(1);
		assertNotEquals(row, 0);
	}

	@Test
	public void testUpdate() {
		ActivityPhotoVO pojo = new ActivityPhotoVO();

		byte[] data = new byte[1];
		data[0] = 0x06;
		pojo.setId(1);
		pojo.setActivityId(1);
		pojo.setPhoto(data);

		int row = dao.update(pojo);
		assertNotEquals(row, 0);
	}

	@Test
	public void testSelectById() {
		ActivityPhotoVO vo = dao.selectById(1);
		assertNotNull(vo);
	}

	@Test
	public void testSelectAll() {
		List<ActivityPhotoVO> vos = dao.selectAll();
		assertTrue(vos.size() > 0);
	}
}
