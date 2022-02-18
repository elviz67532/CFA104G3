package com.notification.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import core.util.SQLUtil;

public class NotificationDAOJDBCImpl implements NotificationDAO {
	private static final String GET_ALL_STMT = "select * from NOTIFICATION order by NOTIF_ID";
	private static final String GET_ONE_STMT = "select * from NOTIFICATION where NOTIF_ID = ?";
	private static final String INSERT_STMT = "insert into NOTIFICATION(NOTIF_MEM_ID, NOTIF_TIME, NOTIF_CONTENT, NOTIF_TYPE, NOTIF_VIEWED) values(?, ?, ?, ?, ?)";
	private static final String DELETE = "delete from NOTIFICATION where NOTIF_ID = ?";
	private static final String UPDATE = "update NOTIFICATION set NOTIF_MEM_ID = ?, NOTIF_TIME = ?, NOTIF_CONTENT = ?, NOTIF_TYPE = ?, NOTIF_VIEWED = ? where NOTIF_ID = ?";
	//------------------------------------------------------------------
	private static final String GET_MEM_NOTIFY_STMT = "select * from NOTIFICATION where NOTIF_MEM_ID = ?";
	private static final String GET_MEM_UNVIEWED_NOTIFY_STMT = "select * from NOTIFICATION where NOTIF_MEM_ID = ? OR NOTIF_VIEWED = ?";
	
	static {
		try {
			Class.forName(SQLUtil.DRIVER);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	@Override
	public int insert(NotificationVO pojo) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int insertedRow;

		try {
			con = DriverManager.getConnection(SQLUtil.URL, SQLUtil.USER, SQLUtil.PASSWORD);
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setInt(1, pojo.getMemberId());
			pstmt.setTimestamp(2, pojo.getNotifyTime());
			pstmt.setString(3, pojo.getContent());
			pstmt.setInt(4, pojo.getType());
			pstmt.setBoolean(5, pojo.getViewed());
			
			insertedRow = pstmt.executeUpdate();
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
		} finally {
			SQLUtil.closeResource(con, pstmt, null);
		}

		return insertedRow;
	}

	@Override
	public int deleteById(Integer id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int deleteRow;

		try {
			con = DriverManager.getConnection(SQLUtil.URL, SQLUtil.USER, SQLUtil.PASSWORD);
			pstmt = con.prepareStatement(DELETE);

			pstmt.setInt(1, id);

			deleteRow = pstmt.executeUpdate();
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
		} finally {
			SQLUtil.closeResource(con, pstmt, null);
		}

		return deleteRow;
	}

	@Override
	public int update(NotificationVO pojo) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int updateRow;

		try {
			con = DriverManager.getConnection(SQLUtil.URL, SQLUtil.USER, SQLUtil.PASSWORD);
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setInt(1, pojo.getMemberId());
			pstmt.setTimestamp(2, pojo.getNotifyTime());
			pstmt.setString(3, pojo.getContent());
			pstmt.setInt(4, pojo.getType());
			pstmt.setBoolean(5, pojo.getViewed());
			pstmt.setInt(6, pojo.getId());

			updateRow = pstmt.executeUpdate();
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
		} finally {
			SQLUtil.closeResource(con, pstmt, null);
		}

		return updateRow;
	}

