package com.product_photo.controller;

import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
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
import com.product_photo.model.ProductPhotoServiceImpl;

import core.util.SQLUtil;

@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 5 * 1024 * 1024, maxRequestSize = 5 * 5 * 1024 * 1024)
public class UpdatePhoto extends HttpServlet {

	InputStream inputStream = null;
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("開始update image");
		req.setCharacterEncoding("UTF-8");
		//【Part 物件】【DB】
		Part filepart = req.getPart("upImg");
		inputStream = filepart.getInputStream();
		Integer prodId = Integer.valueOf(req.getParameter("prodId"));	
		int row = update(inputStream,prodId);
		RequestDispatcher view = req
				.getRequestDispatcher("/front_end/product/homePage.jsp");
		view.forward(req, res);
	}
	
	public int update(InputStream file, Integer key) {
		String SQL = "update PRODUCT_PHOTO set PRODPH_PHOTO = ? where PRODPH_PROD_ID = ?";
		int row = 0;
		try {
			Connection con = DriverManager.getConnection(SQLUtil.URL, SQLUtil.USER, SQLUtil.PASSWORD);
			PreparedStatement pstmt = con.prepareStatement(SQL);
			// 必需從商品資訊取得自增主鍵值
			pstmt.setInt(2, key);
			pstmt.setBlob(1, file);
            row = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return row;
	}	

}
