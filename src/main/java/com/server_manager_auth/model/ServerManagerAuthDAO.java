package com.server_manager_auth.model;

import java.util.List;

import core.DualKey;

public interface ServerManagerAuthDAO {
	public int insert(ServerManagerAuthVO serverManagerAuthVO);
	public List<ServerManagerAuthVO> getAll();
	public int deleteById(Integer id);
	public ServerManagerAuthVO selectById(DualKey<Integer, Integer> id);
	public List<ServerManagerAuthVO> selectByManager(Integer smgrId);
}
