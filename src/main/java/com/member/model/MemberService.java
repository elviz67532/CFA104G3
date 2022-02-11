package com.member.model;

import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

public interface MemberService {
	MemberVO login(String account, String password);

	MemberVO insert(int id, String email, String account, String password, String nickname, String name, String phone,
			int gender, String city, String cityArea, String address, String code, byte[] avatar,
			Timestamp registerDate, int status);

	MemberVO update(int id, String email, String account, String password, String nickname, String name, String phone,
			int gender, String city, String cityArea, String address, String code, byte[] avatar,
			Timestamp registerDate, int status);

	void deleteById(Integer id);

	MemberVO selectById(Integer id);

	List<MemberVO> selectAll();
	
	Map<Integer, MemberVO> selectAllToMap();
}
