package com.product.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

import core.util.SQLUtil;

public class ProductDAOImpl implements ProductDAO {
	private static final String INSERT_STMT = "INSERT INTO PRODUCT (PROD_MEM_ID, PROD_TYPE, PROD_DESC, PROD_PRICE, PROD_NAME,"
			+ "PROD_UPTIME,PROD_LOC,PROD_STATUS) VALUES (?,?,?,?,?,?,?,?)";
	public static final String UPDATE_STMT = "UPDATE PRODUCT SET PROD_MEM_ID=?, PROD_TYPE=?, PROD_DESC=?, PROD_PRICE=?, PROD_NAME=?, PROD_UPTIME=?, PROD_LOC=?, PROD_STATUS=? where PROD_ID = ?";
	public static final String DELETE_STMT = "DELETE FROM PRODUCT WHERE PROD_ID=?";
	public static final String FIND_BY_PRIMARY_KEY = "SELECT * FROM PRODUCT where PROD_ID = ?";
	public static final String GET_ALL = "SELECT * FROM PRODUCT";// 多個
	public static final String GET_PRODUCT_BY_NAME = "SELECT * FROM PRODUCT WHERE PROD_NAME=?"; // 可以一個或多個
//	public static final String GET_PRODUCT_BY_ID = "SELECT * FROM PRODUCT WHERE prodId=?"; // 唯一
	public static final String GET_PRODUCT_BY_TYPE = "SELECT * FROM PRODUCT WHERE PROD_TYPE=?"; // 多個
	public static final String GET_NAME_ID_BY_ID = "SELECT PROD_ID, PROD_PRICE, PROD_NAME FROM PRODUCT where PROD_ID = ? OR PROD_ID = ?...";
	
