package com.faq.model;

import java.util.*;

public class FaqServiceImpl implements FaqService {

	private FaqDAO dao;

	public FaqServiceImpl() {
		dao = new FaqDAOJDBCImpl();
	}

	@Override
	public FaqVO addFaq(String question, String answer) {

		FaqVO vo = new FaqVO();

		vo.setQuestion(question);
		vo.setAnswer(answer);

		dao.insert(vo);

		
		return vo;
	}

	@Override
	public FaqVO updateFaq(Integer id, String question, String answer) {

		FaqVO vo = new FaqVO();

		vo.setId(id);
		vo.setQuestion(question);
		vo.setAnswer(answer);

		dao.update(vo);

		System.out.println("商品訂單已修改");
		return vo;
	}

	@Override
	public void deleteFaq(Integer id) {
		dao.deleteById(id);
	}

	@Override
	public FaqVO getOneFaq(Integer id) {
		return dao.findByPrimaryKey(id);
	}

	@Override
	public List<FaqVO> getAll() {
		return dao.getAll();
	}
}
