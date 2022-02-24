package com.activity.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import core.util.SQLUtil;

public class ActivityDAOJDBCImpl implements ActivityDAO {
	private static final String INSERT_STMT = "insert into  ACTIVITY"
			+ "(ACT_ORGANIZER_MEM_ID, ACT_TYPE, ACT_NAME, ACT_CONTENT, ACT_LAUNCHTIME, ACT_APPLY_STARTTIME, ACT_APPLY_ENDTIME, ACT_LOCATION, ACT_COST, ACT_APPLY_MEM_EXISTING, ACT_MAX_MEM, ACT_MIN_MEM, ACT_STARTTIME, ACT_ENDTIME, ACT_STATUS)"
			+ "values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
	private static final String UPDATE = "update ACTIVITY set "
			+ "ACT_TYPE = ?, ACT_NAME = ?, ACT_CONTENT = ?, ACT_LAUNCHTIME = ?, "
			+ "ACT_APPLY_STARTTIME = ? , ACT_APPLY_ENDTIME = ?, ACT_LOCATION = ?, ACT_COST = ?, "
			+ "ACT_APPLY_MEM_EXISTING = ?, ACT_MAX_MEM = ?, ACT_MIN_MEM = ?, ACT_STARTTIME = ?, "
			+ "ACT_ENDTIME = ? where ACT_ID = ?";
//ACT_ORGANIZER_MEM_ID = ?, ACT_APPLY_STARTTIME = ? , ACT_STATUS = ? 
	private static final String GET_ONE_STMT = "select * from ACTIVITY where ACT_ID = ?";
	private static final String GET_ALL_STMT = "select * from ACTIVITY";
	private static final String DELETE = "delete from ACTIVITY where ACT_ID = ?";
	private static final String ADDATTEND="update ACTIVITY set ACT_APPLY_MEM_EXISTING = ACT_APPLY_MEM_EXISTING + 1 where ACT_ID = ?";
	private static final String MINUSATTEND="update ACTIVITY set ACT_APPLY_MEM_EXISTING = ACT_APPLY_MEM_EXISTING - 1 where ACT_ID = ?";
	
/*===============================================================================================*/
	private static final String GET_ALL_STMT_DESC = "select * from ACTIVITY order by act_id desc";
	
	private static final String GET_ALL_STMT_TYPE = "select * from ACTIVITY where act_type = ?";
	
	private static final String UPDATE_STATUS = "UPDATE ACTIVITY SET ACT_STATUS = ?  WHERE ACT_ID = ?";
	
