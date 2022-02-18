package com.server_manager.model;

import java.io.Serializable;
import java.util.List;

import com.server_manager_auth.model.ServerManagerAuthVO;

import lombok.Data;

@Data
public class ServerManagerVO implements Serializable{
	private Integer smgrId;
	private String smgrEmail;
	private String smgrAccount;
	private String smgrPassword;
	private String smgrName;
	private String smgrPhone;
	private Integer smgrGender;
	private String smgrAddress;
	//該員工擁有的角色
	private List<ServerManagerAuthVO> authList;
}
