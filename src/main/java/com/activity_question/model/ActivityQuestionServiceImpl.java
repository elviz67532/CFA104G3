package com.activity_question.model;

import java.sql.Timestamp;
import java.util.List;

public class ActivityQuestionServiceImpl implements ActivityQuestionService{

	private ActivityQuestionDAO dao;

	public ActivityQuestionServiceImpl() {
		dao = new ActivityQuestionDAOJDBCImpl();
	}
	@Override
	public ActivityQuestionVO addQuestion(Integer activityId, Integer memberId, String problem, Timestamp problemDate) {
		ActivityQuestionVO vo = new ActivityQuestionVO();
		vo.setActivityId(activityId);
		vo.setMemberId(memberId);
		vo.setProblem(problem);
		vo.setProblemDate(problemDate);
		int id = dao.insert(vo);
		vo.setId(id);
		return vo;
	}

	@Override
	public ActivityQuestionVO addAnswer(Integer activityId, String reply, Timestamp replyDate) {
		ActivityQuestionVO vo = new ActivityQuestionVO();
		vo.setActivityId(activityId);
		vo.setReply(reply);
		vo.setReplyDate(replyDate);
		dao.update(vo);
		return vo;
	}

	@Override
	public void deleteImproper(Integer activityId) {
		dao.deleteById(activityId);
	}

	@Override
	public List<ActivityQuestionVO> findActAllQuestion(Integer activityId) {
		return dao.selectAllQuestionByAct(activityId);
	}

}
