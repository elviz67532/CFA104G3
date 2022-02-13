package com.product_order.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import core.util.SQLUtil;

public class ProductOrderDAOJDBCImpl implements ProductOrderDAO {

	String driver = "com.mysql.cj.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/CFA104G3?serverTimezone=Asia/Taipei";
	String userid = "root";
	String passwd = "password";

	private static final String GET_ALL_STMT = "select * from PRODUCT_ORDER order by PRODO_ID";
	private static final String GET_ONE_STMT = "select * from PRODUCT_ORDER where PRODO_ID = ?";
	private static final String INSERT_STMT = "insert into PRODUCT_ORDER"
			+ "(PRODO_ID, PRODO_PROD_ID, PRODO_MBUY_ID, PRODO_MSELL_ID, PRODO_NAME, PRODO_MOBILE, PRODO_ADDRESS, PRODO_DATE, PRODO_AMOUNT, PRODO_STATUS, PRODO_SUM) "
			+ "values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
	private static final String DELETE = "delete from PRODUCT_ORDER where PRODO_ID = ?";
	private static final String UPDATE = "update PRODUCT_ORDER set "
			+ "PRODO_NAME = ?, PRODO_MOBILE = ?, PRODO_ADDRESS = ?, PRODO_DATE = ?, PRODO_AMOUNT = ?, PRODO_STATUS = ?, PRODO_SUM = ? "
			+ "where PRODO_ID = ?";

	static {
		try {
			Class.forName(SQLUtil.DRIVER);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	@Override
	public int insert(ProductOrderVO peroductOrderVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int insertedRow;

		try {
			con = DriverManager.getConnection(SQLUtil.URL, SQLUtil.USER, SQLUtil.PASSWORD);
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setInt(1, peroductOrderVO.getId());
			pstmt.setInt(2, peroductOrderVO.getProductId());
			pstmt.setInt(3, peroductOrderVO.getCustomerMemberId());
			pstmt.setInt(4, peroductOrderVO.getSellerMemberId());
			pstmt.setString(5, peroductOrderVO.getProductName());
			pstmt.setString(6, peroductOrderVO.getPhone());
			pstmt.setString(7, peroductOrderVO.getAddress());
			pstmt.setTimestamp(8, peroductOrderVO.getDate());
			pstmt.setInt(9, peroductOrderVO.getAmountOfProduct());
			pstmt.setInt(10, peroductOrderVO.getStatus());
			pstmt.setInt(11, peroductOrderVO.getAmountOfPrice());

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
	public int update(ProductOrderVO peroductOrderVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int updateRow;

		try {
			con = DriverManager.getConnection(SQLUtil.URL, SQLUtil.USER, SQLUtil.PASSWORD);
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setString(1, peroductOrderVO.getProductName());
			pstmt.setString(2, peroductOrderVO.getPhone());
			pstmt.setString(3, peroductOrderVO.getAddress());
			pstmt.setTimestamp(4, peroductOrderVO.getDate());
			pstmt.setInt(5, peroductOrderVO.getAmountOfProduct());
			pstmt.setInt(6, peroductOrderVO.getStatus());
			pstmt.setInt(7, peroductOrderVO.getAmountOfPrice());
			pstmt.setInt(8, peroductOrderVO.getId());

			updateRow = pstmt.executeUpdate();
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
		} finally {
			SQLUtil.closeResource(con, pstmt, null);
		}

		return updateRow;
	}

	@Override
	public ProductOrderVO selectById(Integer id) {
		ProductOrderVO peroductOrderVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = DriverManager.getConnection(SQLUtil.URL, SQLUtil.USER, SQLUtil.PASSWORD);
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setInt(1, id);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				peroductOrderVO = new ProductOrderVO();
				peroductOrderVO.setId(rs.getInt("PRODO_ID"));
				peroductOrderVO.setProductId(rs.getInt("PRODO_PROD_ID"));
				peroductOrderVO.setCustomerMemberId(rs.getInt("PRODO_MBUY_ID"));
				peroductOrderVO.setSellerMemberId(rs.getInt("PRODO_MSELL_ID"));
				peroductOrderVO.setProductName(rs.getString("PRODO_NAME"));
				peroductOrderVO.setPhone(rs.getString("PRODO_MOBILE"));
				peroductOrderVO.setAddress(rs.getString("PRODO_ADDRESS"));
				peroductOrderVO.setDate(rs.getTimestamp("PRODO_DATE"));
				peroductOrderVO.setAmountOfProduct(rs.getInt("PRODO_AMOUNT"));
				peroductOrderVO.setStatus(rs.getInt("PRODO_STATUS"));
				peroductOrderVO.setAmountOfPrice(rs.getInt("PRODO_SUM"));
			}
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
		} finally {
			SQLUtil.closeResource(con, pstmt, rs);
		}

		return peroductOrderVO;
	}

	@Override
	public List<ProductOrderVO> selectAll() {
		List<ProductOrderVO> list = new ArrayList<ProductOrderVO>();
		ProductOrderVO peroductOrderVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = DriverManager.getConnection(SQLUtil.URL, SQLUtil.USER, SQLUtil.PASSWORD);
			pstmt = con.prepareStatement(GET_ALL_STMT);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				peroductOrderVO = new ProductOrderVO();
				peroductOrderVO.setId(rs.getInt("PRODO_ID"));
				peroductOrderVO.setProductId(rs.getInt("PRODO_PROD_ID"));
				peroductOrderVO.setCustomerMemberId(rs.getInt("PRODO_MBUY_ID"));
				peroductOrderVO.setSellerMemberId(rs.getInt("PRODO_MSELL_ID"));
				peroductOrderVO.setProductName(rs.getString("PRODO_NAME"));
				peroductOrderVO.setPhone(rs.getString("PRODO_MOBILE"));
				peroductOrderVO.setAddress(rs.getString("PRODO_ADDRESS"));
				peroductOrderVO.setDate(rs.getTimestamp("PRODO_DATE"));
				peroductOrderVO.setAmountOfProduct(rs.getInt("PRODO_AMOUNT"));
				peroductOrderVO.setStatus(rs.getInt("PRODO_STATUS"));
				peroductOrderVO.setAmountOfPrice(rs.getInt("PRODO_SUM"));
				list.add(peroductOrderVO);
			}
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
		} finally {
			SQLUtil.closeResource(con, pstmt, rs);
		}

		return list;
	}

	@Override
	public List<ProductOrderVO> getAll() {

		return null;
	}

	@Override
	public ProductOrderVO findByPrimaryKey(Integer id) {

		return null;
	}

}