	static {
		try {
			Class.forName(SQLUtil.DRIVER);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	@Override
	public int insert(ProductVO productVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int row = 0;
		String key;
		try {
			con = DriverManager.getConnection(SQLUtil.URL, SQLUtil.USER, SQLUtil.PASSWORD);
			pstmt = con.prepareStatement(INSERT_STMT);
			pstmt.setInt(1, productVO.getSellerMemberId());
			pstmt.setInt(2, productVO.getType());
			pstmt.setString(3, productVO.getDescription());
			pstmt.setInt(4, productVO.getPrice());
			pstmt.setString(5, productVO.getName());
			pstmt.setTimestamp(6, productVO.getLaunchedDate());
			pstmt.setString(7, productVO.getLocation());
			pstmt.setInt(8, productVO.getStatus());

			row = pstmt.executeUpdate();
			rs = pstmt.getGeneratedKeys();
			key = rs.getString(1);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			SQLUtil.closeResource(con, pstmt, null);
		}
		return row;
	}

	@Override
	public int update(ProductVO productVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int row = 0;
		try {
			con = DriverManager.getConnection(SQLUtil.URL, SQLUtil.USER, SQLUtil.PASSWORD);
			pstmt = con.prepareStatement(UPDATE_STMT);

			pstmt.setInt(1, productVO.getSellerMemberId());
			pstmt.setInt(2, productVO.getType());
			pstmt.setString(3, productVO.getDescription());
			pstmt.setInt(4, productVO.getPrice());
			pstmt.setString(5, productVO.getName());
			pstmt.setTimestamp(6, productVO.getLaunchedDate());
			pstmt.setString(7, productVO.getLocation());
			pstmt.setInt(8, productVO.getStatus());
			pstmt.setInt(9, productVO.getId());

			row = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			SQLUtil.closeResource(con, pstmt, null);
		}
		return row;
	}

	@Override
	public int deleteById(Integer prodId) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int row = 0;
		try {
			// 連接DB
			con = DriverManager.getConnection(SQLUtil.URL, SQLUtil.USER, SQLUtil.PASSWORD);
			// 設定手動提交模式
			con.setAutoCommit(false);

			// 刪除商品
			pstmt = con.prepareStatement(DELETE_STMT);
			pstmt.setInt(1, prodId);

			row = pstmt.executeUpdate();

			// 結束交易. 改為自動提交模式
			con.commit();
			con.setAutoCommit(true);
			System.out.println("刪除商品編號:" + prodId);

		} catch (SQLException e) {
			try {
				con.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			SQLUtil.closeResource(con, pstmt, null);
		}
		return row;
	}

	@Override
	public ProductVO selectById(Integer prodId) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ProductVO productVO = null;
		try {
			// 連接DB
			con = DriverManager.getConnection(SQLUtil.URL, SQLUtil.USER, SQLUtil.PASSWORD);

			// 查詢商品
			pstmt = con.prepareStatement(FIND_BY_PRIMARY_KEY);
			pstmt.setInt(1, prodId);
			rs = pstmt.executeQuery(); // 還傳DB結果
			while (rs.next()) {
				productVO = new ProductVO();
				productVO.setId(rs.getInt("PROD_ID")); // id
				productVO.setSellerMemberId(rs.getInt("PROD_MEM_ID")); // seller
				productVO.setType(rs.getInt("PROD_TYPE")); // type
				productVO.setDescription(rs.getString("PROD_DESC")); // description
				productVO.setPrice(rs.getInt("PROD_PRICE")); // price
				productVO.setName(rs.getString("PROD_NAME")); // name
				productVO.setLaunchedDate(rs.getTimestamp("PROD_UPTIME"));
				productVO.setLocation(rs.getString("PROD_LOC")); // location
				productVO.setStatus(rs.getInt("PROD_STATUS")); // status
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			SQLUtil.closeResource(con, pstmt, rs);
		}
		return productVO;
	}

	@Override
	public List<ProductVO> selectAll() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<ProductVO> list = new ArrayList<ProductVO>();
		ProductVO productVO = null;
		try {
			// 連結DB
			con = DriverManager.getConnection(SQLUtil.URL, SQLUtil.USER, SQLUtil.PASSWORD);
			// 設定手動交易模式
			con.setAutoCommit(false);

			// 列出所有商品
			pstmt = con.prepareStatement(GET_ALL);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				// 這裡的 productVO 每次要new一個
				productVO = new ProductVO();

				productVO.setId(rs.getInt("PROD_ID")); // id
				productVO.setSellerMemberId(rs.getInt("PROD_MEM_ID")); // seller
				productVO.setType(rs.getInt("PROD_TYPE")); // type
				productVO.setDescription(rs.getString("PROD_DESC")); // description
				productVO.setPrice(rs.getInt("PROD_PRICE")); // price
				productVO.setName(rs.getString("PROD_NAME")); // name
				productVO.setLaunchedDate(rs.getTimestamp("PROD_UPTIME"));
				productVO.setLocation(rs.getString("PROD_LOC")); // location
				productVO.setStatus(rs.getInt("PROD_STATUS")); // status

				// add to list
				list.add(productVO);

			}
//			con.setAutoCommit(true);

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			SQLUtil.closeResource(con, pstmt, rs);
		}
		// 重要的return
		return list;
	}

