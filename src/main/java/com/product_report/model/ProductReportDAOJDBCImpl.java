package com.product_report.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import core.DualKey;
import core.util.SQLUtil;

public class ProductReportDAOJDBCImpl implements ProductReportDAO {
	private static final String GET_ALL_STMT = "select * from PRODCUT_REPORT";
	private static final String GET_ONE_STMT = "select PRODRP_PROD_ID, PRODRP_MEM_ID, PRODRP_CONTENT, PRODRP_DATE, PRODRP_PHOTO, PRODRP_STATUS from PRODCUT_REPORT where PRODRP_PROD_ID = ? and PRODRP_MEM_ID = ?";
	private static final String INSERT_STMT = "insert into PRODCUT_REPORT"
			+ "(PRODRP_PROD_ID, PRODRP_MEM_ID, PRODRP_CONTENT, PRODRP_DATE, PRODRP_PHOTO, PRODRP_STATUS) "
			+ "values (?, ?, ?, ?, ?, ?)";
	private static final String DELETE = "delete from PRODCUT_REPORT where PRODRP_MEM_ID = ? and PRODRP_PROD_ID = ?";
	private static final String UPDATE = "UPDATE PRODCUT_REPORT set "
			+ "PRODRP_CONTENT = ?, PRODRP_DATE = ?, PRODRP_PHOTO = ?, PRODRP_STATUS = ? "
			+ "where PRODRP_MEM_ID = ? and PRODRP_PROD_ID = ?";
	private static final String CHANGE_STATUS = "update PRODCUT_REPORT set PRODRP_STATUS = ? where PRODRP_PROD_ID = ? and PRODRP_MEM_ID = ?";
	private static final String GET_ONE_ID = "select * from PRODCUT_REPORT where PRODRP_MEM_ID = ? order by PRODRP_PROD_ID";
	
	static {
		try {
			Class.forName(SQLUtil.DRIVER);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	@Override
	public int insert(ProductReportVO vo) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int insertedRow;

		try {
			con = DriverManager.getConnection(SQLUtil.URL, SQLUtil.USER, SQLUtil.PASSWORD);
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setInt(1, vo.getProductId());
			pstmt.setInt(2, vo.getMemberId());
			pstmt.setString(3, vo.getContent());
			pstmt.setTimestamp(4, vo.getDate());
			pstmt.setBytes(5, vo.getPhoto());
			pstmt.setInt(6, vo.getStatus());

			insertedRow = pstmt.executeUpdate();
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
		} finally {
			SQLUtil.closeResource(con, pstmt, null);
		}

		return insertedRow;
	}

	@Override
	public int update(ProductReportVO vo) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int updateRow;

		try {
			con = DriverManager.getConnection(SQLUtil.URL, SQLUtil.USER, SQLUtil.PASSWORD);
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setString(1, vo.getContent());
			pstmt.setTimestamp(2, vo.getDate());
			pstmt.setBytes(3, vo.getPhoto());
			pstmt.setInt(4, vo.getStatus());
			pstmt.setInt(5, vo.getMemberId());
			pstmt.setInt(6, vo.getProductId());
			
			updateRow = pstmt.executeUpdate();
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
		} finally {
			SQLUtil.closeResource(con, pstmt, null);
		}

		return updateRow;
	}

	@Override
	public List<ProductReportVO> selectAll() {
		List<ProductReportVO> list = new ArrayList<ProductReportVO>();
		ProductReportVO vo = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = DriverManager.getConnection(SQLUtil.URL, SQLUtil.USER, SQLUtil.PASSWORD);
			pstmt = con.prepareStatement(GET_ALL_STMT);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				vo = new ProductReportVO();
				vo.setProductId(rs.getInt("PRODRP_PROD_ID"));
				vo.setMemberId(rs.getInt("PRODRP_MEM_ID"));
				vo.setContent(rs.getString("PRODRP_CONTENT"));
				vo.setDate(rs.getTimestamp("PRODRP_DATE"));
				vo.setPhoto(rs.getBytes("PRODRP_PHOTO"));
				vo.setStatus(rs.getInt("PRODRP_STATUS"));
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
	public ProductReportVO selectById(DualKey<Integer, Integer> id) {
		ProductReportVO vo = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = DriverManager.getConnection(SQLUtil.URL, SQLUtil.USER, SQLUtil.PASSWORD);
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setInt(1, id.getK1());
			pstmt.setInt(2, id.getK2());

			rs = pstmt.executeQuery();

			while (rs.next()) {
				vo = new ProductReportVO();
				vo.setProductId(rs.getInt("PRODRP_PROD_ID"));
				vo.setMemberId(rs.getInt("PRODRP_MEM_ID"));
				vo.setContent(rs.getString("PRODRP_CONTENT"));
				vo.setDate(rs.getTimestamp("PRODRP_DATE"));
				vo.setPhoto(rs.getBytes("PRODRP_PHOTO"));
				vo.setStatus(rs.getInt("PRODRP_STATUS"));
			}
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
		} finally {
			SQLUtil.closeResource(con, pstmt, rs);
		}

		return vo;
	}

	@Override
	public int deleteById(DualKey<Integer, Integer>id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int deleteRow;

		try {
			con = DriverManager.getConnection(SQLUtil.URL, SQLUtil.USER, SQLUtil.PASSWORD);
			pstmt = con.prepareStatement(DELETE);

			pstmt.setInt(1, id.getK1());
			pstmt.setInt(2, id.getK2());

			deleteRow = pstmt.executeUpdate();
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
		} finally {
			SQLUtil.closeResource(con, pstmt, null);
		}

		return deleteRow;
	}
	
	@Override
	public ProductReportVO getOneById(int memberId) {
		ProductReportVO vo = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = DriverManager.getConnection(SQLUtil.URL, SQLUtil.USER, SQLUtil.PASSWORD);
			pstmt = con.prepareStatement(GET_ONE_ID);

			pstmt.setInt(1, memberId);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				vo = new ProductReportVO();
				vo.setProductId(rs.getInt("PRODRP_PROD_ID"));
				vo.setMemberId(rs.getInt("PRODRP_MEM_ID"));
				vo.setContent(rs.getString("PRODRP_CONTENT"));
				vo.setDate(rs.getTimestamp("PRODRP_DATE"));
				vo.setPhoto(rs.getBytes("PRODRP_PHOTO"));
				vo.setStatus(rs.getInt("PRODRP_STATUS"));
			}
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
		} finally {
			SQLUtil.closeResource(con, pstmt, rs);
		}

		return vo;
	}
	
	@Override
	public int changeStatus(ProductReportVO vo) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int updateRow;
	
		
		
		try {
			con = DriverManager.getConnection(SQLUtil.URL, SQLUtil.USER, SQLUtil.PASSWORD);
			pstmt = con.prepareStatement(CHANGE_STATUS);
						
			pstmt.setInt(1, vo.getStatus());						
			
			pstmt.setInt(2, vo.getProductId());
									
			pstmt.setInt(3, vo.getMemberId());
						
			
			updateRow = pstmt.executeUpdate();
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
		} finally {
			SQLUtil.closeResource(con, pstmt, null);
		}
						
		return updateRow;
	}
	
}
