package com.member.model;

import java.sql.Timestamp;
import java.util.List;

public class MemberServiceImpl implements MemberService {
	private MemberDAOJDBCImpl dao;

	public MemberServiceImpl() {
		dao = new MemberDAOJDBCImpl();
	}

	public MemberVO insert(String email, String account, String password, String nickname, String name, String phone,
			int gender, String city, String cityArea, String address, String code, byte[] avatar,
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

	public MemberVO update(String email, String account, String password, String nickname, String name, String phone,
			int gender, String city, String cityArea, String address, String code, byte[] avatar,
			Timestamp registerDate, int status) {

		MemberVO memberVO = new MemberVO();

		memberVO = new MemberVO();
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

	@Override
	public MemberVO selectById(Integer id) {
		return dao.selectById(id);
	}

	public List<MemberVO> selectAll() {
		return dao.selectAll();
	}

	@Override
	public MemberVO login(String account, String password) {
		return dao.login(account, password);
	}

	@Override
	public MemberVO forgetpassword(String email) {
		return dao.forgetpassword(email);
	}

	@Override
	public MemberVO getOneMemberByName(String name) {
		return dao.findByName(name);
	}

	@Override
	public MemberVO updateMember(MemberVO memberVO) {
		dao.update(memberVO);
		return memberVO;
	}

	@Override
	public MemberVO register(String email, String account, String password, String nickname, String name, String phone,
			Integer gender, String city, String cityArea, String address, String code, byte[] avatar) {

		Timestamp timestamp = new Timestamp(System.currentTimeMillis());

		MemberVO memberVO = new MemberVO();
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
		memberVO.setRegisterDate(timestamp);
		memberVO.setStatus(0);
		int id = dao.insert(memberVO);
		memberVO.setId(id);
  
		return memberVO;

	}

	@Override
	public MemberVO frontMemberUpdate(String email, String password, String nickname, String name, String phone,
			String city, String cityArea, String address, byte[] avatar, Integer id) {
		MemberVO memberVO = new MemberVO();
//		Timestamp timestamp = new Timestamp(System.currentTimeMillis());
		memberVO = new MemberVO();
		memberVO.setEmail(email);
		memberVO.setPassword(password);
		memberVO.setNickname(nickname);
		memberVO.setName(name);
		memberVO.setPhone(phone);
		memberVO.setCity(city);
		memberVO.setCityArea(cityArea);
		memberVO.setAddress(address);
		memberVO.setAvatar(avatar);
		memberVO.setId(id);
		dao.update(memberVO);
		return memberVO;
	}

	@Override
	public boolean veriftyCode(Integer id, String code) {

		return dao.veriftyCode(id, code) > 0;

	}

	private boolean updateStatus(Integer id, Integer status) {
		return dao.updateStatus(id, status) > 0;
	}

	@Override
	public boolean banMember(Integer id) {
		return updateStatus(id, 2);
	}

	@Override
	public boolean restoreMember(Integer id) {
		return updateStatus(id, 1);
	}
}

//public MemberVO genVerifyCode(int memberId) {
//	
//	RandomPassword rPd =new RandomPassword();
//	String randomPassword = rPd.getRandomPassword();
//	dao.update(memberId);
//	return randomPassword;
//}
