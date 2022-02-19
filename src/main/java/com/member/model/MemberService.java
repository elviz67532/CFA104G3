package com.member.model;

import java.sql.Timestamp;

public interface MemberService {
	MemberVO login(String account, String password);

	MemberVO getOneMemberByName(String name);

	MemberVO forgetpassword(String email);

	MemberVO updateMember(MemberVO memberVO);



	MemberVO selectById(Integer id);
	
	MemberVO register(String email, String account, String password, String nickname, String name, String phone,
			Integer gender, String city, String cityArea, String address, String code, byte[] avatar);

	MemberVO frontMemberUpdate(String email, String password, String nickname, String name, String phone, String city,
			String cityArea, String address, byte[] avatar, Integer id);


	boolean veriftyCode(Integer id, String code);

	boolean banMember(Integer id);

	boolean restoreMember(Integer id);


}