	@Override
	public NotificationVO selectById(Integer id) {
		NotificationVO vo = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = DriverManager.getConnection(SQLUtil.URL, SQLUtil.USER, SQLUtil.PASSWORD);
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setInt(1, id);

			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				vo = new NotificationVO();
				vo.setId(rs.getInt("NOTIF_ID"));
				vo.setMemberId(rs.getInt("NOTIF_MEM_ID"));
				vo.setNotifyTime(rs.getTimestamp("NOTIF_TIME"));
				vo.setContent(rs.getString("NOTIF_CONTENT"));
				vo.setType(rs.getInt("NOTIF_TYPE"));
				vo.setViewed(rs.getBoolean("NOTIF_VIEWED"));
			}
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
		} finally {
			SQLUtil.closeResource(con, pstmt, rs);
		}

		return vo;
	}

	@Override
	public List<NotificationVO> selectAll() {
		List<NotificationVO> list = new ArrayList<>();
		NotificationVO vo = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = DriverManager.getConnection(SQLUtil.URL, SQLUtil.USER, SQLUtil.PASSWORD);
			pstmt = con.prepareStatement(GET_ALL_STMT);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				vo = new NotificationVO();
				vo.setId(rs.getInt("NOTIF_ID"));
				vo.setMemberId(rs.getInt("NOTIF_MEM_ID"));
				vo.setNotifyTime(rs.getTimestamp("NOTIF_TIME"));
				vo.setContent(rs.getString("NOTIF_CONTENT"));
				vo.setType(rs.getInt("NOTIF_TYPE"));
				vo.setViewed(rs.getBoolean("NOTIF_VIEWED"));
				list.add(vo);
			}
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
		} finally {
			SQLUtil.closeResource(con, pstmt, rs);
		}

		return list;
	}
	
	//----------------------------------------------------------------------

	@Override
	public List<NotificationVO> selectMemberNotifications(Integer memberId) {
		List<NotificationVO> list = new ArrayList<>();
		NotificationVO vo = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = DriverManager.getConnection(SQLUtil.URL, SQLUtil.USER, SQLUtil.PASSWORD);
			pstmt = con.prepareStatement(GET_MEM_NOTIFY_STMT);

			pstmt.setInt(1, memberId);

			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				vo = new NotificationVO();
				vo.setId(rs.getInt("NOTIF_ID"));
				vo.setMemberId(rs.getInt("NOTIF_MEM_ID"));
				vo.setNotifyTime(rs.getTimestamp("NOTIF_TIME"));
				vo.setContent(rs.getString("NOTIF_CONTENT"));
				vo.setType(rs.getInt("NOTIF_TYPE"));
				vo.setViewed(rs.getBoolean("NOTIF_VIEWED"));
				list.add(vo);
			}
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
		} finally {
			SQLUtil.closeResource(con, pstmt, rs);
		}

		return list;
	}

	@Override
	public List<NotificationVO> selectMemberUnviewNotifications(Integer memberId) {
		List<NotificationVO> list = new ArrayList<>();
		NotificationVO vo = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = DriverManager.getConnection(SQLUtil.URL, SQLUtil.USER, SQLUtil.PASSWORD);
			pstmt = con.prepareStatement(GET_MEM_UNVIEWED_NOTIFY_STMT);

			pstmt.setInt(1, memberId);
			pstmt.setBoolean(2, false);

			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				vo = new NotificationVO();
				vo.setId(rs.getInt("NOTIF_ID"));
				vo.setMemberId(rs.getInt("NOTIF_MEM_ID"));
				vo.setNotifyTime(rs.getTimestamp("NOTIF_TIME"));
				vo.setContent(rs.getString("NOTIF_CONTENT"));
				vo.setType(rs.getInt("NOTIF_TYPE"));
				vo.setViewed(rs.getBoolean("NOTIF_VIEWED"));
				list.add(vo);
			}
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
		} finally {
			SQLUtil.closeResource(con, pstmt, rs);
		}

		return list;
	}
	
	@Override
	public int updateNotificationsToView(List<Integer> ids) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int updateRow = -1;
		
		StringBuffer sb = new StringBuffer();
		sb.append("update NOTIFICATION set NOTIF_VIEWED = ? where "); 
		
		for (int i = 0; i < ids.size(); i++) {
			sb.append("NOTIF_ID = ?");
			if (i < ids.size() - 1) {
				sb.append(" OR ");
			}
		}

		try {
			con = DriverManager.getConnection(SQLUtil.URL, SQLUtil.USER, SQLUtil.PASSWORD);
			pstmt = con.prepareStatement(sb.toString());

			pstmt.setBoolean(1, true);
			for (int i = 0; i < ids.size(); i++) {
				pstmt.setInt(i + 2, ids.get(i));
			}

			updateRow = pstmt.executeUpdate();
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
		} finally {
			SQLUtil.closeResource(con, pstmt, null);
		}

		return updateRow;
	}
}