	private static final String GET_ALL_STMT_MEM = "SELECT * FROM ACTIVITY where ACT_ORGANIZER_MEM_ID = ?";
	static {
		try {
			Class.forName(SQLUtil.DRIVER);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<ActivityVO>  selectByMemId(Integer organizerMemberId) {
		List<ActivityVO> list = new ArrayList<ActivityVO>();
		ActivityVO vo = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = DriverManager.getConnection(SQLUtil.URL, SQLUtil.USER, SQLUtil.PASSWORD);
			pstmt = con.prepareStatement(GET_ALL_STMT_MEM);

			pstmt.setInt(1, organizerMemberId);

			rs = pstmt.executeQuery();

			while(rs.next()) {
				vo = new ActivityVO();
				vo.setActivityId(rs.getInt("ACT_ID"));
				vo.setOrganizerMemberId(rs.getInt("ACT_ORGANIZER_MEM_ID"));
				vo.setType(rs.getInt("ACT_TYPE"));
				vo.setName(rs.getString("ACT_NAME"));
				vo.setContent(rs.getString("ACT_CONTENT"));
				vo.setLaunchedDate(rs.getTimestamp("ACT_LAUNCHTIME"));
				vo.setApplyStartDate(rs.getTimestamp("ACT_APPLY_STARTTIME"));
				vo.setApplyEndDate(rs.getTimestamp("ACT_APPLY_ENDTIME"));
				vo.setLocation(rs.getString("ACT_LOCATION"));
				vo.setCost(rs.getInt("ACT_COST"));
				vo.setApplyMemberExisting(rs.getInt("ACT_APPLY_MEM_EXISTING"));
				vo.setMaxMember(rs.getInt("ACT_MAX_MEM"));
				vo.setMinMember(rs.getInt("ACT_MIN_MEM"));
				vo.setStartDate(rs.getTimestamp("ACT_STARTTIME"));
				vo.setEndDate(rs.getTimestamp("ACT_ENDTIME"));
				vo.setStatus(rs.getInt("ACT_STATUS"));
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
	public int updateStatus(ActivityVO vo) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int updateRow;

		try {
			con = DriverManager.getConnection(SQLUtil.URL, SQLUtil.USER, SQLUtil.PASSWORD);
			pstmt = con.prepareStatement(UPDATE_STATUS);

			pstmt.setInt(1, vo.getStatus());
			pstmt.setInt(2, vo.getActivityId());

			updateRow = pstmt.executeUpdate();
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
		} finally {
			SQLUtil.closeResource(con, pstmt, null);
		}
		return updateRow;
	}

	@Override
	public int insert(ActivityVO vo) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int activityId = -1;

		try {
			con = DriverManager.getConnection(SQLUtil.URL, SQLUtil.USER, SQLUtil.PASSWORD);
			pstmt = con.prepareStatement(INSERT_STMT , PreparedStatement.RETURN_GENERATED_KEYS);

			pstmt.setInt(1, vo.getOrganizerMemberId());
			pstmt.setInt(2, vo.getType());
			pstmt.setString(3, vo.getName());
			pstmt.setString(4, vo.getContent());
			pstmt.setTimestamp(5, vo.getLaunchedDate());
			pstmt.setTimestamp(6, vo.getApplyStartDate());
			pstmt.setTimestamp(7, vo.getApplyEndDate());
			pstmt.setString(8, vo.getLocation());
			pstmt.setInt(9, vo.getCost());
			pstmt.setInt(10, vo.getApplyMemberExisting());
			pstmt.setInt(11, vo.getMaxMember());
			pstmt.setInt(12, vo.getMinMember());
			pstmt.setTimestamp(13, vo.getStartDate());
			pstmt.setTimestamp(14, vo.getEndDate());
			pstmt.setInt(15, vo.getStatus());

			int insertedRow = pstmt.executeUpdate();
			//確定PK
			if(insertedRow > 0) {
				//找PK
				ResultSet rs = pstmt.getGeneratedKeys();
				rs.next();
				activityId = rs.getInt(1);
			}
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
		} finally {
			SQLUtil.closeResource(con, pstmt, null);
		}

		return activityId;
	}

	@Override
	public int deleteById(Integer activityId) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int deleteRow;

		try {
			con = DriverManager.getConnection(SQLUtil.URL, SQLUtil.USER, SQLUtil.PASSWORD);
			pstmt = con.prepareStatement(DELETE);

			pstmt.setInt(1, activityId);

			deleteRow = pstmt.executeUpdate();
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
		} finally {
			SQLUtil.closeResource(con, pstmt, null);
		}

		return deleteRow;
	}

	@Override
	public int update(ActivityVO vo) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int updateRow;

		try {
			con = DriverManager.getConnection(SQLUtil.URL, SQLUtil.USER, SQLUtil.PASSWORD);
			pstmt = con.prepareStatement(UPDATE);

//			pstmt.setInt(1, vo.getOrganizerMemberId());
//			pstmt.setInt(13, vo.getStatus());
			pstmt.setInt(1, vo.getType());
			pstmt.setString(2, vo.getName());
			pstmt.setString(3, vo.getContent());
			pstmt.setTimestamp(4, vo.getLaunchedDate());
			pstmt.setTimestamp(5, vo.getApplyStartDate());
			pstmt.setTimestamp(6, vo.getApplyEndDate());
			pstmt.setString(7, vo.getLocation());
			pstmt.setInt(8, vo.getCost());
			pstmt.setInt(9, vo.getApplyMemberExisting());
			pstmt.setInt(10, vo.getMaxMember());
			pstmt.setInt(11, vo.getMinMember());
			pstmt.setTimestamp(12, vo.getStartDate());
			pstmt.setTimestamp(13, vo.getEndDate());
			pstmt.setInt(14, vo.getActivityId());

			updateRow = pstmt.executeUpdate();
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
		} finally {
			SQLUtil.closeResource(con, pstmt, null);
		}
		return updateRow;
	}

