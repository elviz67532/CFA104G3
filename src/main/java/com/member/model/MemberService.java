package com.member.model;

public interface MemberService {
	MemberVO login(String account, String password);

	MemberVO getOneMemberByName(String name);

	MemberVO forgetpassword(String email);

}
