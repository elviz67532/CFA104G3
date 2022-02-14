package com.activity_photo.controller;

import java.io.BufferedInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import core.util.SQLUtil;

public class ActivityPhotoServlet {
	private static final long serialVersionUID = 1L;
	Connection con;

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
//		doPost(req, res);
		req.setCharacterEncoding("UTF-8"); // post
		res.setContentType("image/*");
		ServletOutputStream out = res.getOutputStream();

		try {
			Statement stmt = con.createStatement();
			String activityId = req.getParameter("activityId");
			ResultSet rs = stmt.executeQuery("SELECT ACTP_PHOTO FROM activity_photo WHERE ACTP_ACT_ID =" + activityId);

			if (rs.next()) {
				BufferedInputStream in = new BufferedInputStream(rs.getBinaryStream("ACTP_PHOTO"));
				byte[] buf = new byte[4 * 1024]; // 4K buffer
				int len;
				while ((len = in.read(buf)) != -1) {
					out.write(buf, 0, len);
				}
				in.close();
			} else {
				res.sendError(HttpServletResponse.SC_NOT_FOUND);

			}
			rs.close();
			stmt.close();
		} catch (Exception e) {
			e.printStackTrace();

		}
	}

	public void init() throws ServletException {
		Connection con = null;
		try {
			con = DriverManager.getConnection(SQLUtil.URL, SQLUtil.USER, SQLUtil.PASSWORD);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void destroy() {
		try {
			if (con != null)
				con.close();
		} catch (SQLException e) {
			System.out.println(e);
		}
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
	}
}
