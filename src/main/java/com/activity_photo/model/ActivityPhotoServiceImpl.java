package com.activity_photo.model;

public class ActivityPhotoServiceImpl implements ActivityPhotoService {
	private ActivityPhotoDAO dao;

	public ActivityPhotoServiceImpl() {
		dao = new ActivityPhotoDAOJDBCImpl();
	}

	@Override
	public ActivityPhotoVO addActPhoto(Integer activityId, byte[] photo) {
		ActivityPhotoVO vo = new ActivityPhotoVO();
		vo.setActivityId(activityId);
		vo.setPhoto(photo);
		dao.insert(vo);

		return vo;
	}

	@Override
	public ActivityPhotoVO updateActPhoto(Integer activityId, byte[] photo) {
		ActivityPhotoVO vo = new ActivityPhotoVO();
		vo.setActivityId(activityId);
		vo.setPhoto(photo);
		dao.insert(vo);

		return vo;
	}

	@Override
	public ActivityPhotoVO findActPhoto(Integer photoId) {
		return dao.selectById(photoId);
	}

	@Override
	public ActivityPhotoVO findActPhotoByActId(int actId) {
		return dao.findActPhotoByActId(actId);
	}
}