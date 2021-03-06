package com.product_order.model;

import java.sql.*;
import java.util.*;

import com.activity.model.ActivityVO;

import core.util.SQLUtil;

public class ProductOrderDAOJDBCImpl implements ProductOrderDAO {

	String driver = "com.mysql.cj.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/CFA104G3?serverTimezone=Asia/Taipei";
	String userid = "root";
	String passwd = "password";

	private static final String GET_ALL_STMT = "select * from PRODUCT_ORDER order by PRODO_ID";
	private static final String GET_ONE_STMT = "select * from PRODUCT_ORDER where PRODO_ID = ?";
	private static final String INSERT_STMT = "insert into PRODUCT_ORDER"
			+ "(PRODO_PROD_ID, PRODO_MBUY_ID, PRODO_MSELL_ID, PRODO_NAME, PRODO_MOBILE, PRODO_ADDRESS, PRODO_DATE, PRODO_AMOUNT, PRODO_STATUS, PRODO_SUM) "
			+ "values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
	private static final String DELETE = "delete from PRODUCT_ORDER where PRODO_ID = ?";
	private static final String UPDATE = "update PRODUCT_ORDER set "
			+ "PRODO_NAME = ?, PRODO_MOBILE = ?, PRODO_ADDRESS = ?, PRODO_DATE = ?, PRODO_AMOUNT = ?, PRODO_STATUS = ?, PRODO_SUM = ? "
			+ "where PRODO_ID = ?";

	private static final String CHANGE_STATUS = "update PRODUCT_ORDER set PRODO_STATUS = ? where PRODO_ID = ?";

	private static final String REVISE_ORDER = "update PRODUCT_ORDER set PRODO_NAME = ?, PRODO_MOBILE = ?, PRODO_ADDRESS = ? where PRODO_ID = ?";

	private static final String GET_SELLER_ALL_STMT = "select * from PRODUCT_ORDER where PRODO_MSELL_ID = ?";
	private static final String GET_BUYER_ALL_STMT = "select * from PRODUCT_ORDER where PRODO_MBUY_ID = ?";

	static {
		try {
			Class.forName(SQLUtil.DRIVER);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	@Override
	public int insert(ProductOrderVO vo) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int insertedRow;

		try {
			con = DriverManager.getConnection(SQLUtil.URL, SQLUtil.USER, SQLUtil.PASSWORD);
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setInt(1, vo.getProductId());
			pstmt.setInt(2, vo.getCustomerMemberId());
			pstmt.setInt(3, vo.getSellerMemberId());
			pstmt.setString(4, vo.getProductName());
			pstmt.setString(5, vo.getPhone());
			pstmt.setString(6, vo.getAddress());
			pstmt.setTimestamp(7, vo.getDate());
			pstmt.setInt(8, vo.getAmountOfProduct());
			pstmt.setInt(9, vo.getStatus());
			pstmt.setInt(10, vo.getAmountOfPrice());

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
	public int update(ProductOrderVO vo) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int updateRow;

		try {
			con = DriverManager.getConnection(SQLUtil.URL, SQLUtil.USER, SQLUtil.PASSWORD);
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setString(1, vo.getProductName());
			pstmt.setString(2, vo.getPhone());
			pstmt.setString(3, vo.getAddress());
			pstmt.setTimestamp(4, vo.getDate());
			pstmt.setInt(5, vo.getAmountOfProduct());
			pstmt.setInt(6, vo.getStatus());
			pstmt.setInt(7, vo.getAmountOfPrice());
			pstmt.setInt(8, vo.getId());

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
		ProductOrderVO vo = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = DriverManager.getConnection(SQLUtil.URL, SQLUtil.USER, SQLUtil.PASSWORD);
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setInt(1, id);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				vo = new ProductOrderVO();
				vo.setId(rs.getInt("PRODO_ID"));
				vo.setProductId(rs.getInt("PRODO_PROD_ID"));
				vo.setCustomerMemberId(rs.getInt("PRODO_MBUY_ID"));
				vo.setSellerMemberId(rs.getInt("PRODO_MSELL_ID"));
				vo.setProductName(rs.getString("PRODO_NAME"));
				vo.setPhone(rs.getString("PRODO_MOBILE"));
				vo.setAddress(rs.getString("PRODO_ADDRESS"));
				vo.setDate(rs.getTimestamp("PRODO_DATE"));
				vo.setAmountOfProduct(rs.getInt("PRODO_AMOUNT"));
				vo.setStatus(rs.getInt("PRODO_STATUS"));
				vo.setAmountOfPrice(rs.getInt("PRODO_SUM"));
			}
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
		} finally {
			SQLUtil.closeResource(con, pstmt, rs);
		}

		return vo;
	}

	@Override
	public List<ProductOrderVO> selectAll() {
		List<ProductOrderVO> list = new ArrayList<ProductOrderVO>();
		ProductOrderVO vo = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = DriverManager.getConnection(SQLUtil.URL, SQLUtil.USER, SQLUtil.PASSWORD);
			pstmt = con.prepareStatement(GET_ALL_STMT);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				vo = new ProductOrderVO();
				vo.setId(rs.getInt("PRODO_ID"));
				vo.setProductId(rs.getInt("PRODO_PROD_ID"));
				vo.setCustomerMemberId(rs.getInt("PRODO_MBUY_ID"));
				vo.setSellerMemberId(rs.getInt("PRODO_MSELL_ID"));
				vo.setProductName(rs.getString("PRODO_NAME"));
				vo.setPhone(rs.getString("PRODO_MOBILE"));
				vo.setAddress(rs.getString("PRODO_ADDRESS"));
				vo.setDate(rs.getTimestamp("PRODO_DATE"));
				vo.setAmountOfProduct(rs.getInt("PRODO_AMOUNT"));
				vo.setStatus(rs.getInt("PRODO_STATUS"));
				vo.setAmountOfPrice(rs.getInt("PRODO_SUM"));
				list.add(vo);
			}
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
		} finally {
			SQLUtil.closeResource(con, pstmt, rs);
		}

