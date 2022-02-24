package com.activity.model;

import java.util.List;

import core.dao.CoreDao;

public interface ActivityDAO extends CoreDao<ActivityVO, Integer> {
	List<ActivityVO> selectAllDesc();
	List<ActivityVO> selectAllByType(Integer type);
	int updateStatus(ActivityVO vo);
	List<ActivityVO> selectByMemId(Integer organizerMemberId);
	
	//參與活動用, 查個人參與的活動
	List<ActivityVO> selectAllByActId(Integer id);

}
