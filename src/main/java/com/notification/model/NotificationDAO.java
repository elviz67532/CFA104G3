package com.notification.model;

import java.util.List;

import core.dao.CoreDao;

public interface NotificationDAO extends CoreDao<NotificationVO, Integer> {

	List<NotificationVO> selectMemberNotifications(Integer memberId);

	List<NotificationVO> selectMemberUnviewNotifications(Integer memberId);

	int updateNotificationsToView(List<Integer> ids);

}
