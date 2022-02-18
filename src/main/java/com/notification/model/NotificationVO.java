package com.notification.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class NotificationVO {
	private Integer id;
	private Integer memberId;
	private Timestamp notifyTime;
	private String content;
	private Integer type;
	private Boolean viewed;
}
