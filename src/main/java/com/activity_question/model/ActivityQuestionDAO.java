package com.activity_question.model;

import java.util.List;

import core.dao.CoreDao;

public interface ActivityQuestionDAO extends CoreDao<ActivityQuestionVO, Integer>  {
	List<ActivityQuestionVO> selectAllQuestionByAct(Integer activityId);

}
