package com.move.dao;

import static org.junit.jupiter.api.Assertions.assertNotEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.sql.Timestamp;
import java.util.List;

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import com.move_request.model.MoveRequestDAOJDBCImpl;
import com.move_request.model.MoveRequestDAO;
import com.move_request.model.MoveRequestVO;

public class TestMoveRequestDAO {
	private MoveRequestDAO dao;

	@BeforeEach
	public void before() {
		dao = new MoveRequestDAOJDBCImpl();
	}

	@AfterEach
	public void after() {
		dao = null;
	}

	@Test
	public void testInsert() {
		MoveRequestVO vo = new MoveRequestVO();

		vo.setMemberId(2);
		vo.setFromAddress("日本東京都");
		vo.setToAddress("美國洛杉磯");
		vo.setEvaluateDate(Timestamp.valueOf("2022-10-10 15:00:06"));
		vo.setEvaluateType(0);
		vo.setItems("罐頭");
		vo.setEvaluatePrice(100);
		vo.setMoveDate(Timestamp.valueOf("2022-10-12 15:00:06"));
		vo.setStatus(0);
		vo.setRequestDate(Timestamp.valueOf("2022-10-05 15:00:06"));
		vo.setHandled(false);

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
		MoveRequestVO vo = new MoveRequestVO();

		vo.setId(1);
		vo.setMemberId(1);
		vo.setFromAddress("日本東京都");
		vo.setToAddress("美國洛杉磯");
		vo.setEvaluateDate(Timestamp.valueOf("2022-05-16"));
		vo.setEvaluateType(0);
		vo.setItems("罐頭(鮪魚)");
		vo.setEvaluatePrice(100);
		vo.setMoveDate(Timestamp.valueOf("2022-10-12"));
		vo.setStatus(1);
		vo.setHandled(false);
		vo.setRequestDate(Timestamp.valueOf("2022-10-05 15:00:06"));

		int row = dao.update(vo);
		assertNotEquals(row, 0);
	}

	@Test
	public void testSelectById() {
		MoveRequestVO vo = dao.selectById(1);
		assertNotNull(vo);
	}

	@Test
	public void testSelectAll() {
		List<MoveRequestVO> vos = dao.selectAll();
		assertTrue(vos.size() > 0);
	}
}
