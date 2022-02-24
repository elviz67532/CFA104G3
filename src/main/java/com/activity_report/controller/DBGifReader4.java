package com.activity_report.controller;

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

import com.activity_photo.model.ActivityPhotoService;
import com.activity_photo.model.ActivityPhotoServiceImpl;
import com.activity_photo.model.ActivityPhotoVO;
import com.activity_report.model.ActivityReportService;
import com.activity_report.model.ActivityReportServiceImpl;
import com.activity_report.model.ActivityReportVO;


public class DBGifReader4 extends HttpServlet {
	private static final long serialVersionUID = 1L;
//	Connection con;

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		res.setContentType("image/*");
		ServletOutputStream out = res.getOutputStream();

		try {
			String id = req.getParameter("ACTC_ID");
			int actId = Integer.parseInt(id);

			ActivityReportService service = new ActivityReportServiceImpl();
			ActivityReportVO oneActr = service.getOneActr(actId);
			if (oneActr != null && oneActr.getPhoto() != null) {
				out.write(oneActr.getPhoto());
			} else {
				InputStream in = getServletContext().getResourceAsStream("/asset/img/activityImage/nodata/20192.jpg");
				byte[] b = new byte[in.available()];
				in.read(b);
				out.write(b);
				in.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
			InputStream in = getServletContext().getResourceAsStream("/asset/img/activityImage/nodata/20192.jpg");
			byte[] b = new byte[in.available()];
			in.read(b);
			out.write(b);
			in.close();
		}
	}
}