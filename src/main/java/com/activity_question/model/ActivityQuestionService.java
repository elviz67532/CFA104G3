package com.activity_question.model;

import java.sql.Timestamp;
import java.util.List;

public interface ActivityQuestionService {

	//新增問題
	public ActivityQuestionVO addQuestion(Integer activityId, Integer memberId, String problem, Timestamp problemDate);

	//回覆
	public ActivityQuestionVO addAnswer(Integer id, String reply, Timestamp replyDate);

	// 後台巡邏可刪不當留言
	public void deleteImproper(Integer activityId);

	//查詢該活動全部問題
	public List<ActivityQuestionVO> findActAllQuestion(Integer activityId);
}
