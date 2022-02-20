package com.move_order.model;

import java.sql.Timestamp;
import java.util.List;

import com.member.model.MemberDAOJDBCImpl;
import com.member.model.MemberVO;
import com.move_request.model.MoveRequestVO;

public class MoveOrderServiceImpl implements MoveOrderService {

	private MoveOrderDAOJDBCImpl dao;

	public MoveOrderServiceImpl() {
		dao = new MoveOrderDAOJDBCImpl();
	}
	
	@Override
	public MoveOrderVO addMoveOrder(Integer memberId, String customer, String phone, String fromAddress,
			String toAddress, Timestamp moveDate, Integer amountFirst, Integer deposit, Integer amountTotal,
			String comment, Timestamp orderDate, Integer status) {

		MoveOrderVO vo = new MoveOrderVO();

		vo.setMemberId(memberId);
		vo.setCustomer(customer);
		vo.setPhone(phone);
		vo.setFromAddress(fromAddress);
		vo.setToAddress(toAddress);
		vo.setMoveDate(moveDate);
		vo.setAmountFirst(amountFirst);
		vo.setDeposit(deposit);
		vo.setAmountTotal(amountTotal);
		vo.setComment(comment);
		vo.setOrderDate(orderDate);
		vo.setStatus(status);
		
		dao.insert(vo);

		return vo;
	}

	@Override
	public MoveOrderVO updateMoveOrder(Integer id, Integer memberId, String customer, String phone, String fromAddress, String toAddress,
			Timestamp moveDate, Integer amountFirst, Integer deposit, Integer amountTotal, String comment,
			Timestamp orderDate, Integer status) {

		MoveOrderVO vo = new MoveOrderVO();
		
		vo.setId(id);
		vo.setMemberId(memberId);
		vo.setCustomer(customer);
		vo.setPhone(phone);
		vo.setFromAddress(fromAddress);
		vo.setToAddress(toAddress);
		vo.setMoveDate(moveDate);
		vo.setAmountFirst(amountFirst);
		vo.setDeposit(deposit);
		vo.setAmountTotal(amountTotal);
		vo.setComment(comment);
		vo.setOrderDate(orderDate);
		vo.setStatus(status);
		
		dao.update(vo);
		System.out.println(comment);
		System.out.println("service ok");
		return vo;
	}

	@Override
	public void deleteMoveOrder(Integer id) {
		dao.deleteById(id);
	}

	@Override
	public MoveOrderVO getOneMoveOrder(Integer id) {
		return dao.selectById(id);
	}
	
	@Override
	public List<MoveOrderVO> getByMemberId(int memberId) {
		return dao.selectByMemId(memberId);
	}

	@Override
	public List<MoveOrderVO> getAll() {
		return dao.selectAll();
	}
	
	//從迤邐那邊找資料
	@Override
	public boolean getDataFromRequest(MoveRequestVO moveRequestVO, int deposit) {

		MoveOrderVO vo = new MoveOrderVO();
		vo.setMemberId(moveRequestVO.getMemberId());
		vo.setFromAddress(moveRequestVO.getFromAddress());
		vo.setToAddress(moveRequestVO.getToAddress());
		vo.setMoveDate(moveRequestVO.getMoveDate());
		vo.setAmountFirst(moveRequestVO.getEvaluatePrice());
		vo.setDeposit(deposit);

		vo.setAmountTotal(0);
		vo.setComment(null);
		
		Long datetime = System.currentTimeMillis();
	    Timestamp orderDate = new Timestamp(datetime);
	    vo.setOrderDate(orderDate);
	    
	    vo.setStatus(0);
	    
		MemberDAOJDBCImpl memDao = new MemberDAOJDBCImpl();
		MemberVO memberVO = memDao.selectById(moveRequestVO.getMemberId());
			
		vo.setCustomer(memberVO.getName());
		vo.setPhone(memberVO.getPhone());

		dao.insert(vo);

		return true;
	}
	
	public static void main(String[] args) {
		MoveOrderServiceImpl moSvc = new MoveOrderServiceImpl();
		System.out.println(moSvc.getByMemberId(6));
	}
}
