package com.move_request.model;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Date;
import java.sql.Timestamp;
import java.time.Instant;
import java.util.List;

import javax.servlet.http.Part;

import com.move_photo.model.MovePhotoDAO;
import com.move_photo.model.MovePhotoDAOJDBCImpl;
import com.move_photo.model.MovePhotoService;
import com.move_photo.model.MovePhotoServiceImpl;
import com.move_photo.model.MovePhotoVO;

// NOTE 不提供申請單修改
public class MoveRequestServiceImpl implements MoveRequestService {

	private MoveRequestDAO moveRequestDAO = new MoveRequestDAOJDBCImpl(); 
	private MovePhotoService movePhotoService = new MovePhotoServiceImpl();
	
	@Override
	public List<Date> getUnavaliableEvaDates(Date today) {
		return moveRequestDAO.getUnAvaliableEvaDates(today);
	}
	
	@Override
	public List<Date> getUnavaliableMoveDates(Date today) {
		return moveRequestDAO.getUnavaliableMoveDates(today);
	}
	
	@Override
	public boolean addRequest(int memberId, String fromAddress, String toAddress, String items, Timestamp moveDate,
			EMoveRequestEvaType evaluateType, Timestamp evaDate, List<byte[]> photos) {
		
		// TODO 對重複日期做判斷防禦
		// TODO TRANCTION機制
		
		MoveRequestVO vo = new MoveRequestVO();
		vo.setMemberId(memberId);
		vo.setFromAddress(fromAddress);
		vo.setToAddress(toAddress);
		vo.setEvaluateDate(evaDate);
		vo.setItems(items);
		vo.setEvaluatePrice(0);	// default
		vo.setMoveDate(moveDate);
		vo.setEvaluateType(evaluateType.getTypeCode());
		vo.setRequestDate(Timestamp.from(Instant.now()));
		vo.setStatus(EMoveRequestStatus.WAIT_VERIFY.getStatusCode());
		vo.setHandled(false);
		
		int id = moveRequestDAO.insert(vo);
		boolean insertOk = id > 0;
		
		// 插入圖片
		if (insertOk) {
			if (photos != null) { 
				for (byte[] photo : photos) {
					movePhotoService.insert(id, photo);
				}
			}
		}
		
		return insertOk;
	}
	
	@Override
	public boolean cancelRequest(int requestId) {
		int row = moveRequestDAO.changeStatus(requestId, EMoveRequestStatus.CANCEL_REQUEST.getStatusCode());
		boolean cancelOk = row > 0;
		return cancelOk;
	}
	
	@Override
	public List<MoveRequestVO> findMemberRequests(int memberId) {
		return moveRequestDAO.selectAllByMebmerId(memberId);
	}
	
	@Override
	public List<MoveRequestVO> findAllRequests() {
		return moveRequestDAO.selectAll();
	}
	
	@Override
	public boolean verifyRequestNAK(int requestId) {
		int row = moveRequestDAO.changeStatus(requestId, EMoveRequestStatus.VERIFY_NAK.getStatusCode());
		boolean OK = row > 0;

		// TODO 通知失敗

		return OK;
	}
	
	@Override
	public boolean verifyOnlineRequestOK(int requestId, int price) {
		boolean evaluate = evaluate(requestId, price);
		int row = moveRequestDAO.changeStatus(requestId, EMoveRequestStatus.WAIT_PAY.getStatusCode());
		boolean cancelOk = row > 0;

		// TODO 通知成功
		return false;
	}
	
	@Override
	public boolean verifySiteRequestOK(int requestId) {
		int row = moveRequestDAO.changeStatus(requestId, EMoveRequestStatus.WAIT_SITE_EVA.getStatusCode());
		boolean cancelOk = row > 0;
		
		// TODO 通知成功
		return false;
	}

	@Override
	public boolean evaluate(int requestId, int price) {
		return moveRequestDAO.changePrice(requestId, price) > 0;
	}

	@Override
	public boolean pay(int requestId) {
		// TODO 預設為結帳成功
		// TODO 產生訂單
		// TODO 
		return true;
	}

	@Override
	public MoveRequestVO getRequest(int requestId) {
		return moveRequestDAO.selectById(requestId);
	}
}
