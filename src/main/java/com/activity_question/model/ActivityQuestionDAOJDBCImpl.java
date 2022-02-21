package com.activity_question.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import core.dao.CoreDao;
import core.util.SQLUtil;

public class ActivityQuestionDAOJDBCImpl implements ActivityQuestionDAO {
	private static final String GET_ALL_STMT = "select * from ACTIVITY_QUESTION";
	private static final String GET_ONE_STMT = "select * from ACTIVITY_QUESTION where ACTQ_ID = ?";
	/*
	 * =============================================================================
	 * ==================
	 */
	// 會員提問 ACTQ_PROMCONTENT 提問 , ACTQ_PROMDATE 提問時間
	private static final String INSERT_STMT = "insert into ACTIVITY_QUESTION"
			+ "(ACTQ_ACT_ID, ACTQ_MEM_ID, ACTQ_PROMCONTENT,ACTQ_PROMDATE)" 
			+ "values (?, ?, ?, ?)";
	// 主辦方回覆 ACTQ_REPCONTENT 答覆 , ACTQ_REPDATE 答覆時間
	private static final String UPDATE = "update ACTIVITY_QUESTION set " + "ACTQ_REPCONTENT = ? , ACTQ_REPDATE = ? "
			+ "where ACTQ_ID = ? ";
	// 不當發言
	private static final String DELETE = "delete FROM ACTIVITY_QUESTION where ACTQ_ID = ?";
	// 查詢所有針對這筆活動的評論
	private static final String GET_ALL_Q_DESC = "select * from ACTIVITY_QUESTION "
			+ "where actq_act_id = ? order by actq_id desc ; ";

	static {
		try {
			Class.forName(SQLUtil.DRIVER);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	@Override
	public int insert(ActivityQuestionVO vo) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int id = -1;


		try {
			con = DriverManager.getConnection(SQLUtil.URL, SQLUtil.USER, SQLUtil.PASSWORD);
			pstmt = con.prepareStatement(INSERT_STMT, PreparedStatement.RETURN_GENERATED_KEYS);

			pstmt.setInt(1, vo.getActivityId());
			pstmt.setInt(2, vo.getMemberId());
			pstmt.setString(3, vo.getProblem());
			pstmt.setTimestamp(4, vo.getProblemDate());
//			pstmt.setString(4, vo.getReply());
//			pstmt.setTimestamp(6, vo.getReplyDate());

			int insertedRow = pstmt.executeUpdate();
			//確定PK
			if(insertedRow > 0) {
				//找PK
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
	public int update(ActivityQuestionVO vo) {
		Connection con = null;
		PreparedStatement pstmt = null;

		int updateRow;

		try {
			con = DriverManager.getConnection(SQLUtil.URL, SQLUtil.USER, SQLUtil.PASSWORD);
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setString(1, vo.getReply());
			pstmt.setTimestamp(2, vo.getReplyDate());
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
	public ActivityQuestionVO selectById(Integer id) {
		ActivityQuestionVO vo = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = DriverManager.getConnection(SQLUtil.URL, SQLUtil.USER, SQLUtil.PASSWORD);
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setInt(1, id);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				vo = new ActivityQuestionVO();
				vo.setId(rs.getInt("ACTQ_ID"));
				vo.setActivityId(rs.getInt("ACTQ_ACT_ID"));
				vo.setMemberId(rs.getInt("ACTQ_MEM_ID"));
				vo.setProblem(rs.getString("ACTQ_PROMCONTENT"));
				vo.setReply(rs.getString("ACTQ_REPCONTENT"));
				vo.setProblemDate(rs.getTimestamp("ACTQ_PROMDATE"));
				vo.setReplyDate(rs.getTimestamp("ACTQ_REPDATE"));
			}
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
		} finally {
			SQLUtil.closeResource(con, pstmt, rs);
		}

		return vo;
	}

	@Override
	public List<ActivityQuestionVO> selectAll() {
		List<ActivityQuestionVO> list = new ArrayList<ActivityQuestionVO>();
		ActivityQuestionVO vo = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = DriverManager.getConnection(SQLUtil.URL, SQLUtil.USER, SQLUtil.PASSWORD);
			pstmt = con.prepareStatement(GET_ALL_STMT);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				vo = new ActivityQuestionVO();
				vo.setId(rs.getInt("ACTQ_ID"));
				vo.setActivityId(rs.getInt("ACTQ_ACT_ID"));
				vo.setMemberId(rs.getInt("ACTQ_MEM_ID"));
				vo.setProblem(rs.getString("ACTQ_PROMCONTENT"));
				vo.setReply(rs.getString("ACTQ_REPCONTENT"));
				vo.setProblemDate(rs.getTimestamp("ACTQ_PROMDATE"));
				vo.setReplyDate(rs.getTimestamp("ACTQ_REPDATE"));
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
	public List<ActivityQuestionVO> selectAllQuestionByAct(Integer activityId) {
		List<ActivityQuestionVO> list = new ArrayList<ActivityQuestionVO>();
		ActivityQuestionVO vo = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = DriverManager.getConnection(SQLUtil.URL, SQLUtil.USER, SQLUtil.PASSWORD);
			pstmt = con.prepareStatement(GET_ALL_Q_DESC);
			
			pstmt.setInt(1, activityId);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				vo = new ActivityQuestionVO();
				vo.setId(rs.getInt("ACTQ_ID"));
				vo.setActivityId(rs.getInt("ACTQ_ACT_ID"));
				vo.setMemberId(rs.getInt("ACTQ_MEM_ID"));
				vo.setProblem(rs.getString("ACTQ_PROMCONTENT"));
				vo.setReply(rs.getString("ACTQ_REPCONTENT"));
				vo.setProblemDate(rs.getTimestamp("ACTQ_PROMDATE"));
				vo.setReplyDate(rs.getTimestamp("ACTQ_REPDATE"));
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
