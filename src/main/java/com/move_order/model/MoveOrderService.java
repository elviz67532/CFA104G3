package com.move_order.model;

import java.sql.Timestamp;
import java.util.List;

public interface MoveOrderService {

	MoveOrderVO addMoveOrder(Integer memberId, String customer, String phone, String fromAddress, String toAddress,
			Timestamp moveDate, Integer amountFirst, Integer deposit, Integer amountTotal, String comment,
			Timestamp orderDate, Integer status);

	MoveOrderVO updateMoveOrder(Integer id, Integer memberId, String customer, String phone, String fromAddress,
			String toAddress, Timestamp moveDate, Integer amountFirst, Integer deposit, Integer amountTotal,
			String comment, Timestamp orderDate, Integer status);

	void deleteMoveOrder(Integer id);

	MoveOrderVO getOneMoveOrder(Integer id);

	List<MoveOrderVO> getAll();

}
