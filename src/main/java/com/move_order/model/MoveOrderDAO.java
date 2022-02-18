package com.move_order.model;

import java.util.List;

import core.dao.CoreDao;

public interface MoveOrderDAO extends CoreDao<MoveOrderVO, Integer> {

	List<MoveOrderVO> selectByMemId(int memberId);
	
}
