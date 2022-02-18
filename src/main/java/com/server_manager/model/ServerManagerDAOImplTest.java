package com.server_manager.model;

import static org.junit.jupiter.api.Assertions.*;

import java.util.List;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

class ServerManagerDAOImplTest {

	ServerManagerDAOJDBCImpl dao = null;
	@BeforeEach
	public void before() {
		dao = new ServerManagerDAOJDBCImpl();
	}


	@Test
	@DisplayName("insert")
	public void insert() {
		ServerManagerVO serverManagerVO = new ServerManagerVO();
//		private Integer smgrId=;
		String smgrEmail="test@test.com";
		String smgrAccount="test";
		String smgrPassword="123456";
		String smgrName="test";
		String smgrPhone="12316546";
		Integer smgrGender=0;
		String smgrAddress="test";
		
		serverManagerVO.setSmgrAccount(smgrAccount);
		serverManagerVO.setSmgrAddress(smgrAddress);
		serverManagerVO.setSmgrEmail(smgrEmail);
		serverManagerVO.setSmgrGender(smgrGender);
//		serverManagerVO.setSmgrId();
		serverManagerVO.setSmgrName(smgrName);
		serverManagerVO.setSmgrPassword(smgrPassword);
		serverManagerVO.setSmgrPhone(smgrPhone);
		int row = dao.insert(serverManagerVO);
		assertNotEquals(row, 0);
	}
	
	@Test
	@DisplayName("update")
	public void update() {
		ServerManagerVO serverManagerVO = new ServerManagerVO();
		Integer smgrId=1;
		String smgrEmail="update@update.com";
		String smgrAccount="update";
		String smgrPassword="123456";
		String smgrName="update";
		String smgrPhone="12316546";
		Integer smgrGender=0;
		String smgrAddress="update";
		
		serverManagerVO.setSmgrAccount(smgrAccount);
		serverManagerVO.setSmgrAddress(smgrAddress);
		serverManagerVO.setSmgrEmail(smgrEmail);
		serverManagerVO.setSmgrGender(smgrGender);
		serverManagerVO.setSmgrId(smgrId);
		serverManagerVO.setSmgrName(smgrName);
		serverManagerVO.setSmgrPassword(smgrPassword);
		serverManagerVO.setSmgrPhone(smgrPhone);

//		System.out.println(dao.findByPrimaryKey(smgrId));
		int row = dao.update(serverManagerVO);
//		System.out.println(dao.findByPrimaryKey(smgrId));
		assertEquals(smgrAccount, dao.selectById(smgrId).getSmgrAccount());
	}
	
	@Test
	@DisplayName("delete")
	public void delete() {
		Integer smgrId = 5;
		int row = dao.deleteById(smgrId);
		System.out.println(dao.selectById(smgrId));
		assertEquals(dao.selectById(smgrId), null);
	}
	
	@Test
	@DisplayName("findByPrimaryKey")
	public void findByPrimaryKey() {
		Integer smgrId = 1;
		ServerManagerVO serverManagerVO = dao.selectById(smgrId);
		System.out.println(serverManagerVO.getSmgrName());
		assertNotEquals(serverManagerVO, null);
	}
	
	@Test
	@DisplayName("getAll")
	public void getAll() {
		List<ServerManagerVO> list = dao.selectAll();
//		for(ServerManagerVO vo : list) {
//			System.out.println(vo.getSmgrId());
//		}
		assertNotEquals(list, null);
	}
	
	@Test
	@DisplayName("findByAccount")
	public void findByAccount() {
		String account = "tomcat";
		String password = "tomcat";
		String ans = dao.findByAccount(password);
		System.out.println(ans);
		assertEquals(password, ans);
	}
	
	@Test
	@DisplayName("getId")
	public void getId() {
		String smgrAccount = "kG5kPUkc";
		int smgrId = 1;
		int id = dao.getId(smgrAccount);
		assertEquals(id,smgrId);
	}
}
