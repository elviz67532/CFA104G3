package com.move_request.model;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Date;
import java.sql.Timestamp;
import java.time.Instant;
import java.util.List;

import javax.servlet.http.Part;

import com.move_order.model.MoveOrderService;
import com.move_order.model.MoveOrderServiceImpl;
import com.move_photo.model.MovePhotoDAO;
import com.move_photo.model.MovePhotoDAOJDBCImpl;
import com.move_photo.model.MovePhotoService;
import com.move_photo.model.MovePhotoServiceImpl;
import com.move_photo.model.MovePhotoVO;
import com.notification.model.ENotificationType;
import com.notification.model.NotificationService;
import com.notification.model.NotificationServiceImpl;

// NOTE 不提供申請單修改
public class MoveRequestServiceImpl implements MoveRequestService {

	private MoveRequestDAO moveRequestDAO = new MoveRequestDAOJDBCImpl(); 
	private MovePhotoService movePhotoService = new MovePhotoServiceImpl();
	private MoveOrderService orderService = new MoveOrderServiceImpl();
	
	
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
	public List<Date> getUnavaliableEvaDates(Date today) {
		return moveRequestDAO.getUnAvaliableEvaDates(today);
	}
	
	@Override
	public List<Date> getUnavaliableMoveDates(Date today) {
		return moveRequestDAO.getUnavaliableMoveDates(today);
	}
	
	@Override
	public boolean cancelRequest(int requestId) {
		int row = moveRequestDAO.changeStatus(requestId, EMoveRequestStatus.CANCEL_REQUEST.getStatusCode());
		boolean cancelOk = row > 0;
		if (cancelOk) {
			handled(requestId);
		}
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
		if (row > 0) {
			handled(requestId);
		}
		return row > 0;
	}
	
	@Override
	public boolean evaluatePrice(int requestId, int price) {
		boolean evaluate = evaluate(requestId, price);
		int row = moveRequestDAO.changeStatus(requestId, EMoveRequestStatus.WAIT_PAY.getStatusCode());
		return row > 0;
	}

	@Override
	public boolean verifySiteRequestOK(int requestId) {
		int row = moveRequestDAO.changeStatus(requestId, EMoveRequestStatus.WAIT_SITE_EVA.getStatusCode());
		return  row > 0;
	}
	
	@Override
	public boolean pay(int requestId) {
		MoveRequestVO request = getRequest(requestId);
		int deposit = calDeposit(request.getEvaluatePrice());
		boolean payok = orderService.getDataFromRequest(request, deposit);
		if (payok) {
			moveRequestDAO.changeStatus(requestId, EMoveRequestStatus.PAY_DONE.getStatusCode());
			handled(requestId);
		}
		return payok;
	}

	@Override
	public MoveRequestVO getRequest(int requestId) {
		return moveRequestDAO.selectById(requestId);
	}

	private boolean handled(int requestId) {
		int row = moveRequestDAO.changeHandled(requestId);
		return  row > 0;
	}
	
	private boolean evaluate(int requestId, int price) {
		return moveRequestDAO.changePrice(requestId, price) > 0;
	}
	
	private int calDeposit(int oriPrice) {
		if (oriPrice <= 200) {
			return oriPrice;
		} else if (oriPrice > 200 && oriPrice <= 500) {
			return 200;
		} else {
			return 500;
		}
	}
}
