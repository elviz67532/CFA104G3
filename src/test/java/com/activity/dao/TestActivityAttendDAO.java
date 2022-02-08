package com.activity.dao;

import static org.junit.jupiter.api.Assertions.assertNotEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.util.List;

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import com.activity_attend.model.ActivityAttendDAO;
import com.activity_attend.model.ActivityAttendDAOJDBCImpl;
import com.activity_attend.model.ActivityAttendVO;

import core.DualKey;

public class TestActivityAttendDAO {
	private ActivityAttendDAO dao;

	@BeforeEach
	public void before() {
		dao = new ActivityAttendDAOJDBCImpl();
	}

	@AfterEach
	public void after() {
		dao = null;
	}

	@Test
	public void testInsert() {
		ActivityAttendVO vo = new ActivityAttendVO();

		vo.setMemberId(1);
		vo.setActivityId(1003);
		vo.setComment("wegmkpweg");
		vo.setNote("efkeqfn");
		vo.setStatus(0);

		int row = dao.insert(vo);
		assertNotEquals(row, 0);
	}

	@Test
	public void testDelete() {
		DualKey<Integer, Integer> id = new DualKey<>(3, 1004);
		int row = dao.deleteById(id);
		assertNotEquals(row, 0);
	}

	@Test
	public void testUpdate() {
		ActivityAttendVO vo = new ActivityAttendVO();

		vo.setMemberId(1);
		vo.setActivityId(1003);
		vo.setComment("geknnge");
		vo.setNote("qepgnqe");
		vo.setStatus(1);

		int row = dao.update(vo);
		assertNotEquals(row, 0);
	}

	@Test
	public void testSelectById() {
		DualKey<Integer, Integer> id = new DualKey<>(1, 1003);
		ActivityAttendVO vo = dao.selectById(id);
		assertNotNull(vo);
	}

	@Test
	public void testSelectAll() {
		List<ActivityAttendVO> vos = dao.selectAll();
		assertTrue(vos.size() > 0);
	}
}
