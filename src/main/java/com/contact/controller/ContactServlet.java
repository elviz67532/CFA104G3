package com.contact.controller;

import java.io.IOException;
import java.util.*;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.member.model.MailService;

public class ContactServlet extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		System.out.println("我有進來");

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");

		if ("addmassage".equals(action)) {

//			List<String> errorMsgs = new LinkedList<String>();
			Map<String, String> errorMsgs = new HashMap<String, String>();

			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 ****************************************/
				String name = req.getParameter("name");
				String email = req.getParameter("email");
				String phone = req.getParameter("phone");
				String massage = req.getParameter("massage");
				int result = 0;
				if (name == null || (name.trim()).length() == 0) {
					result = 0;
					errorMsgs.put("0", "請輸入姓名");
				}

				String emailReg = "/^([\\w\\.\\-]){1,64}\\@([\\w\\.\\-]){1,64}$/";
				if (email == null || (email.trim()).length() == 0) {
					errorMsgs.put("0", "請輸入電子信箱");
				} else if (!email.trim().matches(emailReg)) { // 以下練習正則(規)表示式(regular-expression)
					errorMsgs.put("0", "電子信箱格式錯誤");
				}

				String phoneReg = "/^09\\d{2}-?\\d{3}-?\\d{3}$/";
				if (phone == null || (phone.trim()).length() == 0) {
					errorMsgs.put("0", "請輸入手機號碼");
				} else if (!phone.trim().matches(phoneReg)) { // 以下練習正則(規)表示式(regular-expression)
					errorMsgs.put("0", "手機號碼格式錯誤");
				}

				if (massage == null || (massage.trim()).length() == 0) {
					errorMsgs.put("0", "請輸入訊息");
				} else {
					result = 1;
				}

				if (result == 1) {
					req.setAttribute("result", 1);

				} else {
					req.setAttribute("result", 0);

				}

				/*************************** 2.開始查詢資料 ****************************************/

				String to = "xtn30113@uooos.com";
				String subject = email + "傳送訊息給您";
				String messageText = "你好,我是" + name + ",我的手機號碼是" + phone + ",電子信箱是" + email + "," + massage;

				MailService mailService = new MailService();
				mailService.sendToSelf(subject, messageText);

//
//				// 設定使用SSL連線至 Gmail smtp Server
//				Properties props = new Properties();
//				props.put("mail.smtp.host", "smtp.gmail.com");
//				props.put("mail.smtp.socketFactory.port", "465");
//				props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
//				props.put("mail.smtp.auth", "true");
//				props.put("mail.smtp.port", "465");
//				// ●設定 gmail 的帳號 & 密碼 (將藉由你的Gmail來傳送Email)
//				// ●須將myGmail的【安全性較低的應用程式存取權】打開
//				final String myGmail = "encored98931@gmail.com"; // TODD還沒放帳號密碼
//				final String myGmail_password = "arirswxcbvdncjje";
//				Session session = Session.getInstance(props, new Authenticator() {
//					protected PasswordAuthentication getPasswordAuthentication() {
//						return new PasswordAuthentication(myGmail, myGmail_password);
//					}
//				});
//
//				MimeMessage message = new MimeMessage(session);
//				message.setFrom(new InternetAddress(myGmail));
//				message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
//
//				// 設定信中的主旨
//				message.setSubject(subject, "UTF-8");
//				// 設定信中的內容
////					message.setText(messageText);
//				message.setContent(messageText, "text/html;charset=UTF-8");
//				Transport.send(message);

//			} catch (MessagingException e) {
//				System.out.println("傳送失敗!");
//				e.printStackTrace();
//			}
				System.out.println(result);
				/*************************** 3.查詢完成,準備轉交(Send the Success view) ************/

				String url = "/contact.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 成功轉交 update_Faq_input.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 **********************************/

			} catch (Exception e) {
				errorMsgs.put("0", "傳送失敗!");
				RequestDispatcher failureView = req.getRequestDispatcher("/CFA104G3/contact.jsp");
				failureView.forward(req, res);
			}
		}

	}
}