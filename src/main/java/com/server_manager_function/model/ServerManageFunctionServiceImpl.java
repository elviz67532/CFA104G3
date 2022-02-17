package com.server_manager_function.model;

import java.util.List;

public class ServerManageFunctionServiceImpl implements ServerManageFunctionService {
	private ServerManageFunctionDAO	dao;
	
	public ServerManageFunctionServiceImpl() {
		dao = new ServerManageFunctionDAOJDBCImpl();
	}
	
	public void insert(Integer smgeFuncId, String smgeFunc) {
		
		int row = dao.insert(smgeFuncId, smgeFunc);
	}
	
	public ServerManageFunctionVO update(ServerManageFunctionVO serverManageFunctionVO) {
		
		int row = dao.update(serverManageFunctionVO);
		
		return serverManageFunctionVO;
	}
	
	public void delete(Integer smgeFuncId) {
		
		int row = dao.delete(smgeFuncId);
	}
	
	public ServerManageFunctionVO GetFromId(Integer smgeFuncId) {
		
		ServerManageFunctionVO serverManageFunctionVO = dao.GetFromId(smgeFuncId);
		
		return serverManageFunctionVO;
	}
	
	public List<ServerManageFunctionVO> getAll(){
		
		List<ServerManageFunctionVO> list = dao.getAll();
		
		return list;
	}

}
