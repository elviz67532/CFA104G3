package core;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.member.model.MemberVO;

public class FrontEndMemberFilter implements Filter {

	private FilterConfig config;

	@Override
	public void init(FilterConfig config) throws ServletException {
		this.config = config;
	}

	@Override
	public void destroy() {
		this.config = null;
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		System.out.println("doFilter");
		// 非httpServletRequest
		if (!(request instanceof HttpServletRequest) || !(response instanceof HttpServletResponse)) {
			chain.doFilter(request, response);
			return;
		}

		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;

		HttpSession session = req.getSession();
		MemberVO memberVo = (MemberVO) session.getAttribute("memberVO");
		if (memberVo == null) {
			System.out.println("尚未登入");
			res.sendRedirect(req.getContextPath() + "/front_end/member/login.jsp");
			return;
		}

		int status = memberVo.getStatus();
		switch (status) {
		case 0:// 未驗證
			System.out.println("會員未驗證");
			res.sendRedirect(req.getContextPath() + "/front_end/member/notverify.jsp");
			break;
		case 1:// 已驗證
			System.out.println("登入會員名稱=" + memberVo.getName());
			chain.doFilter(request, response);
			break;
		case 2:// 停權
			System.out.println("會員已停權");
			res.sendRedirect(req.getContextPath() + "/front_end/member/banmember.jsp.jsp");
			break;
		default:
			System.out.println("會員狀態異常, 狀態=" + status);
			res.sendRedirect(req.getContextPath() + "/index.jsp");
			break;
		}
	}
}
