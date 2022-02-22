package com.product_photo.model;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import core.dao.CoreDao;
import core.util.SQLUtil;

public class ProductPhotoDAOJDBCImpl implements ProductPhotoDAO {
	private static final String GET_ALL_STMT = "select * from PRODUCT_PHOTO order by PRODPH_ID";			
	private static final String GET_ONE_STMT = "select * from PRODUCT_PHOTO where PRODPH_ID = ?";
	private static final String INSERT_STMT = "insert into PRODUCT_PHOTO (PRODPH_PROD_ID,PRODPH_PHOTO) values(?, ?)";
	private static final String DELETE = "delete from PRODUCT_PHOTO where PRODPH_ID = ?";		
	private static final String UPDATE = "update PRODUCT_PHOTO set PRODPH_PHOTO = ? where PRODPH_ID = ?";
	private final String INSERT = "INSERT INTO PRODUCT_PHOTO(PRODPH_PROD_ID, PRODPH_PHOTO) VALUES (?, ?)";
	private final String GET_BLOB = "SELECT * FROM PRODUCT_PHOTO WHERE PRODPH_PROD_ID=?";

	private static final String DELETE_BY_PRODID = "delete from PRODUCT_PHOTO where PRODPH_PROD_ID = ?";

	static {
		try {
			Class.forName(SQLUtil.DRIVER);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	@Override
	public int insert(ProductPhotoVO productPhotoVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int insertedRow;
		
		try {
			con = DriverManager.getConnection(SQLUtil.URL, SQLUtil.USER, SQLUtil.PASSWORD);
			pstmt = con.prepareStatement(INSERT_STMT);
			
			pstmt.setInt(1, productPhotoVO.getProductId());
			pstmt.setBytes(2, productPhotoVO.getPhoto());
			
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
	public int update(ProductPhotoVO productPhotoVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int updateRow;

		try {
			con = DriverManager.getConnection(SQLUtil.URL, SQLUtil.USER, SQLUtil.PASSWORD);
			pstmt = con.prepareStatement(UPDATE);
			
			pstmt.setBytes(1, productPhotoVO.getPhoto());
			pstmt.setInt(2, productPhotoVO.getId());
			
			updateRow = pstmt.executeUpdate();
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
		} finally {
			SQLUtil.closeResource(con, pstmt, null);
		}
		
		return updateRow;

	}

	@Override
	public ProductPhotoVO selectById(Integer id) {
		ProductPhotoVO productPhotoVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = DriverManager.getConnection(SQLUtil.URL, SQLUtil.USER, SQLUtil.PASSWORD);
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setInt(1, id);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				productPhotoVO = new ProductPhotoVO();
				productPhotoVO.setId(rs.getInt("PRODPH_ID"));
				productPhotoVO.setProductId(rs.getInt("PRODPH_PROD_ID"));
				productPhotoVO.setPhoto(rs.getBytes("PRODPH_PHOTO"));
			}
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
		} finally {
			SQLUtil.closeResource(con, pstmt, rs);
		}

		return productPhotoVO;
	}
	@Override
	public List<ProductPhotoVO> selectAll() {
		List<ProductPhotoVO> list = new ArrayList<ProductPhotoVO>();
		ProductPhotoVO productPhotoVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = DriverManager.getConnection(SQLUtil.URL, SQLUtil.USER, SQLUtil.PASSWORD);
			pstmt = con.prepareStatement(GET_ALL_STMT);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				productPhotoVO = new ProductPhotoVO();
				productPhotoVO.setId(rs.getInt("PRODPH_ID"));
				productPhotoVO.setProductId(rs.getInt("PRODPH_PROD_ID"));
				productPhotoVO.setPhoto(rs.getBytes("PRODPH_PHOTO"));
				list.add(productPhotoVO);
			}
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
		} finally {
			SQLUtil.closeResource(con, pstmt, rs);
		}

		return list;
	}

	@Override
	public int insertId(Integer prodPhProdId, String photoPath) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int row=0;
		try {
			con = DriverManager.getConnection(SQLUtil.URL,SQLUtil.USER,SQLUtil.PASSWORD);
			pstmt = con.prepareStatement(INSERT);
			FileInputStream fis = new FileInputStream(photoPath);
			pstmt.setInt(1, prodPhProdId);
			pstmt.setBlob(2, fis);
			
			row = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// DriverManager.getConnection
			e.printStackTrace();
		} catch (IOException e) {
			// FileInputStream
			e.printStackTrace();
		} finally {
			SQLUtil.closeResource(con, pstmt, null);
		}
		
		return row;
	}

	@Override
	public Blob getBlob(Integer prodPhProdId) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		java.sql.Blob blob = null;
		
		try {
			con = DriverManager.getConnection(SQLUtil.URL,SQLUtil.USER,SQLUtil.PASSWORD);
			pstmt = con.prepareStatement(GET_BLOB);
			pstmt.setInt(1, prodPhProdId);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				blob  = rs.getBlob("PRODPH_PHOTO");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return (Blob) blob;
	}

	@Override

	public void deleteByProdId(Integer prodPhProdId) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int deleteRow;
		
		try {
			con = DriverManager.getConnection(SQLUtil.URL, SQLUtil.USER, SQLUtil.PASSWORD);
			pstmt = con.prepareStatement(DELETE_BY_PRODID);

			pstmt.setInt(1, prodPhProdId);

			deleteRow = pstmt.executeUpdate();

		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
		} finally {
			SQLUtil.closeResource(con, pstmt, null);
		}
	}

}