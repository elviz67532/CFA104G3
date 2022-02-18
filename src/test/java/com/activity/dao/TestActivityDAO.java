package com.activity.dao;

import static org.junit.jupiter.api.Assertions.assertNotEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.sql.Timestamp;
import java.util.List;

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import com.activity.model.ActivityDAO;
import com.activity.model.ActivityDAOJDBCImpl;
import com.activity.model.ActivityVO;
import com.move_order.model.MoveOrderVO;

public class TestActivityDAO {
	private ActivityDAO dao;

//	@BeforeEach
//	public void before() {
//		dao = new ActivityDAOJDBCImpl();
//	}
//
//	@AfterEach
//	public void after() {
//		dao = null;
//	}
//
//	@Test
//	public void testInsert() {
//		ActivityVO vo = new ActivityVO();
//
//		vo.setOrganizerMemberId(3);
//		vo.setType(2);
//		vo.setName("efkeqfn");
//		vo.setContent("efkeqfn");
//		vo.setLaunchedDate(new Timestamp(System.currentTimeMillis()));
//		vo.setApplyStartDate(Timestamp.valueOf("2022-01-13 12:00:00"));
//		vo.setApplyEndDate(Timestamp.valueOf("2022-01-14 18:00:00"));
//		vo.setLocation("嘉義");
//		vo.setCost(200);
//		vo.setApplyMemberExisting(0);
//		vo.setMaxMember(30);
//		vo.setMinMember(0);
//		vo.setStartDate(Timestamp.valueOf("2022-01-15 06:00:00"));
//		vo.setEndDate(Timestamp.valueOf("2022-01-15 18:00:00"));
//		vo.setStatus(0);
//
//		int row = dao.insert(vo);
//		assertNotEquals(row, 0);
//	}
//
//	@Test
//	public void testDeleteById() {
//		int row = dao.deleteById(1);
//		assertNotEquals(row, 0);
//	}

	@Test
	public void testUpdate() {
		ActivityVO vo = new ActivityVO();
//		vo.setOrganizerMemberId(4);
//		vo.setApplyStartDate(Timestamp.valueOf("2022-01-13 12:00:00"));
//		vo.setStatus(0);
		
		vo.setActivityId(276);
		vo.setType(4);
		vo.setName("234235235rjgwet23tg42b4");
		vo.setContent("gewgewegwegw");
		vo.setLaunchedDate(new Timestamp(System.currentTimeMillis()));
		vo.setApplyEndDate(Timestamp.valueOf("2022-01-04 18:00:00"));
		vo.setLocation("中壢");
		vo.setCost(210);
		vo.setApplyMemberExisting(0);
		vo.setMaxMember(35);
		vo.setMinMember(0);
		vo.setStartDate(Timestamp.valueOf("2023-01-15 12:00:00"));
		vo.setEndDate(Timestamp.valueOf("2022-01-17 18:00:00"));

		int row = dao.update(vo);
		assertNotEquals(row, 0);
	}

//	@Test
//	public void testSelectById() {
//		ActivityVO vo = dao.selectById(1);
//		assertNotNull(vo);
//	}
//
//	@Test
//	public void testSelectAll() {
//		List<ActivityVO> vos = dao.selectAll();
//		assertTrue(vos.size() > 0);
//	}
}
