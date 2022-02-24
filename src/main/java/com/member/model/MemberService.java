package com.member.model;

import java.sql.Timestamp;

public interface MemberService {
	MemberVO login(String account, String password);

	MemberVO getOneMemberByName(String name);

	MemberVO forgetpassword(String email);

	MemberVO updateMember(MemberVO memberVO);

	MemberVO selectById(Integer id);
	

	MemberVO frontMemberUpdate(String email, String password, String nickname, String name, String phone, String city,
			String cityArea, String address, byte[] avatar, Integer id);

	boolean banMember(Integer id);

	boolean restoreMember(Integer id);

	boolean veriftyCode(Integer status, Integer id, String code);


	MemberVO status(Integer id, Integer status);

	MemberVO findByAccount(String account);

	MemberVO register(String email, String account, String password, String nickname, String name, String phone,
			Integer gender, String code, byte[] avatar);

	MemberVO findByEmail(String email);

	


}
