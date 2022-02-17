package com.faq.model;

import java.util.List;

public interface FaqService {

	FaqVO updateFaq(Integer id, String question, String answer);

	void deleteFaq(Integer id);

	List<FaqVO> getAll();

	FaqVO getOneFaq(Integer id);

	FaqVO addFaq(Integer id, String question, String answer);

}
