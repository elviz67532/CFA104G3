package com.activity.model;

import java.util.List;

import core.dao.CoreDao;

public interface ActivityDAO extends CoreDao<ActivityVO, Integer> {
	List<ActivityVO> selectAllDesc();
	List<ActivityVO> selectAllByType(Integer type);
	int updateStatus(ActivityVO vo);
	List<ActivityVO> selectByMemId(Integer organizerMemberId);

	int addAttend(Integer activityId);
	int minusAttend(Integer activityId);

}
