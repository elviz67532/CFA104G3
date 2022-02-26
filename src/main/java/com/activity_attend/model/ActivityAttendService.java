package com.activity_attend.model;

import java.util.List;

import core.DualKey;

public interface ActivityAttendService {

	List<ActivityAttendVO> getAll();

	ActivityAttendVO getOneActa(Integer memberId, Integer activityId);

	ActivityAttendVO updateActa(Integer memberId, Integer activityId, String comment, String note, Integer status);

	ActivityAttendVO addActa(Integer memberId, Integer activityId, String comment, String note, Integer status);

	List<ActivityAttendVO> selectByMemberId(Integer memberId);
}
