package com.activity.dao;

import static org.junit.jupiter.api.Assertions.assertNotEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.util.List;

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import com.activity_report.model.ActivityReportDAOJDBCImpl;
import com.activity_report.model.ActivityReportDao;
import com.activity_report.model.ActivityReportVO;

public class TestActivityReportDAO {
	private ActivityReportDao dao;

	@BeforeEach
	public void before() {
		dao = new ActivityReportDAOJDBCImpl();
	}

	@AfterEach
	public void after() {
		dao = null;
	}

	@Test
	public void testInsert() {
		ActivityReportVO vo = new ActivityReportVO();

		byte[] data = new byte[1];
		data[0] = 0x06;
		vo.setActivityId(1004);
		vo.setMemberId(2);
		vo.setContent("摸摸喔摸");
		vo.setStatus(1);
		vo.setPhoto(data);

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
		ActivityReportVO vo = new ActivityReportVO();

		byte[] data = new byte[1];
		data[0] = 0x05;
		vo.setId(1);
		vo.setActivityId(1002);
		vo.setMemberId(3);
		vo.setContent("摸摸喔摸1");
		vo.setStatus(0);
		vo.setPhoto(data);

		int row = dao.update(vo);
		assertNotEquals(row, 0);
	}

	@Test
	public void testSelectById() {
		ActivityReportVO vo = dao.selectById(1);
		assertNotNull(vo);
	}

	@Test
	public void testSelectAll() {
		List<ActivityReportVO> vos = dao.selectAll();
		assertTrue(vos.size() > 0);
	}
}
