package com.activity.model;

import java.sql.Timestamp;
import java.util.List;

public class ActivityServiceImpl implements ActivityService {
	private ActivityDAO dao;

	public ActivityServiceImpl() {
		dao = new ActivityDAOJDBCImpl();
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
	public ActivityVO updateAct(Integer type, String name, String content, Timestamp launchedDate,
			Timestamp applyEndDate, String location, Integer applyMemberExisting, Integer maxMember, Integer minMember,
			Timestamp startDate, Timestamp endDate) {
		
		ActivityVO vo = new ActivityVO();
		vo.setType(type);
		vo.setName(name);
		vo.setContent(content);
		vo.setLaunchedDate(launchedDate);
		vo.setApplyEndDate(applyEndDate);
		vo.setLocation(location);
		vo.setApplyMemberExisting(applyMemberExisting);
		vo.setMaxMember(maxMember);
		vo.setMinMember(minMember);
		vo.setStartDate(startDate);
		vo.setEndDate(endDate);
		dao.insert(vo);

		return vo;
	}

	@Override
	public void deleteAct(Integer activityId) {
		dao.deleteById(activityId);
	}


	@Override
	public ActivityVO findByActivityId(Integer activityId) {
		return dao.selectById(activityId);
	}

	@Override
	public List<ActivityVO> getAllAct() {
		return dao.selectAll();
	}

}
