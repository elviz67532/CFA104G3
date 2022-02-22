package com.product_photo.controller;

import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;
import java.io.IOException;
import java.io.InputStream;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.mysql.cj.xdevapi.Statement;

import core.util.SQLUtil;

@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 5 * 1024 * 1024, maxRequestSize = 5 * 5 * 1024 * 1024)
public class ProductPhotoServlet extends HttpServlet {

	InputStream inputStream = null;
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		req.setCharacterEncoding("UTF-8");
		
		List<String> errMsgs = new LinkedList<String>();
		req.setAttribute("errMsgs", errMsgs);
		
		try {
			Part filepart = req.getPart("upImg");
			inputStream = filepart.getInputStream();
			HttpSession session = req.getSession();
			System.out.println("HttpSession session = req.getSession():" + session);
			Integer key = Integer.valueOf((String) session.getAttribute("key"));
			System.out.println("session key:"+key);
			int row = uploadFile(inputStream, key);	
			if(row>0)
				System.out.println("圖片存到DB了");
			RequestDispatcher view = req
					.getRequestDispatcher("/front_end/product/homePage.jsp");
			view.forward(req, res);
			} 
			catch (Exception e) {
				errMsgs.add("取消修正圖片" + e.getMessage());
			}
		}

	// https://www.geeksforgeeks.org/how-to-add-image-to-mysql-database-using-servlet-and-jdbc/
	public int uploadFile(InputStream file, Integer key) {
		String SQL = "INSERT INTO PRODUCT_PHOTO " + "(PRODPH_PROD_ID, PRODPH_PHOTO) VALUES (?,?)";
		int row = 0;
		try {
			Connection con = DriverManager.getConnection(SQLUtil.URL, SQLUtil.USER, SQLUtil.PASSWORD);
			PreparedStatement pstmt = con.prepareStatement(SQL);
			// 必需從商品資訊取得自增主鍵值
			pstmt.setInt(1, key);
			pstmt.setBlob(2, file);
            row = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return row;
	}

}
