package com.notification.model;

import java.sql.Timestamp;
import java.util.List;

public class NotificationServiceImpl implements NotificationService {

	private NotificationDAO moveRequestDAO = new NotificationDAOJDBCImpl();

	@Override
	public boolean addNotification(Integer memberId, String content, Integer type) {
		NotificationVO pojo = new NotificationVO();
		pojo.setMemberId(memberId);
		pojo.setNotifyTime(new Timestamp(System.currentTimeMillis()));
		pojo.setType(type);
		pojo.setContent(content);
		int insert = moveRequestDAO.insert(pojo);
		return insert > 0;
	}

	@Override
	public List<NotificationVO> getMemberAllNotification(Integer memberId) {
		return moveRequestDAO.selectMemberNotifications(memberId);
	}

	@Override
	public List<NotificationVO> getMemberUnviewedNotification(Integer memberId) {
		return moveRequestDAO.selectMemberUnviewNotifications(memberId);
	}
}
