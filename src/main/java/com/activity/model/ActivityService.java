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
	public ActivityVO updateAct(Integer type, String name, String content, Timestamp launchedDate,
			Timestamp applyEndDate, String location, Integer applyMemberExisting, Integer maxMember, Integer minMember,
			Timestamp startDate, Timestamp endDate);

	// 刪除活動
	public void deleteAct(Integer activityId);

	// 取消活動 頁面處理
//	    public ActivityVO cancelAct(Integer activityId);

	// 下架活動 頁面處理
//	    public ActivityVO removeAct(Integer activityId);

	// 查詢單筆活動
	public ActivityVO findByActivityId(Integer activityId);

	// 查詢全部活動
	public List<ActivityVO> getAllAct();

}