	@Override
	public ActivityVO selectById(Integer activityId) {
		ActivityVO vo = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = DriverManager.getConnection(SQLUtil.URL, SQLUtil.USER, SQLUtil.PASSWORD);
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setInt(1, activityId);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				vo = new ActivityVO();
				vo.setActivityId(rs.getInt("ACT_ID"));
				vo.setOrganizerMemberId(rs.getInt("ACT_ORGANIZER_MEM_ID"));
				vo.setType(rs.getInt("ACT_TYPE"));
				vo.setName(rs.getString("ACT_NAME"));
				vo.setContent(rs.getString("ACT_CONTENT"));
				vo.setLaunchedDate(rs.getTimestamp("ACT_LAUNCHTIME"));
				vo.setApplyStartDate(rs.getTimestamp("ACT_APPLY_STARTTIME"));
				vo.setApplyEndDate(rs.getTimestamp("ACT_APPLY_ENDTIME"));
				vo.setLocation(rs.getString("ACT_LOCATION"));
				vo.setCost(rs.getInt("ACT_COST"));
				vo.setApplyMemberExisting(rs.getInt("ACT_APPLY_MEM_EXISTING"));
				vo.setMaxMember(rs.getInt("ACT_MAX_MEM"));
				vo.setMinMember(rs.getInt("ACT_MIN_MEM"));
				vo.setStartDate(rs.getTimestamp("ACT_STARTTIME"));
				vo.setEndDate(rs.getTimestamp("ACT_ENDTIME"));
				vo.setStatus(rs.getInt("ACT_STATUS"));

			}
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
		} finally {
			SQLUtil.closeResource(con, pstmt, rs);
		}

		return vo;
	}
	
	@Override
	public List<ActivityVO> selectAllByType(Integer type) {
		List<ActivityVO> list = new ArrayList<ActivityVO>();
		ActivityVO vo = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = DriverManager.getConnection(SQLUtil.URL, SQLUtil.USER, SQLUtil.PASSWORD);
			pstmt = con.prepareStatement(GET_ALL_STMT_TYPE);
			pstmt.setInt(1, type);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				vo = new ActivityVO();
				vo.setActivityId(rs.getInt("ACT_ID"));
				vo.setOrganizerMemberId(rs.getInt("ACT_ORGANIZER_MEM_ID"));
				vo.setType(rs.getInt("ACT_TYPE"));
				vo.setName(rs.getString("ACT_NAME"));
				vo.setContent(rs.getString("ACT_CONTENT"));
				vo.setLaunchedDate(rs.getTimestamp("ACT_LAUNCHTIME"));
				vo.setApplyStartDate(rs.getTimestamp("ACT_APPLY_STARTTIME"));
				vo.setApplyEndDate(rs.getTimestamp("ACT_APPLY_ENDTIME"));
				vo.setLocation(rs.getString("ACT_LOCATION"));
				vo.setCost(rs.getInt("ACT_COST"));
				vo.setApplyMemberExisting(rs.getInt("ACT_APPLY_MEM_EXISTING"));
				vo.setMaxMember(rs.getInt("ACT_MAX_MEM"));
				vo.setMinMember(rs.getInt("ACT_MIN_MEM"));
				vo.setStartDate(rs.getTimestamp("ACT_STARTTIME"));
				vo.setEndDate(rs.getTimestamp("ACT_ENDTIME"));
				vo.setStatus(rs.getInt("ACT_STATUS"));
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
	public List<ActivityVO> selectAllDesc() {
		List<ActivityVO> list = new ArrayList<ActivityVO>();
		ActivityVO vo = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = DriverManager.getConnection(SQLUtil.URL, SQLUtil.USER, SQLUtil.PASSWORD);
			pstmt = con.prepareStatement(GET_ALL_STMT_DESC);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				vo = new ActivityVO();
				vo.setActivityId(rs.getInt("ACT_ID"));
				vo.setOrganizerMemberId(rs.getInt("ACT_ORGANIZER_MEM_ID"));
				vo.setType(rs.getInt("ACT_TYPE"));
				vo.setName(rs.getString("ACT_NAME"));
				vo.setContent(rs.getString("ACT_CONTENT"));
				vo.setLaunchedDate(rs.getTimestamp("ACT_LAUNCHTIME"));
				vo.setApplyStartDate(rs.getTimestamp("ACT_APPLY_STARTTIME"));
				vo.setApplyEndDate(rs.getTimestamp("ACT_APPLY_ENDTIME"));
				vo.setLocation(rs.getString("ACT_LOCATION"));
				vo.setCost(rs.getInt("ACT_COST"));
				vo.setApplyMemberExisting(rs.getInt("ACT_APPLY_MEM_EXISTING"));
				vo.setMaxMember(rs.getInt("ACT_MAX_MEM"));
				vo.setMinMember(rs.getInt("ACT_MIN_MEM"));
				vo.setStartDate(rs.getTimestamp("ACT_STARTTIME"));
				vo.setEndDate(rs.getTimestamp("ACT_ENDTIME"));
				vo.setStatus(rs.getInt("ACT_STATUS"));
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
	public List<ActivityVO> selectAll() {
		List<ActivityVO> list = new ArrayList<ActivityVO>();
		ActivityVO vo = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = DriverManager.getConnection(SQLUtil.URL, SQLUtil.USER, SQLUtil.PASSWORD);
			pstmt = con.prepareStatement(GET_ALL_STMT);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				vo = new ActivityVO();
				vo.setActivityId(rs.getInt("ACT_ID"));
				vo.setOrganizerMemberId(rs.getInt("ACT_ORGANIZER_MEM_ID"));
				vo.setType(rs.getInt("ACT_TYPE"));
				vo.setName(rs.getString("ACT_NAME"));
				vo.setContent(rs.getString("ACT_CONTENT"));
				vo.setLaunchedDate(rs.getTimestamp("ACT_LAUNCHTIME"));
				vo.setApplyStartDate(rs.getTimestamp("ACT_APPLY_STARTTIME"));
				vo.setApplyEndDate(rs.getTimestamp("ACT_APPLY_ENDTIME"));
				vo.setLocation(rs.getString("ACT_LOCATION"));
				vo.setCost(rs.getInt("ACT_COST"));
				vo.setApplyMemberExisting(rs.getInt("ACT_APPLY_MEM_EXISTING"));
				vo.setMaxMember(rs.getInt("ACT_MAX_MEM"));
				vo.setMinMember(rs.getInt("ACT_MIN_MEM"));
				vo.setStartDate(rs.getTimestamp("ACT_STARTTIME"));
				vo.setEndDate(rs.getTimestamp("ACT_ENDTIME"));
				vo.setStatus(rs.getInt("ACT_STATUS"));
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
	public int addAttend(Integer activityId) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int updateRow=-1;
		try {
			con = DriverManager.getConnection(SQLUtil.URL, SQLUtil.USER, SQLUtil.PASSWORD);
			pstmt = con.prepareStatement(ADDATTEND);
			
			pstmt.setInt(1, activityId);

			updateRow = pstmt.executeUpdate();
			
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
		} finally {
			SQLUtil.closeResource(con, pstmt, null);
		}
		return updateRow;
	}
	
	@Override
	public int minusAttend(Integer activityId) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int updateRow=-1;
		try {
			con = DriverManager.getConnection(SQLUtil.URL, SQLUtil.USER, SQLUtil.PASSWORD);
			pstmt = con.prepareStatement(MINUSATTEND);
			
			pstmt.setInt(1, activityId);

			updateRow = pstmt.executeUpdate();
			
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
		} finally {
			SQLUtil.closeResource(con, pstmt, null);
		}
		return updateRow;
	}
		
				
}


