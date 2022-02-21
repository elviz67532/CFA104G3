package com.move_request.model;

import java.sql.Timestamp;
import java.util.List;

import com.move_photo.model.MovePhotoTransVO;

import lombok.Data;

@Data
public class MoveRequestTransResVO {
	// 申請單id
	private Integer id;
	
	// 顯示用
	// 客戶內容
	private String memberName;
	
	// 申請單內容
	private String fromAddress;
	private String toAddress;
	private String items;
	private Timestamp moveDate;
	private Integer evaluateType;
	private Timestamp evaluateDate;
	private Integer evaluatePrice;
	private Timestamp requestDate;
	private Boolean handled;
	private MovePhotoTransVO[] movePhotoTransVOs;
	private Integer statusCode;
	private String status;
	
	// 跳轉頁面
	private String href;
}
