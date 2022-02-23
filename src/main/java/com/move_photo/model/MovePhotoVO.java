package com.move_photo.model;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MovePhotoVO implements Serializable {
	private Integer id;
	private Integer moveRequestId;
	private byte[] photo;
}
	