package com.product_question.model;

import java.sql.Timestamp;
import java.util.List;

public class ProductQuestionServiceImpl implements ProductQuestionService {

	private ProductQuestionDAO dao;

	public ProductQuestionServiceImpl() {
		dao = new ProductQuestionDAOJDBCImpl();
	}
//12134567890
	@Override
	public ProductQuestionVO insert(Integer memberId, Integer productId,
			String problem, String reply, Timestamp problemDate, Timestamp replyDate) {

		ProductQuestionVO vo = new ProductQuestionVO();

		
		vo.setMemberId(memberId);
		vo.setProductId(productId);
		vo.setProblem(problem);
		vo.setReply(reply);
		vo.setProblemDate(problemDate);
		vo.setReplyDate(replyDate);
		dao.insert(vo);

		return vo;

	}

	@Override
	public ProductQuestionVO update(Integer id, Integer memberId, Integer productId,
			String problem, String reply, Timestamp problemDate, Timestamp replyDate) {

		ProductQuestionVO vo = new ProductQuestionVO();

		vo.setId(id);
		vo.setMemberId(memberId);
		vo.setProductId(productId);
		vo.setProblem(problem);
		vo.setReply(reply);
		vo.setProblemDate(problemDate);
		vo.setReplyDate(replyDate);
		dao.update(vo);

		return vo;

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
	
	@Override
	public ProductQuestionVO selectByMemberId(Integer memberId) {
		return dao.selectByMemberId(memberId);
	}
}
