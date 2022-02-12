package com.faq.model;

public class FaqServiceImpl implements FaqService {

	private FaqDAO dao;

	public FaqServiceImpl() {
		dao = new FaqDAOJDBCImpl();
	}

	public FaqVO addFaq(String question, String answer) {

		FaqVO faqVO = new FaqVO();

		faqVO.setQuestion(question);
		faqVO.setAnswer(answer);

		dao.insert(faqVO);

		return faqVO;
	}

	public FaqVO updateFaq(Integer id, String question, String answer) {

		FaqVO faqVO = new FaqVO();

		faqVO.setId(id);
		faqVO.setQuestion(question);
		faqVO.setAnswer(answer);

		dao.update(faqVO);

		return faqVO;
	}

	public void deleteFaq(Integer id) {
		dao.deleteById(id);
	}

	public FaqVO getOneFaq(Integer id) {
		return dao.findByPrimaryKey(id);
	}

	public List<FaqVO> getAll() {
		return dao.getAll();
	}
}
