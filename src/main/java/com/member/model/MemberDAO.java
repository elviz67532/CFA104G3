package com.member.model;

import com.member.model.MemberVO;

import core.dao.CoreDao;

public interface MemberDAO extends CoreDao<MemberVO, Integer> {

	MemberVO login(String account, String password);

	MemberVO forgetpassword(String email);

	MemberVO findByName(String name);

	int veriftyCode(Integer id,String code);

	int updateStatus(Integer id,Integer status);

	
}