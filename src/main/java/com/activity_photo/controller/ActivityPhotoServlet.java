package com.activity_photo.controller;

import java.io.BufferedInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.UnavailableException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import core.util.SQLUtil;

public class ActivityPhotoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection con;

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
//		doPost(req, res);
		res.setContentType("image/*");
		ServletOutputStream out = res.getOutputStream();
//		System.out.println("test1");
		
		String pathInfo = req.getPathInfo();
		System.out.println(pathInfo );
		try {
			Statement stmt = con.createStatement();
			String id = req.getParameter("ACTP_ACT_ID");
			ResultSet rs = stmt.executeQuery(
					"SELECT ACTP_PHOTO FROM activity_photo WHERE ACTP_ACT_ID =" + id);

			if (rs.next()) {
				BufferedInputStream in = new BufferedInputStream(rs.getBinaryStream("ACTP_PHOTO"));
				byte[] buf = new byte[4 * 1024]; // 4K buffer
				int len;
				while ((len = in.read(buf)) != -1) {
					out.write(buf, 0, len);
				}
				in.close();
//				System.out.println("1、" + buf.length);
			} else {
//				res.sendError(HttpServletResponse.SC_NOT_FOUND);
				InputStream in = getServletContext().getResourceAsStream("/asset/img/activityImage/nodata/20192.jpg");
				byte[] b = new byte[in.available()];
				in.read(b);
				out.write(b);
				in.close();
//				System.out.println("2、"+ b.length);
			}
			rs.close();
			stmt.close();
		} catch (Exception e) {
			e.printStackTrace();
			InputStream in = getServletContext().getResourceAsStream("/asset/img/activityImage/nodata/20192.jpg");
			byte[] b = new byte[in.available()];
			in.read(b);
			out.write(b);
			in.close();
//			System.out.println("3、"+ b.length);
		}
	}

	public void init() throws ServletException {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection(SQLUtil.URL, SQLUtil.USER, SQLUtil.PASSWORD);
		} catch (ClassNotFoundException e) {
			throw new UnavailableException("Couldn't load JdbcOdbcDriver");
		} catch (SQLException e) {
			throw new UnavailableException("Couldn't get db connection");
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

}
