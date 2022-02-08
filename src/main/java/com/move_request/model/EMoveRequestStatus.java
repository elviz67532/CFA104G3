package com.move_request.model;

public enum EMoveRequestStatus {
	WAIT_VERIFY(0, "等待審核"), 
	VERIFY_NAK(1, "審核失敗"),
	WAIT_SITE_EVA(2, "等待現場估價"), 
	WAIT_PAY(3, "等待結帳"),
	CANCEL_REQUEST(4, "取消申請單"), 
	PAY_DONE(5, "付款完成");
	
	private int statusCode;
	private String text;

	private EMoveRequestStatus(int statusCode, String text) {
		this.statusCode = statusCode;
		this.text = text;
	}

	public int getStatusCode() {
		return statusCode;
	}
	
	public String getText() {
		return text;
	}

	public static EMoveRequestStatus parseCode(int statusCode) {
		EMoveRequestStatus status = null;
		for (EMoveRequestStatus e : EMoveRequestStatus.values()) {
			if (e.statusCode == statusCode) {
				status = e;
			}
		}
		if (status == null) {
			throw new IllegalArgumentException("illegal statusCode="+statusCode);
		}
		return status;
	}
}
