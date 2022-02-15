package com.move_photo.model;

import java.util.List;

public interface MovePhotoService {

	boolean insert(int RequestId, byte[] photo);

	List<MovePhotoVO> findAllPhotosByRequestId(int RequestId);
}
