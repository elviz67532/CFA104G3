package com.faq.dao;

import static org.junit.jupiter.api.Assertions.assertNotEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.util.List;

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import com.faq.model.FaqDAO;
import com.faq.model.FaqDAOJDBCImpl;
import com.faq.model.FaqVO;

public class TestFaqDAO {
	private FaqDAO dao;

	@BeforeEach
	public void before() {
		dao = new FaqDAOJDBCImpl();
	}

	@AfterEach
	public void after() {
		dao = null;
	}

	@Test
	public void testInsert() {
		FaqVO pojo = new FaqVO();

		pojo.setQuestion("如何註冊會員?");
		pojo.setAnswer("點選畫面右上角頭像進行註冊");

		int row = dao.insert(pojo);
		assertNotEquals(row, 0);
	}

	@Test
	public void testDeleteById() {
		int row = dao.deleteById(1);
		assertNotEquals(row, 0);
	}

	@Test
	public void testUpdate() {
		FaqVO pojo = new FaqVO();

		pojo.setId(1);
		pojo.setQuestion("如何登入會員?");
		pojo.setAnswer("點選畫面右上角頭像登入");

		int row = dao.update(pojo);
		assertNotEquals(row, 0);
	}

	@Test
	public void testSelectById() {
		FaqVO vo = dao.selectById(1);
		assertNotNull(vo);
	}

	@Test
	public void testSelectAll() {
		List<FaqVO> vos = dao.selectAll();
		assertTrue(vos.size() > 0);
	}
}
