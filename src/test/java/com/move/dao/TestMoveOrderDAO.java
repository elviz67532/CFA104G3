package com.move.dao;

import static org.junit.jupiter.api.Assertions.assertNotEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.sql.Timestamp;
import java.util.List;

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import com.move_order.model.MoveOrderDAOJDBCImpl;
import com.move_order.model.MoveOrderDAO;
import com.move_order.model.MoveOrderVO;

public class TestMoveOrderDAO {
	private MoveOrderDAO dao;

	@BeforeEach
	public void before() {
		dao = new MoveOrderDAOJDBCImpl();
	}

	@AfterEach
	public void after() {
		dao = null;
	}

	@Test
	public void testInsert() {
		MoveOrderVO vo = new MoveOrderVO();

		vo.setMemberId(5);
		vo.setCustomer("阿扁");
		vo.setPhone("0900-888-777");
		vo.setFromAddress("台南市安平古堡");
		vo.setToAddress("台南市府城首學");
		vo.setMoveDate(Timestamp.valueOf("2022-04-05 18:00:00"));
		vo.setAmountFirst(38325288);
		vo.setDeposit(500235);
		vo.setAmountTotal(38823538);
		vo.setComment("留言1");
		vo.setOrderDate(Timestamp.valueOf("2022-04-27 13:00:00"));
		vo.setStatus(1);

		int row = dao.insert(vo);
		assertNotEquals(row, 0);
	}

	@Test
	public void testDelete() {
		int row = dao.deleteById(1);
		assertNotEquals(row, 0);
	}

	@Test
	public void testUpdate() {
		MoveOrderVO vo = new MoveOrderVO();

		vo.setId(2);
		vo.setMemberId(5);
		vo.setCustomer("陳水扁");
		vo.setPhone("0900-888-666");
		vo.setFromAddress("台南市某某銀行");
		vo.setToAddress("瑞士某某銀行");
		vo.setMoveDate(Timestamp.valueOf("2022-04-05 18:00:00"));
		vo.setAmountFirst(38325288);
		vo.setDeposit(500235);
		vo.setAmountTotal(38823538);
		vo.setComment("留言2");
		vo.setOrderDate(Timestamp.valueOf("2022-04-27 13:00:00"));
		vo.setStatus(1);
		
		int row = dao.update(vo);
		assertNotEquals(0, row);
	}

	@Test
	public void testSelectById() {
		MoveOrderVO vo = dao.selectById(1);
		assertNotNull(vo);
	}

	@Test
	public void testSelectAll() {
		List<MoveOrderVO> vos = dao.selectAll();
		assertTrue(vos.size() > 0);
	}
}
