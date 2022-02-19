package com.notification.model;

import java.util.List;

import core.dao.CoreDao;

public interface NotificationDAO extends CoreDao<NotificationVO, Integer> {

	List<NotificationVO> selectMemberNotifications(Integer memberId);

	List<NotificationVO> getMemberLatestNotification(Integer memberId, Integer count);

	int getUnviewNotificationCount(Integer memberId);

	int setViewNotification(Integer notificationId);
}
