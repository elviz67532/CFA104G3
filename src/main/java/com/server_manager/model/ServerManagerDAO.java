package com.server_manager.model;

import core.dao.CoreDao;

public interface ServerManagerDAO extends CoreDao<ServerManagerVO, Integer> {

	public String findByAccount(String smgrAccount);
	
	public Integer getId(String smgrAccount);
}
