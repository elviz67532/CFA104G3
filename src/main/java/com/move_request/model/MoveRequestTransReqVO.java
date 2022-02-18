package com.move_request.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class MoveRequestTransReqVO {
	private String action;
	private Integer id;
	private Integer price;
}
