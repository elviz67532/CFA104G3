package com.server_manager.model;

import java.util.List;

public class ServerManagerServiceImpl implements ServerManagerService{

	private ServerManagerDAO dao;
	
	public ServerManagerServiceImpl() {
		dao = new ServerManagerDAOJDBCImpl(); 
	}
	
	public ServerManagerVO insert(Integer smgrId, String smgrEmail, String smgrAccount, 
			String smgrPassword, String smgrName, String smgrPhone, Integer smgrGender, 
			String smgrAddress) {
		
		ServerManagerVO smVO = new ServerManagerVO();
		
		smVO.setSmgrId(smgrId);
		smVO.setSmgrEmail(smgrEmail);
		smVO.setSmgrAccount(smgrAccount);
		smVO.setSmgrPassword(smgrPassword);
		smVO.setSmgrName(smgrName);
		smVO.setSmgrPhone(smgrPhone);
		smVO.setSmgrGender(smgrGender);
		smVO.setSmgrAddress(smgrAddress);
		
		
		dao.insert(smVO);
		
		return smVO;
	}
	
	public ServerManagerVO update(ServerManagerVO serverManagerVO) {
		dao.update(serverManagerVO);
		
		return serverManagerVO;
	}
	
	public void delete(Integer smgrId) {
		dao.deleteById(smgrId);
	}
	
	public ServerManagerVO findByPrimaryKey(Integer smgrId) {
		ServerManagerVO vo =  dao.selectById(smgrId);
		return vo;
	}
	
	public List<ServerManagerVO> getAll(){
		List<ServerManagerVO> list = dao.selectAll();
		return list;
	}
	
	public ServerManagerVO findByAccount(String smgrAccount) {
		ServerManagerVO smVO = dao.findByAccount(smgrAccount);
		return smVO;
	}
	
//	public String findByAccount(String smgrAccount) {
//		String password = dao.findByAccount(smgrAccount);
//		return password;
//	}
	
	public Integer getId(String smgrAccount) {
		int id = dao.getId(smgrAccount);
		Integer idNew = Integer.valueOf(id);
		return idNew;
	}
}
