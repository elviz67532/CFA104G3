package com.move_request.model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import core.util.SQLUtil;

/**
 * If you can't see content below, it means your encoding isn't utf-8.
 * ------------------------------------------------------------------
 * DAO範例 本份類別會有大量註解，撰寫自己的類別時請減少使用註解
 * 
 * @author Elviz
 */
public class MoveRequestDAOJDBCImpl implements MoveRequestDAO {
	private static final String GET_ALL = "select * from MOVE_REQUEST order by MS_ID";
	private static final String GET_ONE = "select * from MOVE_REQUEST where MS_ID = ?";
	private static final String INSERT = "insert into MOVE_REQUEST"
			+ "(MS_MEM_ID, MS_FROMADDRESS, MS_TOADDRESS, MS_EVATIME, MS_OBJECT, MS_EVAPRICE, MS_MOVETIME, MS_EVALUATE, MS_DATE, MS_STATUS, MS_HANDLE) "
			+ "values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
	private static final String DELETE = "delete from MOVE_REQUEST where MS_ID = ?";
	private static final String UPDATE = "update MOVE_REQUEST set "
			+ "MS_FROMADDRESS = ?, MS_TOADDRESS = ?, MS_EVATIME = ?, MS_OBJECT = ?, MS_EVAPRICE = ?, MS_MOVETIME = ?, MS_EVALUATE = ?, MS_DATE = ?, MS_STATUS = ?, MS_HANDLE = ? "
			+ "where MS_ID = ?";
	//----------------------------------------------------------------------------------------
	private static final String CHANGE_STATUS = "update MOVE_REQUEST set MS_STATUS = ? where MS_ID = ?"; 
	private static final String GET_ALL_BY_MEMBER = "select * from MOVE_REQUEST where MS_MEM_ID = ? order by MS_ID"; 
	private static final String FIND_RESERVED_MOVEDATES = "select MS_MOVETIME from MOVE_REQUEST where MS_MOVETIME >= ?";  
	private static final String FIND_RESERVED_EVADATES = "select MS_EVATIME from MOVE_REQUEST where MS_EVATIME >= ?";
	private static final String CHANGE_PRICE = "update MOVE_REQUEST set MS_EVAPRICE = ? where MS_ID = ?"; 
	private static final String CHANGE_HANDLED = "update MOVE_REQUEST set MS_HANDLE = ? where MS_ID = ?"; 
	
	static {
		try {
			Class.forName(SQLUtil.DRIVER);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	@Override
	public int insert(MoveRequestVO vo) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int id = -1;

		try {
			con = DriverManager.getConnection(SQLUtil.URL, SQLUtil.USER, SQLUtil.PASSWORD);
			pstmt = con.prepareStatement(INSERT,  Statement.RETURN_GENERATED_KEYS);

			pstmt.setInt(1, vo.getMemberId());
			pstmt.setString(2, vo.getFromAddress());
			pstmt.setString(3, vo.getToAddress());
			pstmt.setTimestamp(4, vo.getEvaluateDate());
			pstmt.setString(5, vo.getItems());
			pstmt.setInt(6, vo.getEvaluatePrice());
			pstmt.setTimestamp(7, vo.getMoveDate());
			pstmt.setInt(8, vo.getEvaluateType());
			pstmt.setTimestamp(9, vo.getRequestDate());
			pstmt.setInt(10, vo.getStatus());
			pstmt.setBoolean(11, vo.getHandled());

			int insertedRow = pstmt.executeUpdate();
			if (insertedRow > 0) {
				ResultSet rs = pstmt.getGeneratedKeys();
				rs.next();
				id = rs.getInt(1);
			}
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
		} finally {
			SQLUtil.closeResource(con, pstmt, null);
		}

		return id;
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
	public int update(MoveRequestVO vo) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int updateRow;

		try {
			con = DriverManager.getConnection(SQLUtil.URL, SQLUtil.USER, SQLUtil.PASSWORD);
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setString(1, vo.getFromAddress());
			pstmt.setString(2, vo.getToAddress());
			pstmt.setTimestamp(3, vo.getEvaluateDate());
			pstmt.setString(4, vo.getItems());
			pstmt.setInt(5, vo.getEvaluatePrice());
			pstmt.setTimestamp(6, vo.getMoveDate());
			pstmt.setInt(7, vo.getEvaluateType());
			pstmt.setTimestamp(8, vo.getRequestDate());
			pstmt.setInt(9, vo.getStatus());
			pstmt.setBoolean(10, vo.getHandled());
			pstmt.setInt(11, vo.getId());

			updateRow = pstmt.executeUpdate();
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
		} finally {
			SQLUtil.closeResource(con, pstmt, null);
		}

		return updateRow;
	}

	@Override
	public MoveRequestVO selectById(Integer id) {
		MoveRequestVO vo = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = DriverManager.getConnection(SQLUtil.URL, SQLUtil.USER, SQLUtil.PASSWORD);
			pstmt = con.prepareStatement(GET_ONE);

			pstmt.setInt(1, id);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				vo = new MoveRequestVO();
				vo.setId(rs.getInt("MS_ID"));
				vo.setMemberId(rs.getInt("MS_MEM_ID"));
				vo.setFromAddress(rs.getString("MS_FROMADDRESS"));
				vo.setToAddress(rs.getString("MS_TOADDRESS"));
				vo.setEvaluateDate(rs.getTimestamp("MS_EVATIME"));
				vo.setItems(rs.getString("MS_OBJECT"));
				vo.setEvaluatePrice(rs.getInt("MS_EVAPRICE"));
				vo.setMoveDate(rs.getTimestamp("MS_MOVETIME"));
				vo.setEvaluateType(rs.getInt("MS_EVALUATE"));
				vo.setRequestDate(rs.getTimestamp("MS_DATE"));
				vo.setStatus(rs.getInt("MS_STATUS"));
				vo.setHandled(rs.getBoolean("MS_HANDLE"));
			}
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
		} finally {
			SQLUtil.closeResource(con, pstmt, rs);
		}

