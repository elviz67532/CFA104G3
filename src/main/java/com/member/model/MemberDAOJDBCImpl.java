package com.member.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.server_manager.model.ServerManagerVO;

import core.util.SQLUtil;

public class MemberDAOJDBCImpl implements MemberDAO {
	private static final String GET_ALL_STMT = "select * from MEMBER order by MEM_ID";
	private static final String GET_ONE_STMT = "select * from MEMBER where MEM_ID = ?";
	private static final String INSERT_STMT = "insert into MEMBER(MEM_EMAIL, MEM_ACCOUNT, MEM_PASSWORD, MEM_NICKNAME, MEM_NAME, MEM_PHONE, MEM_GENDER, MEM_CODE, MEM_AVATAR, MEM_TIME, MEM_STATUS) "
			+ "values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
	private static final String DELETE = "delete from MEMBER where MEM_ID = ?";
	private static final String UPDATE = "update MEMBER set "
			+ "MEM_EMAIL = ?, MEM_PASSWORD = ?, MEM_NICKNAME = ?, MEM_NAME = ?, MEM_PHONE = ?, MEM_CITY = ?, MEM_CITYAREA = ?, MEM_ADDRESS	 = ?, MEM_AVATAR = ? "
			+ "where MEM_ID = ?";
	private static final String LOGIN = "select * from MEMBER where MEM_ACCOUNT = ? and MEM_PASSWORD = ? ";
	public static final String FORGETPASSWORD = "SELECT * FROM MEMBER where MEM_EMAIL = ?";
	public static final String GETONEBYNAME = "SELECT * FROM MEMBER where MEM_NAME=?";
	private static final String VERIFTYCODE = "update MEMBER set "
			+ "MEM_STATUS = ? "
			+ "where MEM_ID  = ? AND MEM_CODE = ?";
	private static final String UPDATESTATUS = "update MEMBER set MEM_STATUS = ? where MEM_ID  = ? ";
	private static final String STATUS = "update MEMBER set "+ "MEM_STATUS = ? "+ "where MEM_ID  = ? ";
	public static final String FIND_BY_ACCOUNT = "SELECT * FROM MEMBER WHERE MEM_ACCOUNT=?";
	public static final String FIND_BY_EMAIL = "SELECT * FROM MEMBER WHERE MEM_EMAIL=?";
	
			

	@Override
	public int insert(MemberVO vo) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int id = -1;

		try {
			con = DriverManager.getConnection(SQLUtil.URL, SQLUtil.USER, SQLUtil.PASSWORD);
			pstmt = con.prepareStatement(INSERT_STMT ,Statement.RETURN_GENERATED_KEYS);

			pstmt.setString(1, vo.getEmail());
			pstmt.setString(2, vo.getAccount());
			pstmt.setString(3, vo.getPassword());
			pstmt.setString(4, vo.getNickname());
			pstmt.setString(5, vo.getName());
			pstmt.setString(6, vo.getPhone());
			pstmt.setInt(7, vo.getGender());
			pstmt.setString(8, vo.getCode());
			pstmt.setBytes(9, vo.getAvatar());
			pstmt.setTimestamp(10, vo.getRegisterDate());
			pstmt.setInt(11, vo.getStatus());
			
			int insertedRow = pstmt.executeUpdate();
			if (insertedRow > 0) {
				ResultSet rs = pstmt.getGeneratedKeys();
				rs.next();
				id = rs.getInt(1);}
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
	public int update(MemberVO vo) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int updateRow;

		try {
			con = DriverManager.getConnection(SQLUtil.URL, SQLUtil.USER, SQLUtil.PASSWORD);
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setString(1, vo.getEmail());
			pstmt.setString(2, vo.getPassword());
			pstmt.setString(3, vo.getNickname());
			pstmt.setString(4, vo.getName());
			pstmt.setString(5, vo.getPhone());
			pstmt.setString(6, vo.getCity());
			pstmt.setString(7, vo.getCityArea());
			pstmt.setString(8, vo.getAddress());
			pstmt.setBytes(9, vo.getAvatar());
			pstmt.setInt(10, vo.getId());			
			updateRow = pstmt.executeUpdate();
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
		} finally {
			SQLUtil.closeResource(con, pstmt, null);
		}

		return updateRow;
	}

