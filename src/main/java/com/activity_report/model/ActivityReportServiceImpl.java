package com.activity_report.model;

import java.util.List;

public class ActivityReportServiceImpl implements ActivityReportService {
	private ActivityReportDao dao;

	public ActivityReportServiceImpl() {
		dao = new ActivityReportDAOJDBCImpl();
	}

	@Override
	public ActivityReportVO addActr(Integer activityId, Integer memberId, String content, Integer status,
			byte[] photo) {

		ActivityReportVO actrVO = new ActivityReportVO();
		actrVO.setActivityId(activityId);
		actrVO.setMemberId(memberId);
		actrVO.setContent(content);
		actrVO.setStatus(status);
		actrVO.setPhoto(photo);
		dao.insert(actrVO);

		return actrVO;
	}

	@Override
	public ActivityReportVO getOneActr(Integer id) {
		return dao.selectById(id);
	}

	@Override
	public List<ActivityReportVO> getAll() {
		return dao.selectAll();
	}
}
