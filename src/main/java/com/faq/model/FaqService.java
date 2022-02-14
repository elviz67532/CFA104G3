package com.faq.model;

import java.util.List;

public interface FaqService {

	FaqVO addFaq(String question, String answer);

	FaqVO updateFaq(Integer id, String question, String answer);

	void deleteFaq(Integer id);

	List<FaqVO> getAll();

	FaqVO getOneFaq(Integer id);

}