	@Override
	public MemberVO findByName(String name) {
		MemberVO vo = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = DriverManager.getConnection(SQLUtil.URL, SQLUtil.USER, SQLUtil.PASSWORD);
			pstmt = con.prepareStatement(GETONEBYNAME);

			pstmt.setString(1, name);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				vo = new MemberVO();
				vo.setId(rs.getInt("MEM_ID"));
				vo.setEmail(rs.getString("MEM_EMAIL"));
				vo.setAccount(rs.getString("MEM_ACCOUNT"));
				vo.setPassword(rs.getString("MEM_PASSWORD"));
				vo.setNickname(rs.getString("MEM_NICKNAME"));
				vo.setName(rs.getString("MEM_NAME"));
				vo.setPhone(rs.getString("MEM_PHONE"));
				vo.setGender(rs.getInt("MEM_GENDER"));
				vo.setCity(rs.getString("MEM_CITY"));
				vo.setCityArea(rs.getString("MEM_CITYAREA"));
				vo.setAddress(rs.getString("MEM_ADDRESS"));
				vo.setCode(rs.getString("MEM_CODE"));
				vo.setAvatar(rs.getBytes("MEM_AVATAR"));
				vo.setRegisterDate(rs.getTimestamp("MEM_TIME"));
				vo.setStatus(rs.getInt("MEM_STATUS"));
			}
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
		} finally {
			SQLUtil.closeResource(con, pstmt, rs);
		}

		return vo;
	}

	@Override
	public List<MemberVO> selectAll() {
		List<MemberVO> list = new ArrayList<MemberVO>();
		MemberVO vo = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = DriverManager.getConnection(SQLUtil.URL, SQLUtil.USER, SQLUtil.PASSWORD);
			pstmt = con.prepareStatement(GET_ALL_STMT);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				vo = new MemberVO();
				vo.setId(rs.getInt("MEM_ID"));
				vo.setEmail(rs.getString("MEM_EMAIL"));
				vo.setAccount(rs.getString("MEM_ACCOUNT"));
				vo.setPassword(rs.getString("MEM_PASSWORD"));
				vo.setNickname(rs.getString("MEM_NICKNAME"));
				vo.setName(rs.getString("MEM_NAME"));
				vo.setPhone(rs.getString("MEM_PHONE"));
				vo.setGender(rs.getInt("MEM_GENDER"));
				vo.setCity(rs.getString("MEM_CITY"));
				vo.setCityArea(rs.getString("MEM_CITYAREA"));
				vo.setAddress(rs.getString("MEM_ADDRESS"));
				vo.setCode(rs.getString("MEM_CODE"));
				vo.setAvatar(rs.getBytes("MEM_AVATAR"));
				vo.setRegisterDate(rs.getTimestamp("MEM_TIME"));
				vo.setStatus(rs.getInt("MEM_STATUS"));
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
	public MemberVO login(String account, String password) {
		MemberVO vo = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = DriverManager.getConnection(SQLUtil.URL, SQLUtil.USER, SQLUtil.PASSWORD);
			pstmt = con.prepareStatement(LOGIN);

			pstmt.setString(1, account);
			pstmt.setString(2, password);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				vo = new MemberVO();
				vo.setId(rs.getInt("MEM_ID"));
				vo.setEmail(rs.getString("MEM_EMAIL"));
				vo.setAccount(rs.getString("MEM_ACCOUNT"));
				vo.setPassword(rs.getString("MEM_PASSWORD"));
				vo.setNickname(rs.getString("MEM_NICKNAME"));
				vo.setName(rs.getString("MEM_NAME"));
				vo.setPhone(rs.getString("MEM_PHONE"));
				vo.setGender(rs.getInt("MEM_GENDER"));
				vo.setCity(rs.getString("MEM_CITY"));
				vo.setCityArea(rs.getString("MEM_CITYAREA"));
				vo.setAddress(rs.getString("MEM_ADDRESS"));
				vo.setCode(rs.getString("MEM_CODE"));
				vo.setAvatar(rs.getBytes("MEM_AVATAR"));
				vo.setRegisterDate(rs.getTimestamp("MEM_TIME"));
				vo.setStatus(rs.getInt("MEM_STATUS"));
			}
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
		} finally {
			SQLUtil.closeResource(con, pstmt, rs);
		}

		return vo;
	}

	@Override
	public MemberVO forgetpassword(String email) {

		MemberVO vo = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = DriverManager.getConnection(SQLUtil.URL, SQLUtil.USER, SQLUtil.PASSWORD);
			pstmt = con.prepareStatement(FORGETPASSWORD);

			pstmt.setString(1, email);

			rs = pstmt.executeQuery();
			while (rs.next()) {
				vo = new MemberVO();
				vo.setId(rs.getInt("MEM_ID"));
				vo.setEmail(rs.getString("MEM_EMAIL"));
				vo.setAccount(rs.getString("MEM_ACCOUNT"));
				vo.setPassword(rs.getString("MEM_PASSWORD"));
				vo.setNickname(rs.getString("MEM_NICKNAME"));
				vo.setName(rs.getString("MEM_NAME"));
				vo.setPhone(rs.getString("MEM_PHONE"));
				vo.setGender(rs.getInt("MEM_GENDER"));
				vo.setCity(rs.getString("MEM_CITY"));
				vo.setCityArea(rs.getString("MEM_CITYAREA"));
				vo.setAddress(rs.getString("MEM_ADDRESS"));
				vo.setCode(rs.getString("MEM_CODE"));
				vo.setAvatar(rs.getBytes("MEM_AVATAR"));
				vo.setRegisterDate(rs.getTimestamp("MEM_TIME"));
				vo.setStatus(rs.getInt("MEM_STATUS"));
			}

		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
			// Clean up JDBC resources
		} finally {
			SQLUtil.closeResource(con, pstmt, rs);
		}
		return vo;
	}

	public MemberVO selectById(Integer id) {
		MemberVO vo = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = DriverManager.getConnection(SQLUtil.URL, SQLUtil.USER, SQLUtil.PASSWORD);
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setInt(1, id);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				vo = new MemberVO();
				vo.setId(rs.getInt("MEM_ID"));
				vo.setEmail(rs.getString("MEM_EMAIL"));
				vo.setAccount(rs.getString("MEM_ACCOUNT"));
				vo.setPassword(rs.getString("MEM_PASSWORD"));
				vo.setNickname(rs.getString("MEM_NICKNAME"));
				vo.setName(rs.getString("MEM_NAME"));
				vo.setPhone(rs.getString("MEM_PHONE"));
				vo.setGender(rs.getInt("MEM_GENDER"));
				vo.setCity(rs.getString("MEM_CITY"));
				vo.setCityArea(rs.getString("MEM_CITYAREA"));
				vo.setAddress(rs.getString("MEM_ADDRESS"));
				vo.setCode(rs.getString("MEM_CODE"));
				vo.setAvatar(rs.getBytes("MEM_AVATAR"));
				vo.setRegisterDate(rs.getTimestamp("MEM_TIME"));
				vo.setStatus(rs.getInt("MEM_STATUS"));
			}
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
		} finally {
			SQLUtil.closeResource(con, pstmt, rs);
		}

		return vo;
	}
	@Override
	public int veriftyCode(Integer status,Integer id,String code) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int updateRow;

		System.out.println(status);
		System.out.println(id);
		System.out.println(code);
		
		try {
			con = DriverManager.getConnection(SQLUtil.URL, SQLUtil.USER, SQLUtil.PASSWORD);
			pstmt = con.prepareStatement(VERIFTYCODE);
			pstmt.setInt(1, status);
			pstmt.setInt(2, id);
			pstmt.setString(3, code);
		
			updateRow = pstmt.executeUpdate();
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
		} finally {
			SQLUtil.closeResource(con, pstmt, null);
		}

		return updateRow;
	}
	@Override
	public int updateStatus(Integer id,Integer status) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int updateRow;

		try {
			con = DriverManager.getConnection(SQLUtil.URL, SQLUtil.USER, SQLUtil.PASSWORD);
			pstmt = con.prepareStatement(UPDATESTATUS);

			pstmt.setInt(1, status);
			pstmt.setInt(2, id);
	
			updateRow = pstmt.executeUpdate();
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
		} finally {
			SQLUtil.closeResource(con, pstmt, null);
		}

		return updateRow;
	}
	@Override
	public int status(MemberVO vo) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int updateRow;

		try {
			con = DriverManager.getConnection(SQLUtil.URL, SQLUtil.USER, SQLUtil.PASSWORD);
			pstmt = con.prepareStatement(STATUS);

			pstmt.setInt(1, vo.getStatus());
			pstmt.setInt(2, vo.getStatus());
	
			updateRow = pstmt.executeUpdate();
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
		} finally {
			SQLUtil.closeResource(con, pstmt, null);
		}

		return updateRow;
	}
	@Override
	public MemberVO findByAccount(String account) {
		MemberVO vo = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = DriverManager.getConnection(SQLUtil.URL, SQLUtil.USER, SQLUtil.PASSWORD);
			pstmt = con.prepareStatement(FIND_BY_ACCOUNT);
			pstmt.setString(1, account);
			rs = pstmt.executeQuery();

			while(rs.next()) {
				vo = new MemberVO();
				vo.setId(rs.getInt("MEM_ID"));
				vo.setEmail(rs.getString("MEM_EMAIL"));
				vo.setAccount(rs.getString("MEM_ACCOUNT"));
				vo.setPassword(rs.getString("MEM_PASSWORD"));
				vo.setNickname(rs.getString("MEM_NICKNAME"));
				vo.setName(rs.getString("MEM_NAME"));
				vo.setPhone(rs.getString("MEM_PHONE"));
				vo.setGender(rs.getInt("MEM_GENDER"));
				vo.setCity(rs.getString("MEM_CITY"));
				vo.setCityArea(rs.getString("MEM_CITYAREA"));
				vo.setAddress(rs.getString("MEM_ADDRESS"));
				vo.setCode(rs.getString("MEM_CODE"));
				vo.setAvatar(rs.getBytes("MEM_AVATAR"));
				vo.setRegisterDate(rs.getTimestamp("MEM_TIME"));
				vo.setStatus(rs.getInt("MEM_STATUS"));
			}
		} catch (SQLException e) {
			e.printStackTrace();			
		} finally {
			SQLUtil.closeResource(con, pstmt, rs);			
		}	
		return vo;
	}
	@Override
	public MemberVO findByEmail(String email) {
		MemberVO vo = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = DriverManager.getConnection(SQLUtil.URL, SQLUtil.USER, SQLUtil.PASSWORD);
			pstmt = con.prepareStatement(FIND_BY_EMAIL);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();

			while(rs.next()) {
				vo = new MemberVO();
				vo.setId(rs.getInt("MEM_ID"));
				vo.setEmail(rs.getString("MEM_EMAIL"));
				vo.setAccount(rs.getString("MEM_ACCOUNT"));
				vo.setPassword(rs.getString("MEM_PASSWORD"));
				vo.setNickname(rs.getString("MEM_NICKNAME"));
				vo.setName(rs.getString("MEM_NAME"));
				vo.setPhone(rs.getString("MEM_PHONE"));
				vo.setGender(rs.getInt("MEM_GENDER"));
				vo.setCity(rs.getString("MEM_CITY"));
				vo.setCityArea(rs.getString("MEM_CITYAREA"));
				vo.setAddress(rs.getString("MEM_ADDRESS"));
				vo.setCode(rs.getString("MEM_CODE"));
				vo.setAvatar(rs.getBytes("MEM_AVATAR"));
				vo.setRegisterDate(rs.getTimestamp("MEM_TIME"));
				vo.setStatus(rs.getInt("MEM_STATUS"));
			}
		} catch (SQLException e) {
			e.printStackTrace();			
		} finally {
			SQLUtil.closeResource(con, pstmt, rs);			
		}	
		return vo;
	}


}