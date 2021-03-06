package com.notification.model;

import java.sql.Timestamp;
import java.util.List;

public class NotificationServiceImpl implements NotificationService {

	private NotificationDAO moveRequestDAO = new NotificationDAOJDBCImpl();

	@Override
	public boolean addNotification(Integer memberId, String content, ENotificationType type) {
		NotificationVO pojo = new NotificationVO();
		pojo.setMemberId(memberId);
		pojo.setNotifyTime(new Timestamp(System.currentTimeMillis()));
		pojo.setType(type.getCode());
		pojo.setContent(content);
		pojo.setViewed(false);
		int insert = moveRequestDAO.insert(pojo);
		return insert > 0;
	}

	@Override
	public List<NotificationVO> getMemberAllNotification(Integer memberId) {
		return moveRequestDAO.selectMemberNotifications(memberId);
	}

	@Override
	public List<NotificationVO> getMemberLatestNotification(Integer memberId, Integer count) {
		return moveRequestDAO.getMemberLatestNotification(memberId, count);
	}

	@Override
	public int getUnviewNotificationCount(Integer memberId) {
		return moveRequestDAO.getUnviewNotificationCount(memberId);
	}

	@Override
	public int viewNotification(Integer notificationId) {
		return moveRequestDAO.setViewNotification(notificationId);
	}
}
