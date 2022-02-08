package com.move_request.model;

public enum EMoveRequestEvaType {
	ONLINE(0, "線上估價"), 
	SITE(1, "現場估價");

	private int typeCode;
	private String text;

	private EMoveRequestEvaType(int typeCode, String text) {
		this.typeCode = typeCode;
		this.text = text;
	}

	public int getTypeCode() {
		return typeCode;
	}

	public String getText() {
		return text;
	}

	public static EMoveRequestEvaType parseCode(int typeCode) {
		EMoveRequestEvaType type = null;
		for (EMoveRequestEvaType e : EMoveRequestEvaType.values()) {
			if (e.typeCode == typeCode) {
				type = e;
			}
		}
		if (type == null) {
			throw new IllegalArgumentException("illegal typeCode=" + typeCode);
		}
		return type;
	}
}
