package com.move_request.model;

import java.util.List;

import com.member.model.MemberVO;
import com.move_photo.model.MovePhotoTransVO;
import com.move_photo.model.MovePhotoVO;

import lombok.Data;

@Data
public class MoveRequestManageTransVO {
	public MemberVO memberVo;
	public MoveRequestVO moveRequestVO;
	public MovePhotoTransVO[] movePhotoTransVO;
}