		return vo;
	}

	@Override
	public List<MoveRequestVO> selectAll() {
		List<MoveRequestVO> list = new ArrayList<MoveRequestVO>();
		MoveRequestVO vo = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = DriverManager.getConnection(SQLUtil.URL, SQLUtil.USER, SQLUtil.PASSWORD);
			pstmt = con.prepareStatement(GET_ALL);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				vo = new MoveRequestVO();
				vo.setId(rs.getInt("MS_ID"));
				vo.setMemberId(rs.getInt("MS_MEM_ID"));
				vo.setFromAddress(rs.getString("MS_FROMADDRESS"));
				vo.setToAddress(rs.getString("MS_TOADDRESS"));
				vo.setEvaluateDate(rs.getTimestamp("MS_EVATIME"));
				vo.setItems(rs.getString("MS_OBJECT"));
				vo.setEvaluatePrice(rs.getInt("MS_EVAPRICE"));
				vo.setMoveDate(rs.getTimestamp("MS_MOVETIME"));
				vo.setEvaluateType(rs.getInt("MS_EVALUATE"));
				vo.setRequestDate(rs.getTimestamp("MS_DATE"));
				vo.setStatus(rs.getInt("MS_STATUS"));
				vo.setHandled(rs.getBoolean("MS_HANDLE"));
				list.add(vo);
			}
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
		} finally {
			SQLUtil.closeResource(con, pstmt, rs);
		}

		return list;
	}
	
	//----------------------------------------------------------------------------

	@Override
	public int changeStatus(int requestId, int statusCode) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int updateRow;

		try {
			con = DriverManager.getConnection(SQLUtil.URL, SQLUtil.USER, SQLUtil.PASSWORD);
			pstmt = con.prepareStatement(CHANGE_STATUS);

			pstmt.setInt(1, statusCode);
			pstmt.setInt(2, requestId);

			updateRow = pstmt.executeUpdate();
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
		} finally {
			SQLUtil.closeResource(con, pstmt, null);
		}

		return updateRow;
	}

	@Override
	public List<MoveRequestVO> selectAllByMebmerId(int memberId) {
		List<MoveRequestVO> list = new ArrayList<MoveRequestVO>();
		MoveRequestVO vo = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = DriverManager.getConnection(SQLUtil.URL, SQLUtil.USER, SQLUtil.PASSWORD);
			pstmt = con.prepareStatement(GET_ALL_BY_MEMBER);
			
			pstmt.setInt(1, memberId);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				vo = new MoveRequestVO();
				vo.setId(rs.getInt("MS_ID"));
				vo.setMemberId(rs.getInt("MS_MEM_ID"));
				vo.setFromAddress(rs.getString("MS_FROMADDRESS"));
				vo.setToAddress(rs.getString("MS_TOADDRESS"));
				vo.setEvaluateDate(rs.getTimestamp("MS_EVATIME"));
				vo.setItems(rs.getString("MS_OBJECT"));
				vo.setEvaluatePrice(rs.getInt("MS_EVAPRICE"));
				vo.setMoveDate(rs.getTimestamp("MS_MOVETIME"));
				vo.setEvaluateType(rs.getInt("MS_EVALUATE"));
				vo.setRequestDate(rs.getTimestamp("MS_DATE"));
				vo.setStatus(rs.getInt("MS_STATUS"));
				vo.setHandled(rs.getBoolean("MS_HANDLE"));
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
	public List<Date> getUnAvaliableEvaDates(Date today) {
		return getAvaliableDates(today, FIND_RESERVED_EVADATES);
	}

	@Override
	public List<Date> getUnavaliableMoveDates(Date today) {
		return getAvaliableDates(today, FIND_RESERVED_MOVEDATES);
	}
	
	private List<Date> getAvaliableDates(Date today, String stmt) {
		List<Date> list = new ArrayList<>();
		Date date = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = DriverManager.getConnection(SQLUtil.URL, SQLUtil.USER, SQLUtil.PASSWORD);
			pstmt = con.prepareStatement(stmt);
			
			pstmt.setDate(1, today);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				date = rs.getDate("MS_EVATIME");
				list.add(date);
			}
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
		} finally {
			SQLUtil.closeResource(con, pstmt, rs);
		}
		return list;
	}

	@Override
	public int changePrice(int requestId, int price) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int updateRow;

		try {
			con = DriverManager.getConnection(SQLUtil.URL, SQLUtil.USER, SQLUtil.PASSWORD);
			pstmt = con.prepareStatement(CHANGE_PRICE);

			pstmt.setInt(1, price);
			pstmt.setInt(2, requestId);

			updateRow = pstmt.executeUpdate();
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
		} finally {
			SQLUtil.closeResource(con, pstmt, null);
		}
		
		return updateRow;
	}

	@Override
	public int changeHandled(int requestId) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int updateRow;

		try {
			con = DriverManager.getConnection(SQLUtil.URL, SQLUtil.USER, SQLUtil.PASSWORD);
			pstmt = con.prepareStatement(CHANGE_HANDLED);

			pstmt.setBoolean(1, true);
			pstmt.setInt(2, requestId);

			updateRow = pstmt.executeUpdate();
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
		} finally {
			SQLUtil.closeResource(con, pstmt, null);
		}
		
		return updateRow;
	}
}
