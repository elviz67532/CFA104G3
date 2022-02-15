package com.move_request.model;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;

import javax.servlet.http.Part;

public interface MoveRequestService {
	
	// used
	boolean addRequest(int memberId, String fromAddress, String toAddress, String items, Timestamp tMoveDate,
			EMoveRequestEvaType evaluateType, Timestamp tEvaDate, List<byte[]> fileParts);
	
	boolean evaluate(int requestId, int price);

	MoveRequestVO getRequest(int requestId);
	
	// unsued
	List<Date> getUnavaliableMoveDates(Date today);

	List<Date> getUnavaliableEvaDates(Date today);
	
	boolean cancelRequest(int requestId);

	List<MoveRequestVO> findMemberRequests(int memberId);
	
	List<MoveRequestVO> findAllRequests();

	boolean pay(int requestId);

	boolean verifyRequestNAK(int requestId);

	boolean verifyOnlineRequestOK(int requestId, int price);

	boolean verifySiteRequestOK(int requestId);
}
