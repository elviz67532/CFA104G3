package com.activity_report.model;

import java.util.List;

public interface ActivityReportService {

	ActivityReportVO addActr(Integer activityId, Integer memberId, String content, Integer status, byte[] photo);

	ActivityReportVO getOneActr(Integer id);

	List<ActivityReportVO> getAll();
}
