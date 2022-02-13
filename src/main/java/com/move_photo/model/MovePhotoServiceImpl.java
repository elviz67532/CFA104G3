package com.move_photo.model;

import java.util.List;

public class MovePhotoServiceImpl implements MovePhotoService {
	private MovePhotoDAO movePhotoDao = new MovePhotoDAOJDBCImpl();

	@Override
	public boolean insert(int id, byte[] photo) {
		MovePhotoVO photoVo = new MovePhotoVO();
		photoVo.setMoveRequestId(id);
		photoVo.setPhoto(photo);
		int insert = movePhotoDao.insert(photoVo);
		boolean ok = insert > 0; 
		return ok;
	}

	@Override
	public List<MovePhotoVO> findAllPhotosByRequestId(int RequestId) {
		return movePhotoDao.findAllPhotosByRequestId(RequestId);
	}
}
