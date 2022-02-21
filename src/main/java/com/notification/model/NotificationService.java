package com.notification.model;

import java.util.List;

public interface NotificationService {

	boolean addNotification(Integer memberId, String content, ENotificationType type);

	List<NotificationVO> getMemberAllNotification(Integer memberId);

	List<NotificationVO> getMemberLatestNotification(Integer memberId, Integer count);
	
	int getUnviewNotificationCount(Integer memberId);

	int viewNotification(Integer memberId);
}
