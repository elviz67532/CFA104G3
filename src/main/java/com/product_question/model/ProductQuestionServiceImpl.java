package com.product_question.model;

import java.sql.Timestamp;
import java.util.List;

public class ProductQuestionServiceImpl implements ProductQuestionService {

	private ProductQuestionDAO dao;

	public ProductQuestionServiceImpl() {
		dao = new ProductQuestionDAOJDBCImpl();
	}

	@Override
	public ProductQuestionVO insert(Integer PRODQ_ID, Integer PRODQ_MEM_ID, Integer PRODQ_PROD_ID,
			String PRODQ_PROMCONTENT, String PRODQ_REPCONTENT, Timestamp PRODQ_PROMDATE, Timestamp PRODQ_REPDATE) {

		ProductQuestionVO productQuestionVO = new ProductQuestionVO();

		productQuestionVO.setId(PRODQ_ID);
		productQuestionVO.setMemberId(PRODQ_MEM_ID);
		productQuestionVO.setProductId(PRODQ_PROD_ID);
		productQuestionVO.setProblem(PRODQ_PROMCONTENT);
		productQuestionVO.setReply(PRODQ_REPCONTENT);
		productQuestionVO.setProblemDate(PRODQ_PROMDATE);
		productQuestionVO.setReplyDate(PRODQ_REPDATE);
		dao.insert(productQuestionVO);

		return productQuestionVO;

	}

	@Override
	public ProductQuestionVO update(Integer PRODQ_ID, Integer PRODQ_MEM_ID, Integer PRODQ_PROD_ID,
			String PRODQ_PROMCONTENT, String PRODQ_REPCONTENT, Timestamp PRODQ_PROMDATE, Timestamp PRODQ_REPDATE) {

		ProductQuestionVO productQuestionVO = new ProductQuestionVO();

		productQuestionVO.setId(PRODQ_ID);
		productQuestionVO.setMemberId(PRODQ_MEM_ID);
		productQuestionVO.setProductId(PRODQ_PROD_ID);
		productQuestionVO.setProblem(PRODQ_PROMCONTENT);
		productQuestionVO.setReply(PRODQ_REPCONTENT);
		productQuestionVO.setProblemDate(PRODQ_PROMDATE);
		productQuestionVO.setReplyDate(PRODQ_REPDATE);
		dao.update(productQuestionVO);

		return productQuestionVO;

	}

	@Override
	public void deleteById(Integer id) {
		dao.deleteById(id);
	}

	@Override
	public ProductQuestionVO selectById(Integer id) {
		return dao.selectById(id);
	}

	@Override
	public List<ProductQuestionVO> selectAll() {
		return dao.selectAll();
	}
}
