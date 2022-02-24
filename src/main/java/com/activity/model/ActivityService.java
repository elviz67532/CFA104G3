package com.activity.model;

import java.sql.Timestamp;
import java.util.List;

public interface ActivityService {

	// 新增活動
	public ActivityVO addAct(Integer organizerMemberId, Integer type, String name, String content,
			Timestamp launchedDate, Timestamp applyStartDate, Timestamp applyEndDate, String location, Integer cost,
			Integer applyMemberExisting, Integer maxMember, Integer minMember, Timestamp startDate, Timestamp endDate,
			Integer status);

	// 編輯活動
	public ActivityVO updateAct(Integer activityId, Integer type, String name, String content, 
			Timestamp launchedDate, Timestamp applyStartDate, Timestamp applyEndDate, 
			String location, Integer cost, Integer applyMemberExisting, Integer maxMember, 
			Integer minMember, Timestamp startDate, Timestamp endDate );

	// 刪除活動
	public void deleteAct(Integer activityId);

	// 改變狀態
	public ActivityVO changeStatus(Integer activityId,Integer status);

	
	// 查詢單筆活動
	public ActivityVO findByActivityId(Integer activityId);

	// 查詢該會員舉辦活動
	public List<ActivityVO> findByMemId(Integer organizerMemberId);

	//依照活動查詢全部活動
	public List<ActivityVO> getActType(Integer type);

	// 查詢全部活動
	public List<ActivityVO> getAllAct();
	
	// 查詢全部活動最新優先排序
	public List<ActivityVO> getAllActDesc();
	
	// 參與活動用, 查個人參與的活動
	public List<ActivityVO> getAllByActId(Integer id);

	public void addAttend(Integer activityId) ;
	
	public void minusAttend (Integer activityId);
}
