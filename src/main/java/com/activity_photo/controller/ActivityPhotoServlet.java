package com.activity_photo.controller;

import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.activity_photo.model.ActivityPhotoService;
import com.activity_photo.model.ActivityPhotoServiceImpl;
import com.activity_photo.model.ActivityPhotoVO;

public class ActivityPhotoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
//		doPost(req, res);
		res.setContentType("image/*");
		ServletOutputStream out = res.getOutputStream();

		try {
			String id = req.getParameter("ACTP_ACT_ID");
			int actId = Integer.parseInt(id);

			ActivityPhotoService service = new ActivityPhotoServiceImpl();
			ActivityPhotoVO activityPhoto = service.findActPhotoByActId(actId);
			if (activityPhoto != null && activityPhoto.getPhoto() != null) {
				out.write(activityPhoto.getPhoto());
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
