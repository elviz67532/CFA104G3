package com.server_manager_function.model;

import java.util.List;

public interface ServerManageFunctionDAO{
	public int insert(Integer smgeFuncId, String smgeFunc);
	// 刪除
	public int delete(Integer smgeFuncId);
	// 修改
	public int update(ServerManageFunctionVO serverManageFunctionVO);
	// 查詢
	public ServerManageFunctionVO GetFromId(Integer smgeFuncId);
	
	public List<ServerManageFunctionVO> getAll();	
}
