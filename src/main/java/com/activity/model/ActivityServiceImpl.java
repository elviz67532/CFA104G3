package com.activity.model;

import java.sql.Timestamp;
import java.util.List;

public class ActivityServiceImpl implements ActivityService {

	private ActivityDAO dao;

	public ActivityServiceImpl() {
		dao = new ActivityDAOJDBCImpl();
	}

	@Override
	public List<ActivityVO> getAllByActId(Integer id) {
		return dao.selectAllByActId(id);
	}

	@Override
	public ActivityVO addAct(Integer organizerMemberId, Integer type, String name, 
			String content, Timestamp launchedDate ,Timestamp applyStartDate, 
			Timestamp applyEndDate, String location, Integer cost, Integer applyMemberExisting, 
			Integer maxMember, Integer minMember, Timestamp startDate, Timestamp endDate, Integer status) {
		
		ActivityVO vo = new ActivityVO();
		vo.setOrganizerMemberId(organizerMemberId);
		vo.setType(type);
		vo.setName(name);
		vo.setContent(content);
		vo.setLaunchedDate(launchedDate);
		vo.setApplyStartDate(applyStartDate);
		vo.setApplyEndDate(applyEndDate);
		vo.setLocation(location);
		vo.setCost(cost);
		vo.setApplyMemberExisting(applyMemberExisting);
		vo.setMaxMember(maxMember);
		vo.setMinMember(minMember);
		vo.setStartDate(startDate);
		vo.setEndDate(endDate);
		vo.setStatus(status);
		int activityId = dao.insert(vo);
		vo.setActivityId(activityId);
		return vo;
	}

	@Override
	public ActivityVO updateAct(Integer activityId, Integer type, String name, String content, 
			Timestamp launchedDate, Timestamp applyStartDate, Timestamp applyEndDate, 
			String location, Integer cost, Integer applyMemberExisting, Integer maxMember, 
			Integer minMember, Timestamp startDate, Timestamp endDate ) {
		
		ActivityVO vo = new ActivityVO();
//		vo.setOrganizerMemberId(organizerMemberId);
//		vo.setStatus(status);
		vo.setActivityId(activityId);
		vo.setType(type);
		vo.setName(name);
		vo.setContent(content);
		vo.setLaunchedDate(launchedDate);
		vo.setApplyStartDate(applyStartDate);
		vo.setApplyEndDate(applyEndDate);
		vo.setLocation(location);
		vo.setCost(cost);
		vo.setApplyMemberExisting(applyMemberExisting);
		vo.setMaxMember(maxMember);
		vo.setMinMember(minMember);
		vo.setStartDate(startDate);
		vo.setEndDate(endDate);
		dao.update(vo);
		return vo;
	}

	@Override
	public void deleteAct(Integer activityId) {
		dao.deleteById(activityId);
	}

	@Override
	public List<ActivityVO> findByMemId(Integer organizerMemberId) {
		return dao.selectByMemId(organizerMemberId);
	}

	@Override
	public ActivityVO findByActivityId(Integer activityId) {
		return dao.selectById(activityId);
	}
	
	@Override
	public List<ActivityVO> getActType(Integer type) {
		return dao.selectAllByType(type);
	}

	//倒著排序
	@Override
	public List<ActivityVO> getAllActDesc() {
		return dao.selectAllDesc();
	}

	@Override
	public List<ActivityVO> getAllAct() {
		return dao.selectAll();
	}
	
	//改變狀態
	@Override
	public ActivityVO changeStatus(Integer activityId, Integer status) {
		ActivityVO vo = new ActivityVO();
		vo.setActivityId(activityId);
		vo.setStatus(status);
		dao.updateStatus(vo);
		return vo;
	}
	public ActivityVO changeNormal(Integer activityId) {
		return changeStatus(activityId, 0);
	}
	public ActivityVO changeCancel(Integer activityId) {
		return changeStatus(activityId, 1);
	}
	public ActivityVO changeRemove(Integer activityId) {
		return changeStatus(activityId, 2);
	}
	
	public void addAttend(Integer activityId) {
		dao.addAttend(activityId);
	}
	
	public void minusAttend(Integer activityId) {
		dao.minusAttend(activityId);
	}
	
	
}
