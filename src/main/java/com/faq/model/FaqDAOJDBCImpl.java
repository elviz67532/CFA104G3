package com.faq.model;

import java.sql.*;
import java.util.*;

import core.util.SQLUtil;

public class FaqDAOJDBCImpl implements FaqDAO {

	String driver = "com.mysql.cj.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/CFA104G3?serverTimezone=Asia/Taipei";
	String userid = "root";
	String passwd = "password";

	private static final String GET_ALL_STMT = "select * from FAQ order by FAQ_ID";
	private static final String GET_ONE_STMT = "select * from FAQ where FAQ_ID = ?";
	private static final String INSERT_STMT = "insert into FAQ" + "(FAQ_ID, FAQ_QUESTION, FAQ_ANSWER) "
			+ "values(?, ?, ?)";
	private static final String DELETE = "delete from FAQ where FAQ_ID = ?";
	private static final String UPDATE = "update FAQ set " + "FAQ_QUESTION = ?, FAQ_ANSWER = ? " + "where FAQ_ID = ?";

	
	static {
		try {
			Class.forName(SQLUtil.DRIVER);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	@Override
	public int insert(FaqVO vo) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int insertedRow;

		try {
			con = DriverManager.getConnection(SQLUtil.URL, SQLUtil.USER, SQLUtil.PASSWORD);
			pstmt = con.prepareStatement(INSERT_STMT);
			
			pstmt.setInt(1, vo.getId());
			pstmt.setString(2, vo.getQuestion());
			pstmt.setString(3, vo.getAnswer());

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
	public int update(FaqVO vo) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int updateRow;

		try {
			con = DriverManager.getConnection(SQLUtil.URL, SQLUtil.USER, SQLUtil.PASSWORD);
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setString(1, vo.getQuestion());
			pstmt.setString(2, vo.getAnswer());
			pstmt.setInt(3, vo.getId());

			updateRow = pstmt.executeUpdate();
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
		} finally {
			SQLUtil.closeResource(con, pstmt, null);
		}

		return updateRow;
	}

	@Override
	public FaqVO selectById(Integer id) {
		FaqVO vo = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = DriverManager.getConnection(SQLUtil.URL, SQLUtil.USER, SQLUtil.PASSWORD);
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setInt(1, id);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				vo = new FaqVO();
				vo.setId(rs.getInt("FAQ_ID"));
				vo.setQuestion(rs.getString("FAQ_QUESTION"));
				vo.setAnswer(rs.getString("FAQ_ANSWER"));
			}
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
		} finally {
			SQLUtil.closeResource(con, pstmt, rs);
		}

		return vo;
	}

	@Override
	public List<FaqVO> selectAll() {
		List<FaqVO> list = new ArrayList<FaqVO>();
		FaqVO vo = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = DriverManager.getConnection(SQLUtil.URL, SQLUtil.USER, SQLUtil.PASSWORD);
			pstmt = con.prepareStatement(GET_ALL_STMT);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				vo = new FaqVO();
				vo.setId(rs.getInt("FAQ_ID"));
				vo.setQuestion(rs.getString("FAQ_QUESTION"));
				vo.setAnswer(rs.getString("FAQ_ANSWER"));
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
	public FaqVO findByPrimaryKey(Integer id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<FaqVO> getAll() {
		// TODO Auto-generated method stub
		return null;
	}
}
