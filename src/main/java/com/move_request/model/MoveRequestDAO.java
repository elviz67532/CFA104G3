package com.move_request.model;

import java.sql.Date;
import java.util.List;

import core.dao.CoreDao;

public interface MoveRequestDAO extends CoreDao<MoveRequestVO, Integer> {

	int changeStatus(int requestId, int statusCode);

	List<MoveRequestVO> selectAllByMebmerId(int memberId);
	
	List<Date> getUnAvaliableEvaDates(Date today);

	List<Date> getUnavaliableMoveDates(Date today);

	int changePrice(int requestId, int price);

	int changeHandled(int requestId);
}
