package com.activity.dao;

import static org.junit.jupiter.api.Assertions.assertNotEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.sql.Timestamp;
import java.util.List;

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import com.activity_question.model.ActivityQuestionDAO;
import com.activity_question.model.ActivityQuestionDAOJDBCImpl;
import com.activity_question.model.ActivityQuestionVO;

public class TestActivityQuestionDAO {
	private ActivityQuestionDAO dao;

	@BeforeEach
	public void before() {
		dao = new ActivityQuestionDAOJDBCImpl();
	}

	@AfterEach
	public void after() {
		dao = null;
	}

	@Test
	public void testInsert() {
		ActivityQuestionVO vo = new ActivityQuestionVO();

		vo.setActivityId(1006);
		vo.setMemberId(2);
		vo.setProblem("為甚麼?");
		vo.setReply("NULL");
		vo.setProblemDate(new Timestamp(System.currentTimeMillis()));
		vo.setReplyDate(Timestamp.valueOf("2022-01-13 12:00:00"));

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
		ActivityQuestionVO vo = new ActivityQuestionVO();

		vo.setId(1);
		vo.setActivityId(1007);
		vo.setMemberId(2);
		vo.setProblem("?");
		vo.setReply("");
		vo.setProblemDate(new Timestamp(System.currentTimeMillis()));
		vo.setReplyDate(Timestamp.valueOf("2022-01-23 12:00:00"));

		int row = dao.update(vo);
		assertNotEquals(row, 0);
	}

	@Test
	public void testSelectById() {
		ActivityQuestionVO vo = dao.selectById(1);
		assertNotNull(vo);
	}

	@Test
	public void testSelectAll() {
		List<ActivityQuestionVO> vos = dao.selectAll();
		assertTrue(vos.size() > 0);
	}
}