		return list;
	}

//	@Override
//	public int changeStatus(int id, int status) {
//		Connection con = null;
//		PreparedStatement pstmt = null;
//		int updateRow;
//
//		try {
//			con = DriverManager.getConnection(SQLUtil.URL, SQLUtil.USER, SQLUtil.PASSWORD);
//			pstmt = con.prepareStatement(CHANGE_STATUS);
//
//			pstmt.setInt(1, status);
//			pstmt.setInt(2, id);
//
//			updateRow = pstmt.executeUpdate();
//		} catch (SQLException se) {
//			throw new RuntimeException("A database error occured. " + se.getMessage());
//		} finally {
//			SQLUtil.closeResource(con, pstmt, null);
//		}
//
//		return updateRow;
//
//	}
	@Override
	public int updateStatus(ProductOrderVO vo) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int updateRow;

		try {
			con = DriverManager.getConnection(SQLUtil.URL, SQLUtil.USER, SQLUtil.PASSWORD);
			pstmt = con.prepareStatement(CHANGE_STATUS);

			pstmt.setInt(1, vo.getStatus());
			pstmt.setInt(2, vo.getId());

			updateRow = pstmt.executeUpdate();
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
		} finally {
			SQLUtil.closeResource(con, pstmt, null);
		}
		return updateRow;
	}

	@Override
	public int reviseOrder(ProductOrderVO vo) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int updateRow;

		try {
			con = DriverManager.getConnection(SQLUtil.URL, SQLUtil.USER, SQLUtil.PASSWORD);
			pstmt = con.prepareStatement(REVISE_ORDER);

			pstmt.setString(1, vo.getProductName());
			pstmt.setString(2, vo.getPhone());
			pstmt.setString(3, vo.getAddress());
			pstmt.setInt(4, vo.getId());

			updateRow = pstmt.executeUpdate();
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
		} finally {
			SQLUtil.closeResource(con, pstmt, null);
		}
		return updateRow;
	}

	@Override
	public List<ProductOrderVO> retrieveBySellerId(int memberId) {
		List<ProductOrderVO> list = new ArrayList<ProductOrderVO>();
		ProductOrderVO vo = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = DriverManager.getConnection(SQLUtil.URL, SQLUtil.USER, SQLUtil.PASSWORD);
			pstmt = con.prepareStatement(GET_SELLER_ALL_STMT);

			pstmt.setInt(1, memberId);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				vo = new ProductOrderVO();
				vo.setId(rs.getInt("PRODO_ID"));
				vo.setProductId(rs.getInt("PRODO_PROD_ID"));
				vo.setCustomerMemberId(rs.getInt("PRODO_MBUY_ID"));
				vo.setSellerMemberId(rs.getInt("PRODO_MSELL_ID"));
				vo.setProductName(rs.getString("PRODO_NAME"));
				vo.setPhone(rs.getString("PRODO_MOBILE"));
				vo.setAddress(rs.getString("PRODO_ADDRESS"));
				vo.setDate(rs.getTimestamp("PRODO_DATE"));
				vo.setAmountOfProduct(rs.getInt("PRODO_AMOUNT"));
				vo.setStatus(rs.getInt("PRODO_STATUS"));
				vo.setAmountOfPrice(rs.getInt("PRODO_SUM"));
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
	public List<ProductOrderVO> retrieveByBuyerId(int memberId) {
		List<ProductOrderVO> list = new ArrayList<ProductOrderVO>();
		ProductOrderVO vo = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = DriverManager.getConnection(SQLUtil.URL, SQLUtil.USER, SQLUtil.PASSWORD);
			pstmt = con.prepareStatement(GET_BUYER_ALL_STMT);

			pstmt.setInt(1, memberId);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				vo = new ProductOrderVO();
				vo.setId(rs.getInt("PRODO_ID"));
				vo.setProductId(rs.getInt("PRODO_PROD_ID"));
				vo.setCustomerMemberId(rs.getInt("PRODO_MBUY_ID"));
				vo.setSellerMemberId(rs.getInt("PRODO_MSELL_ID"));
				vo.setProductName(rs.getString("PRODO_NAME"));
				vo.setPhone(rs.getString("PRODO_MOBILE"));
				vo.setAddress(rs.getString("PRODO_ADDRESS"));
				vo.setDate(rs.getTimestamp("PRODO_DATE"));
				vo.setAmountOfProduct(rs.getInt("PRODO_AMOUNT"));
				vo.setStatus(rs.getInt("PRODO_STATUS"));
				vo.setAmountOfPrice(rs.getInt("PRODO_SUM"));
				list.add(vo);
			}
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
		} finally {
			SQLUtil.closeResource(con, pstmt, rs);
		}

		return list;
	}
}
