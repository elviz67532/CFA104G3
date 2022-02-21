package com.server_manager_auth.model;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import core.DualKey;

public class ServerManagerAuthServiceImpl implements ServerManagerAuthService{

	private ServerManagerAuthDAO dao;
	
	public ServerManagerAuthServiceImpl() {
	  dao = new ServerManagerAuthDAOJDBCImpl();
	}
	
	public ServerManagerAuthVO insert(ServerManagerAuthVO serverManagerAuthVO) {
		dao.insert(serverManagerAuthVO);
		
		return serverManagerAuthVO;
	}
	
	public List<ServerManagerAuthVO> getAll(){
		List<ServerManagerAuthVO> list = dao.getAll();
		return list;
	}
	
	public void deleteById(Integer id) {
		dao.deleteById(id);
	}
	
	public ServerManagerAuthVO selectById(DualKey<Integer, Integer> id) {
		ServerManagerAuthVO vo = dao.selectById(id);
		return vo;
	}
	
	public List<ServerManagerAuthVO> selectByManager(Integer smgrId){
		List<ServerManagerAuthVO> list = null;
		list = dao.selectByManager(smgrId);
		return list;
	}

	public static void main(String[] args) {
		ServerManagerAuthServiceImpl sma = new ServerManagerAuthServiceImpl();
		Integer smgrId = 100;
		List<ServerManagerAuthVO> list = sma.selectByManager(smgrId);
		Iterator objs = list.iterator();
		System.out.println(list.size());
		while(objs.hasNext()) { // 為何一直跳print
			System.out.println(objs.next());
		}
	}
}
