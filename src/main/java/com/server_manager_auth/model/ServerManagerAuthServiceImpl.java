package com.server_manager_auth.model;

import java.util.List;

import core.DualKey;

public class ServerManagerAuthServiceImpl implements ServerManagerAuthService{

	private ServerManagerAuthDAO dao;
	
	public ServerManagerAuthVO insert(ServerManagerAuthVO serverManagerAuthVO) {
		dao.insert(serverManagerAuthVO);
		
		return serverManagerAuthVO;
	}
	
	public List<ServerManagerAuthVO> getAll(){
		List<ServerManagerAuthVO> list = dao.getAll();
		return list;
	}
	
	public void deleteById(DualKey<Integer, Integer> id) {
		dao.deleteById(id);
	}
	
	public ServerManagerAuthVO selectById(DualKey<Integer, Integer> id) {
		ServerManagerAuthVO vo = dao.selectById(id);
		return vo;
	}

}
