package com.member.model;

import java.sql.Timestamp;
import java.util.List;

public class MemberServiceImpl implements MemberService {
	private MemberDAOJDBCImpl dao;

	public MemberServiceImpl() {
		dao = new MemberDAOJDBCImpl();
	}

	public MemberVO insert( String email, String account, String password, String nickname, String name,
			String phone, int gender, String city, String cityArea, String address, String code, byte[] avatar,
			Timestamp registerDate, int status) {

		MemberVO memberVO = new MemberVO();

		memberVO = new MemberVO();
//		memberVO.setId(id);
		memberVO.setEmail(email);
		memberVO.setAccount(account);
		memberVO.setPassword(password);
		memberVO.setNickname(nickname);
		memberVO.setName(name);
		memberVO.setPhone(phone);
		memberVO.setGender(gender);
		memberVO.setCity(city);
		memberVO.setCityArea(cityArea);
		memberVO.setAddress(address);
		memberVO.setCode(code);
		memberVO.setAvatar(avatar);
		memberVO.setRegisterDate(registerDate);
		memberVO.setStatus(status);

		return memberVO;
	}

	public MemberVO update( String email, String account, String password, String nickname, String name,
			String phone, int gender, String city, String cityArea, String address, String code, byte[] avatar,
			Timestamp registerDate, int status) {

		MemberVO memberVO = new MemberVO();

		memberVO = new MemberVO();
//		memberVO.setId(id);
		memberVO.setEmail(email);
		memberVO.setAccount(account);
		memberVO.setPassword(password);
		memberVO.setNickname(nickname);
		memberVO.setName(name);
		memberVO.setPhone(phone);
		memberVO.setGender(gender);
		memberVO.setCity(city);
		memberVO.setCityArea(cityArea);
		memberVO.setAddress(address);
		memberVO.setCode(code);
		memberVO.setAvatar(avatar);
		memberVO.setRegisterDate(registerDate);
		memberVO.setStatus(status);

		return memberVO;
	}

	public void deleteById(Integer id) {
		dao.deleteById(id);
	}

	public MemberVO selectById(Integer id) {
		return dao.selectById(id);
	}

	public List<MemberVO> selectAll() {
		return dao.selectAll();
	}

	@Override
	public MemberVO login(String account,String password) {
		return null;
	}
	@Override
	public MemberVO forgetpassword(String email) {
		return dao.forgetpassword(email);
	}
	@Override
	public MemberVO getOneMemberByName(String name) {
		return dao.findByName(name);
	}
}
