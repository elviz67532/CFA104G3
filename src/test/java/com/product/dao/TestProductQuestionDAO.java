package com.product.dao;

import static org.junit.jupiter.api.Assertions.assertNotEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.sql.Timestamp;
import java.util.List;

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import com.product_question.model.ProductQuestionDAO;
import com.product_question.model.ProductQuestionDAOJDBCImpl;
import com.product_question.model.ProductQuestionVO;

public class TestProductQuestionDAO {

	private ProductQuestionDAO dao;

	@BeforeEach
	public void before() {
		dao = new ProductQuestionDAOJDBCImpl();
	}

	@AfterEach
	public void after() {
		dao = null;
	}
	
//
//	@Test
//	public void testSelectById() {
//		ProductQuestionVO vo = dao.selectById(4);
//		assertNotNull(vo);
//	}
//
//	@Test
//	public void testSelectAll() {
//		List<ProductQuestionVO> vos = dao.selectAll();
//		assertTrue(vos.size() > 0);
//	}
//	
//	@Test
//	public void testSelectByMemberId() {
//		ProductQuestionVO vo = dao.selectByMemberId(1);
//		assertNotNull(vo);
//	}
//	
//	@Test
//	public void testInsert() {
//		ProductQuestionVO vo = new ProductQuestionVO();
//
//		
//		vo.setMemberId(1);
//		vo.setProductId(3);
//		vo.setProblem("有現貨嗎");
//		vo.setReply("有喔");
//		vo.setProblemDate(Timestamp.valueOf("2021-03-05 00:00:00"));
//		vo.setReplyDate(Timestamp.valueOf("2021-03-05 00:00:00"));
//
//		int row = dao.insert(vo);
//		assertNotEquals(row, 0);
//	}

//	@Test
//	public void testDeleteById() {
//		int row = dao.deleteById(1);
//		assertNotEquals(row, 0);
//	}

	@Test
	public void testUpdate() {
		ProductQuestionVO vo = new ProductQuestionVO();

				
		vo.setReply("有喔!");		
		vo.setReplyDate(Timestamp.valueOf("2021-03-05 00:00:11"));
		vo.setId(3);
		
		int row = dao.update(vo);
		assertNotEquals(row, 0);
	}

}
