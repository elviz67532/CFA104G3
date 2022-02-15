package com.server_manager_auth.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import core.DualKey;
import core.util.SQLUtil;

public class ServerManagerAuthDAOJDBCImpl implements ServerManagerAuthDAO{

	// SQL 
	private static final String INSERT_STMT = "INSERT INTO SERVERMANAGERAUTH (SMGEAUTH_ID, SMGR_ID) VALUES (?, ?)";
	private static final String DELETE_STMT = "DELETE FROM SERVERMANAGERAUTH WHERE SMGEAUTH_ID=? AND SMGR_ID=?";
	private static final String SELECT_BY_ID_STMT = "SELECT * FROM SERVERMANAGERAUTH WHERE SMGEAUTH_ID=? AND SMGR_ID=?";
	private static final String GET_ALL_STMT = "SELECT * FROM SERVERMANAGERAUTH";

	static {
		try {
			Class.forName(SQLUtil.DRIVER);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	
	@Override
	public int insert(ServerManagerAuthVO serverManagerAuthVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int row = 0;
		try {
			con = DriverManager.getConnection(SQLUtil.URL, SQLUtil.USER, SQLUtil.PASSWORD);
			pstmt = con.prepareStatement(INSERT_STMT);
			pstmt.setInt(1, serverManagerAuthVO.getSmgeAuthId());
			pstmt.setInt(2, serverManagerAuthVO.getSmgrId());
			
			row = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			SQLUtil.closeResource(con, pstmt, null);
		}
		return row;
	}
	
	@Override
	public List<ServerManagerAuthVO> getAll() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<ServerManagerAuthVO> list = new ArrayList<ServerManagerAuthVO>();
		try {
			con = DriverManager.getConnection(SQLUtil.URL, SQLUtil.USER, SQLUtil.PASSWORD);
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();
			ServerManagerAuthVO serverManagerAuthVO = null;
			while(rs.next()) {
				serverManagerAuthVO = new ServerManagerAuthVO();
				serverManagerAuthVO.setSmgeAuthId(rs.getInt("SMGEAUTH_ID"));
				serverManagerAuthVO.setSmgrId(rs.getInt("SMGR_ID"));
				
				list.add(serverManagerAuthVO);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			SQLUtil.closeResource(con, pstmt, rs);			
		}
		return list;
	}

	@Override
	public int deleteById(DualKey<Integer, Integer> id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int row = 0;
		try {
			con = DriverManager.getConnection(SQLUtil.URL, SQLUtil.USER, SQLUtil.PASSWORD);
			pstmt = con.prepareStatement(DELETE_STMT);
			pstmt.setInt(1, id.getK1());
			pstmt.setInt(2, id.getK2());
			
			row = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			SQLUtil.closeResource(con, pstmt, null);
		}
		return row;
	}

	@Override
	public ServerManagerAuthVO selectById(DualKey<Integer, Integer> id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ServerManagerAuthVO serverManagerAuthVO = null;		
		try {
			con = DriverManager.getConnection(SQLUtil.URL, SQLUtil.USER, SQLUtil.PASSWORD);
			pstmt = con.prepareStatement(SELECT_BY_ID_STMT);
			pstmt.setInt(1, id.getK1());
			pstmt.setInt(2, id.getK2());
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				serverManagerAuthVO = new ServerManagerAuthVO();
				serverManagerAuthVO.setSmgeAuthId(rs.getInt("SMGEAUTH_ID"));
				serverManagerAuthVO.setSmgrId(rs.getInt("SMGR_ID"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			SQLUtil.closeResource(con, pstmt, rs);			
		}
		
		return serverManagerAuthVO;
	}

}
