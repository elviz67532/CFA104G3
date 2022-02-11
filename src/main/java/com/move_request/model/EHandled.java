package com.move_request.model;

public enum EHandled {
	NOT_HANDLE(false, "未處理"), 
	HANDLED(true, "已處理");
	
	private Boolean handledCode;
	private String text;

	private EHandled(Boolean handledCode, String text) {
		this.handledCode = handledCode;
		this.text = text;
	}

	public Boolean getHandledCode() {
		return handledCode;
	}
	
	public String getText() {
		return text;
	}

	public static EHandled parseCode(Boolean handledCode) {
		EHandled status = null;
		for (EHandled e : EHandled.values()) {
			if (e.handledCode == handledCode) {
				status = e;
			}
		}
		if (status == null) {
			throw new IllegalArgumentException("illegal statusCode=" + handledCode);
		}
		return status;
	}
}
