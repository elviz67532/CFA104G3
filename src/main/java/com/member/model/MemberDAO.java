package com.member.model;

import com.member.model.MemberVO;

import core.dao.CoreDao;

public interface MemberDAO extends CoreDao<MemberVO, Integer> {

	MemberVO login(String account, String password);

	MemberVO forgetpassword(String email);

	MemberVO findByName(String name);



	int updateStatus(Integer id,Integer status);

	int veriftyCode(Integer status, Integer id, String code);

	int status(MemberVO vo);

	MemberVO findByAccount(String account);

	MemberVO findByEmail(String email);

	
}