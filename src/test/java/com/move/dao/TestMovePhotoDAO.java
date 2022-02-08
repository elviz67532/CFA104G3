package com.move.dao;

import static org.junit.jupiter.api.Assertions.assertNotEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.util.List;

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import com.move_photo.model.MovePhotoDAOJDBCImpl;
import com.move_photo.model.MovePhotoDAO;
import com.move_photo.model.MovePhotoVO;

public class TestMovePhotoDAO {
	private MovePhotoDAO dao;

	@BeforeEach
	public void before() {
		dao = new MovePhotoDAOJDBCImpl();
	}

	@AfterEach
	public void after() {
		dao = null;
	}

	@Test
	public void testInsert() {
		MovePhotoVO vo = new MovePhotoVO();

		byte[] data = new byte[1];
		data[0] = 0x03;
		vo.setMoveRequestId(1);
		vo.setPhoto(data);

		int row = dao.insert(vo);
		assertNotEquals(row, 0);
	}

	@Test
	public void testUpdate() {
		MovePhotoVO vo = new MovePhotoVO();

		byte[] data = new byte[1];
		data[0] = 0x06;
		vo.setId(1);
		vo.setMoveRequestId(1);
		vo.setPhoto(data);

		int row = dao.update(vo);
		assertNotEquals(row, 0);
	}

	@Test
	public void testDeleteById() {
		int row = dao.deleteById(1);
		assertNotEquals(row, 0);
	}

	@Test
	public void testSelectById() {
		MovePhotoVO vo = dao.selectById(1);
		assertNotNull(vo);
	}

	@Test
	public void testSelectAll() {
		List<MovePhotoVO> list = dao.selectAll();
		assertTrue(list.size() > 0);
	}
}
