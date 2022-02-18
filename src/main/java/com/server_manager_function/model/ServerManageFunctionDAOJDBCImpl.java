package com.server_manager_function.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import core.util.SQLUtil;

public class ServerManageFunctionDAOJDBCImpl implements ServerManageFunctionDAO {
	// SQL 
	private static final String INSERT_STMT = "INSERT INTO SERVERMANAGEFUNCTION (SMGEFUNC_ID, SMGEFUNC) VALUES (?, ?)";
	private static final String DELETE_STMT = "DELETE FROM SERVERMANAGEFUNCTION WHERE SMGEFUNC_ID=?";
	private static final String UPDATE_STMT = "UPDATE SERVERMANAGEFUNCTION SET SMGEFUNC=? WHERE SMGEFUNC_ID=?";
	private static final String GET_FROM_ID_STMT = "SELECT * FROM SERVERMANAGEFUNCTION WHERE SMGEFUNC_ID=?";
	private static final String GET_ALL_STMT = "SELECT * FROM SERVERMANAGEFUNCTION";
	
	static {
		try {
			Class.forName(SQLUtil.DRIVER);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	@Override
	public int insert(Integer smgeFuncId, String smgeFunc) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int row = 0;
		try {
			con = DriverManager.getConnection(SQLUtil.URL, SQLUtil.USER, SQLUtil.PASSWORD);
			pstmt = con.prepareStatement(INSERT_STMT);
			pstmt.setInt(1, smgeFuncId);
			pstmt.setString(2, smgeFunc);
			row = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			SQLUtil.closeResource(con, pstmt, null);
		}
		return row;
	}

	@Override
	public int delete(Integer smgeFuncId) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int row = 0;
		try {
			con = DriverManager.getConnection(SQLUtil.URL,SQLUtil.USER,SQLUtil.PASSWORD);
			pstmt = con.prepareStatement(DELETE_STMT);
			pstmt.setInt(1, smgeFuncId);
			row = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			SQLUtil.closeResource(con, pstmt, null);
		}
		return row;
	}

	@Override
	public int update(ServerManageFunctionVO serverManageFunctionVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int row = 0;
		try {
			con = DriverManager.getConnection(SQLUtil.URL,SQLUtil.USER,SQLUtil.PASSWORD);
			pstmt = con.prepareStatement(UPDATE_STMT);
			pstmt.setString(1, serverManageFunctionVO.getSmgeFunc());
			pstmt.setInt(2, serverManageFunctionVO.getSmgeFuncId());
			row = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			SQLUtil.closeResource(con, pstmt, null);
		}
		return row;
		
	}

	@Override
	public ServerManageFunctionVO GetFromId(Integer smgeFuncId) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;		
		ServerManageFunctionVO serverManageFunctionVO = null;

		try {
			con = DriverManager.getConnection(SQLUtil.URL,SQLUtil.USER,SQLUtil.PASSWORD);
			pstmt = con.prepareStatement(GET_FROM_ID_STMT);
			pstmt.setInt(1, smgeFuncId);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				serverManageFunctionVO = new ServerManageFunctionVO();
				serverManageFunctionVO.setSmgeFuncId(smgeFuncId);
				serverManageFunctionVO.setSmgeFunc(rs.getString("SMGEFUNC"));
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			SQLUtil.closeResource(con, pstmt, rs);
		}
		
		return serverManageFunctionVO;
	}

	@Override
	public List<ServerManageFunctionVO> getAll() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ServerManageFunctionVO serverManageFunctionVO = null;
		List<ServerManageFunctionVO> list = new ArrayList<ServerManageFunctionVO>();
		
		try {
			con = DriverManager.getConnection(SQLUtil.URL,SQLUtil.USER,SQLUtil.PASSWORD);
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				serverManageFunctionVO = new ServerManageFunctionVO();
				serverManageFunctionVO.setSmgeFuncId(rs.getInt(1));
				serverManageFunctionVO.setSmgeFunc(rs.getString(2));
				
				list.add(serverManageFunctionVO);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			SQLUtil.closeResource(con, pstmt, rs);
		}
		
		return list;
	}
}
