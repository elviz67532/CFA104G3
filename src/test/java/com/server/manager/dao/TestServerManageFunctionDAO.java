package com.server.manager.dao;

import static org.junit.jupiter.api.Assertions.assertNotEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.util.List;

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import com.server_manager_function.model.ServerManageFunctionDAO;
import com.server_manager_function.model.ServerManageFunctionDAOJDBCImpl;
import com.server_manager_function.model.ServerManageFunctionVO;

public class TestServerManageFunctionDAO {
	private ServerManageFunctionDAO dao = null;

	@BeforeEach
	public void before() {
		dao = new ServerManageFunctionDAOJDBCImpl();
	}

	@AfterEach
	public void after() {
		dao = null;
	}

	@Test
	public void insert() {
		ServerManageFunctionVO vo = new ServerManageFunctionVO();
		vo.setSmgeFunc("會員管理");
		vo.setSmgeFuncId(10);

		int row = dao.insert(vo);
		assertNotEquals(row, 0);
	}

	@Test
	public void update() {
		ServerManageFunctionVO vo = new ServerManageFunctionVO();
		vo.setSmgeFunc("會員管理3");
		vo.setSmgeFuncId(10);

		int row = dao.update(vo);
		assertNotEquals(row, 0);
	}

	@Test
	public void testDeleteById() {
		int row = dao.deleteById(10);
		assertNotEquals(row, 0);
	}

	@Test
	public void testSelectById() {
		ServerManageFunctionVO vo = dao.selectById(10);
		assertNotNull(vo);
	}

	@Test
	public void testSelectAll() {
		List<ServerManageFunctionVO> vos = dao.selectAll();
		assertTrue(vos.size() > 0);
	}
}
