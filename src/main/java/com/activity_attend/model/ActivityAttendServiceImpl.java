package com.activity_attend.model;

import java.util.List;

import com.activity.model.ActivityVO;

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
	public ActivityAttendVO getOneActa(Integer memberId, Integer activityId) {
		
		
		DualKey<Integer, Integer> id = new DualKey<Integer, Integer>(memberId, activityId);
//		DualKey<Integer, Integer> a = new DualKey<Integer, Integer>(null, null);
//		getOneActa(a);			
		return dao.selectById(id);
	}

	@Override
	public List<ActivityAttendVO> getAll() {    //test
			
		return dao.selectAll();
	}

	@Override
	public List<ActivityAttendVO> selectByMemberId(Integer memberId) {
		// TODO Auto-generated method stub
		return dao.selectByMemberId(memberId);
	}
	
	public int deleteOneActa(Integer memberId,Integer activityId) {
		
		DualKey<Integer, Integer> id=new DualKey<Integer, Integer>(memberId, activityId);
		return dao.deleteById(id);
	}
	
}
