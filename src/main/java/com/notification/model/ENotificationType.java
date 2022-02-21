package com.notification.model;

public enum ENotificationType {
	OTHER(0, "其他"), 
	MOVE(1, "搬家"), 
	PRODUCT(2, "二手買賣"), 
	ACTIVITY(3, "活動");

	private int code;
	private String text;

	private ENotificationType(int code, String text) {
		this.code = code;
		this.text = text;
	}

	public int getCode() {
		return code;
	}

	public String getText() {
		return text;
	}

	public static ENotificationType parseCode(int code) {
		ENotificationType type = null;
		for (ENotificationType t : ENotificationType.values()) {
			if (t.code == code) {
				type = t;
			}
		}
		if (type == null) {
			throw new IllegalArgumentException("illegal statusCode=" + code);
		}
		return type;
	}
}
