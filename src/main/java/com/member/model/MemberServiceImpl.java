package com.member.model;

import java.sql.Timestamp;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

public class MemberServiceImpl implements MemberService {
	private MemberDAO dao;

	public MemberServiceImpl() {
		dao = new MemberDAOJDBCImpl();
	}
	
	@Override
	public MemberVO insert(int id, String email, String account, String password, String nickname, String name,
			String phone, int gender, String city, String cityArea, String address, String code, byte[] avatar,
			Timestamp registerDate, int status) {

		MemberVO memberVO = new MemberVO();

		memberVO = new MemberVO();
		memberVO.setId(id);
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

	@Override
	public MemberVO update(int id, String email, String account, String password, String nickname, String name,
			String phone, int gender, String city, String cityArea, String address, String code, byte[] avatar,
			Timestamp registerDate, int status) {

		MemberVO memberVO = new MemberVO();

		memberVO = new MemberVO();
		memberVO.setId(id);
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

	@Override
	public void deleteById(Integer id) {
		dao.deleteById(id);
	}

	@Override
	public MemberVO selectById(Integer id) {
		return dao.selectById(id);
	}

	@Override
	public List<MemberVO> selectAll() {
		return dao.selectAll();
	}

	@Override
	public MemberVO login(String account, String password) {
		MemberVO memberVO = new MemberVO();
		memberVO.setAccount(account);
		memberVO.setPassword(password);
		return memberVO;
	}

	@Override
	public Map<Integer, MemberVO> selectAllToMap() {
		Map<Integer, MemberVO> map = new LinkedHashMap<>();
		List<MemberVO> selectAll = selectAll();
		for (MemberVO memberVO : selectAll) {
			map.put(memberVO.getId(), memberVO);
		}
		return map;
	}
}
