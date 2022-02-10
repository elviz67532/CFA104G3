package com.member.model;

import core.dao.CoreDao;

public interface MemberDAO extends CoreDao<MemberVO, Integer> {

	String login(String account, String password);

}
