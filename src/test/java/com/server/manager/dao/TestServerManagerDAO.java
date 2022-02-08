package com.server.manager.dao;

import static org.junit.jupiter.api.Assertions.assertNotEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.util.List;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import com.server_manager.model.ServerManagerDAO;
import com.server_manager.model.ServerManagerDAOJDBCImpl;
import com.server_manager.model.ServerManagerVO;

public class TestServerManagerDAO {

	ServerManagerDAO dao = null;

	@BeforeEach
	public void before() {
		dao = new ServerManagerDAOJDBCImpl();
	}

	@Test
	public void insert() {
		ServerManagerVO serverManagerVO = new ServerManagerVO();

		serverManagerVO.setSmgrId(1);
		serverManagerVO.setSmgrAccount("test");
		serverManagerVO.setSmgrAddress("test");
		serverManagerVO.setSmgrEmail("test@test.com");
		serverManagerVO.setSmgrGender(0);
		serverManagerVO.setSmgrName("test");
		serverManagerVO.setSmgrPassword("123456");
		serverManagerVO.setSmgrPhone("12316546");
		int row = dao.insert(serverManagerVO);
		assertNotEquals(row, 0);
	}

	@Test
	public void update() {
		ServerManagerVO serverManagerVO = new ServerManagerVO();

		serverManagerVO.setSmgrId(1);
		serverManagerVO.setSmgrAccount("test2");
		serverManagerVO.setSmgrAddress("test2");
		serverManagerVO.setSmgrEmail("test2@test.com");
		serverManagerVO.setSmgrGender(1);
		serverManagerVO.setSmgrName("test2");
		serverManagerVO.setSmgrPassword("1234567");
		serverManagerVO.setSmgrPhone("123165467");

		int row = dao.update(serverManagerVO);
		assertNotEquals(row, 0);
	}

	@Test
	public void delete() {
		int row = dao.deleteById(1);
		assertNotEquals(row, 0);
	}

	@Test
	public void findByPrimaryKey() {
		ServerManagerVO serverManagerVO = dao.selectById(2);
		assertNotEquals(serverManagerVO, null);
	}

	@Test
	public void testSelectAll() {
		List<ServerManagerVO> vos = dao.selectAll();
		assertTrue(vos.size() > 0);
	}
}
