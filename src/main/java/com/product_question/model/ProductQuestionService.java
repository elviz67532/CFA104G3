package com.product_question.model;

import java.sql.Timestamp;
import java.util.List;

public interface ProductQuestionService {

	ProductQuestionVO insert(Integer PRODQ_MEM_ID, Integer PRODQ_PROD_ID, String PRODQ_PROMCONTENT,
			String PRODQ_REPCONTENT, Timestamp PRODQ_PROMDATE, Timestamp PRODQ_REPDATE);

	ProductQuestionVO update(Integer PRODQ_ID, Integer PRODQ_MEM_ID, Integer PRODQ_PROD_ID, String PRODQ_PROMCONTENT,
			String PRODQ_REPCONTENT, Timestamp PRODQ_PROMDATE, Timestamp PRODQ_REPDATE);

	void deleteById(Integer id);

	ProductQuestionVO selectById(Integer id);

	List<ProductQuestionVO> selectAll();
	
	ProductQuestionVO selectByMemberId(Integer memberId);
}
