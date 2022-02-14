package com.move_photo.model;

import java.util.List;

import core.dao.CoreDao;

public interface MovePhotoDAO extends CoreDao<MovePhotoVO, Integer> {

	List<MovePhotoVO> findAllPhotosByRequestId(int requestId);
}