	@Override
	public List<ProductVO> getProductsByName(String prodName) {

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<ProductVO> list = new ArrayList<ProductVO>();
		ProductVO productVO = null;

		try {
			con = DriverManager.getConnection(SQLUtil.URL, SQLUtil.USER, SQLUtil.PASSWORD);
			pstmt = con.prepareStatement(GET_PRODUCT_BY_NAME);
			pstmt.setString(1, prodName);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				// 這裡的 productVO 每次要new一個
				productVO = new ProductVO();

				productVO.setId(rs.getInt("PROD_ID")); // id
				productVO.setSellerMemberId(rs.getInt("PROD_MEM_ID")); // seller
				productVO.setType(rs.getInt("PROD_TYPE")); // type
				productVO.setDescription(rs.getString("PROD_DESC")); // description
				productVO.setPrice(rs.getInt("PROD_PRICE")); // price
				productVO.setName(rs.getString("PROD_NAME")); // name
				productVO.setLaunchedDate(rs.getTimestamp("PROD_UPTIME"));
				productVO.setLocation(rs.getString("PROD_LOC")); // location
				productVO.setStatus(rs.getInt("PROD_STATUS")); // status
				// add to list
				list.add(productVO);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public List<ProductVO> getProductsByType(Integer prodType) {

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<ProductVO> list = new ArrayList<ProductVO>();
		ProductVO productVO = null;

		try {
			con = DriverManager.getConnection(SQLUtil.URL, SQLUtil.USER, SQLUtil.PASSWORD);
			pstmt = con.prepareStatement(GET_PRODUCT_BY_TYPE);
			pstmt.setInt(1, prodType);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				// 這裡的 productVO 每次要new一個
				productVO = new ProductVO();

				productVO.setId(rs.getInt("PROD_ID")); // id
				productVO.setSellerMemberId(rs.getInt("PROD_MEM_ID")); // seller
				productVO.setType(rs.getInt("PROD_TYPE")); // type
				productVO.setDescription(rs.getString("PROD_DESC")); // description
				productVO.setPrice(rs.getInt("PROD_PRICE")); // price
				productVO.setName(rs.getString("PROD_NAME")); // name
				productVO.setLaunchedDate(rs.getTimestamp("PROD_UPTIME"));
				productVO.setLocation(rs.getString("PROD_LOC")); // location
				productVO.setStatus(rs.getInt("PROD_STATUS")); // status
				// add to list
				list.add(productVO);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return list;

	}

	@Override
	public String insert_get_key(ProductVO productVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int row = 0;
		String key = null;
		String[] cols = { "PROD_ID" };
		try {
			con = DriverManager.getConnection(SQLUtil.URL, SQLUtil.USER, SQLUtil.PASSWORD);
			pstmt = con.prepareStatement(INSERT_STMT, cols);
			pstmt.setInt(1, productVO.getSellerMemberId());
			pstmt.setInt(2, productVO.getType());
			pstmt.setString(3, productVO.getDescription());
			pstmt.setInt(4, productVO.getPrice());
			pstmt.setString(5, productVO.getName());
			pstmt.setTimestamp(6, productVO.getLaunchedDate());
			pstmt.setString(7, productVO.getLocation());
			pstmt.setInt(8, productVO.getStatus());

			pstmt.executeUpdate();
			rs = pstmt.getGeneratedKeys();
			System.out.println("ProductDAO key:" + rs);
			rs.next(); // ***
			key = rs.getString(1);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			SQLUtil.closeResource(con, pstmt, rs);
		}
		return key;
	}
	
	@Override
	public List<ProductVO> getCollection(List<Integer> productIds){
		String sqlSentence = "SELECT * from PRODUCT where ";
		for (int i = 0; i < productIds.size(); i++) {
			sqlSentence += "PROD_ID = ?";
			if (i < productIds.size() - 1) {
				sqlSentence += " OR ";
			}
		}
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ProductVO productVO = null;
		List<ProductVO> list = new ArrayList<ProductVO>();
		try {
			con = DriverManager.getConnection(SQLUtil.URL, SQLUtil.USER, SQLUtil.PASSWORD);
			pstmt = con.prepareStatement(sqlSentence);
			
			for(int index = 0; index < productIds.size(); index++) {
				pstmt.setInt(index + 1, productIds.get(index));
			}
			
			rs = pstmt.executeQuery();
			while (rs.next()) {
				productVO = new ProductVO();

				productVO.setId(rs.getInt("PROD_ID")); // id
				productVO.setPrice(rs.getInt("PROD_PRICE")); // price
				productVO.setName(rs.getString("PROD_NAME")); // name
				list.add(productVO);
			}

		}  catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
		} finally {
			SQLUtil.closeResource(con, pstmt, rs);
		}
		return list;
	}
}
