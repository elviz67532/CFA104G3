package com.faq.model;



import java.util.*;


public class FaqServiceImpl implements FaqService {

	private FaqDAO dao;

	public FaqServiceImpl() {
		dao = new FaqDAOJDBCImpl();
	}

	@Override
	public FaqVO addFaq(Integer id, String question, String answer) {

		FaqVO vo = new FaqVO();

		vo.setId(id);
		vo.setQuestion(question);
		vo.setAnswer(answer);

		int row = dao.insert(vo);

		System.out.println("FAQ " + row);

		return vo;
	}

	@Override
	public FaqVO updateFaq(Integer id, String question, String answer) {

		FaqVO vo = new FaqVO();

		vo.setId(id);
		vo.setQuestion(question);
		vo.setAnswer(answer);

		dao.update(vo);
		System.out.println("更新完成");
		return vo;
	}

	@Override
	public void deleteFaq(Integer id) {
		int row = dao.deleteById(id);
		System.out.println("FAQ " + row);
	}

	@Override
	public FaqVO getOneFaq(Integer id) {
		return dao.selectById(id);
	}

	@Override
	public List<FaqVO> getAll() {
		return dao.selectAll();
	}
}
