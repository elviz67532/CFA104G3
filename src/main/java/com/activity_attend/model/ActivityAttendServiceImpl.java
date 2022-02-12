package com.activity_attend.model;

import java.util.List;

import core.DualKey;

public class ActivityAttendServiceImpl implements ActivityAttendService {

	private ActivityAttendDAO dao;

	public ActivityAttendServiceImpl() {
		dao = new ActivityAttendDAOJDBCImpl();
	}

	@Override
	public ActivityAttendVO addActa(Integer memberId, Integer activityId, String comment, String note, Integer status) {

		ActivityAttendVO actaVO = new ActivityAttendVO();

		actaVO.setMemberId(memberId);
		actaVO.setActivityId(activityId);
		actaVO.setComment(comment);
		actaVO.setNote(note);
		actaVO.setStatus(status);
		dao.insert(actaVO);

		return actaVO;
	}

	@Override
	public ActivityAttendVO updateActa(Integer memberId, Integer activityId, String comment, String note,
			Integer status) {
		ActivityAttendVO actaVO = new ActivityAttendVO();

		actaVO.setMemberId(memberId);
		actaVO.setActivityId(activityId);
		actaVO.setComment(comment);
		actaVO.setNote(note);
		actaVO.setStatus(status);
		dao.update(actaVO);

		return actaVO;

	}

	@Override
	public ActivityAttendVO getOneActa(DualKey<Integer, Integer> id) {
		return dao.selectById(id);
	}

	@Override
	public List<ActivityAttendVO> getAll() {    //test
		return dao.selectAll();
	}
}
