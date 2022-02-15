package com.activity_photo.model;

public interface ActivityPhotoService {
	
	public ActivityPhotoVO addActPhoto(Integer activityId, byte[] photo); 
	
	public ActivityPhotoVO updateActPhoto(Integer activityId, byte[] photo); 

}
