package com.activity.model;

import java.sql.Timestamp;
import java.util.List;


public class ActivityServiceImpl implements ActivityService {
	private ActivityDAO dao;

	public ActivityServiceImpl() {
		dao = new ActivityDAOJDBCImpl();
	}

	@Override
	public ActivityVO addAct(Integer type, String name, String content, Timestamp applyStartDate,
			Timestamp applyEndDate, String location, Integer cost, Integer maxMember,
			Integer minMember, Timestamp startDate, Timestamp endDate) {
		
		ActivityVO vo = new ActivityVO();
		vo.setType(type);
		vo.setName(name);
		vo.setContent(content);
		vo.setApplyStartDate(applyStartDate);
		vo.setApplyEndDate(applyEndDate);
		vo.setLocation(location);
		vo.setCost(cost);
		vo.setMaxMember(maxMember);
		vo.setMinMember(minMember);
		vo.setStartDate(startDate);
		vo.setEndDate(endDate);
		dao.insert(vo);

		return vo;
	}

	@Override
	public ActivityVO updateAct(Timestamp applyEndDate, String location, Integer applyMemberExisting, Integer maxMember,
			Integer minMember, Timestamp startDate, Timestamp endDate) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ActivityVO findByActType(Integer type) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ActivityVO findByActivityId(Integer activityId) {
		return dao.selectById(activityId); 
	}

	@Override
	public List<ActivityVO> getAllAct() {
		// TODO Auto-generated method stub
		return null;
	}
}
