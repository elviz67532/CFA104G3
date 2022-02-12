package com.activity.model;

import java.sql.Timestamp;
import java.util.List;

public interface ActivityService {
	
	//新增活動
	public ActivityVO addAct(Integer type, String name, String content,
			Timestamp applyStartDate, Timestamp applyEndDate, String location,
			Integer cost, Integer maxMember,Integer minMember, Timestamp startDate, 
			Timestamp endDate);
//1231321
	//編輯活動
    public ActivityVO updateAct(Timestamp applyEndDate, String location,
    		Integer applyMemberExisting, Integer maxMember,
    		Integer minMember, Timestamp startDate, Timestamp endDate);
    
    //刪除活動
//    public void deleteAct(Integer activityId);
    
    //取消活動
//    public ActivityVO cancelAct(Integer activityId);
    
    //下架活動
//    public ActivityVO removeAct(Integer activityId);
    
    //查詢同種類活動
    public ActivityVO findByActType(Integer type);
    
    //查詢單筆活動
    public ActivityVO findByActivityId(Integer activityId);
    
    //查詢全部活動
    public List<ActivityVO> getAllAct();


}
