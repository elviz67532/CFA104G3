package core;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.member.model.MemberVO;
import com.server_manager_auth.model.ServerManagerAuthVO;

public class BackEndMemberFilter implements Filter {
	private final static Integer SERVER_MANAGER = 1;
	private final static Integer ACTIVITY = 10;
	private final static Integer DOUBLE_PROD = 20;
	private final static Integer MOVE = 30;
	private final static Integer MEMBER = 40;
	private final static Integer FAQ = 50;
	
	//【URL】
	private final static String server_manager = "http://localhost:8081/CFA104G3/back_end/server_manager/serverManager.jsp";
	private final static String activity = "http://localhost:8081/CFA104G3/back_end/server_manager/activity.jsp";
	private final static String double_product = "http://localhost:8081/CFA104G3/back_end/server_manager/doubleProduct.jsp";
	private final static String move = "http://localhost:8081/CFA104G3/back_end/server_manager/move.jsp";
	private final static String manager = "http://localhost:8081/CFA104G3/back_end/server_manager/member.jsp";
	private final static String faq = "http://localhost:8081/CFA104G3/back_end/server_manager/FAQ.jsp";

	private FilterConfig config;
	private Map<String, Integer> urlAuths = new HashMap<String, Integer>();
	
	
	@Override
	public void init(FilterConfig config) throws ServletException {
		this.config = config;
		initAuths(); // 【導入網頁】
	}

	@Override
	public void destroy() {
		this.config = null;
		this.urlAuths.clear();
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
		
		HttpServletRequest req = (HttpServletRequest)request; 
		HttpServletResponse res = (HttpServletResponse)response;
		
		// 判斷是否登入 【目前登入不在filter】
		HttpSession session = req.getSession();
		String account = (String) session.getAttribute("account");
		if (account == null) {
			System.out.println("尚未登入");
			res.sendRedirect("/CFA104G3/back_end/server_manager/loginServer.jsp");
			return;
		}

		// 判斷當前路徑所需權限
		String servletPath = req.getServletPath();
		Integer currentURLAuth = urlAuths.get(servletPath);
		if (currentURLAuth == null) {
			System.out.println("當前頁面無須權限, 請檢查xml設定");
			chain.doFilter(request, response);
			return;
		}
		
		// 判斷使用者權限
			//【取得session】
		List<ServerManagerAuthVO> authVos = (List<ServerManagerAuthVO>) session.getAttribute("auth");
		if (authVos == null) {
			System.out.println("使用者無此權限");
			res.sendRedirect("http://localhost:8081/CFA104G3/back_end/server_manager/unAuth.jsp");
			return;
		}
		//【賦予權限】
		boolean hasAuth = false;
		// 擁有權限
		for (ServerManagerAuthVO authVo : authVos) { // user 登入一個網頁檢查一次
			if(authVo.getSmgeAuthId() == currentURLAuth) {
				hasAuth = true;
				break;
			}
		}
		// 無權限
		if (!hasAuth) {
			System.out.println("未授權");
			res.sendRedirect("/CFA104G3/back_end/server_manager/unAuth.jsp");
		}
		
		chain.doFilter(request, response);
	}

	private void initAuths() {
		//【a tag 的連接】
		urlAuths.put("/back_end/server_manager/server.jsp", SERVER_MANAGER);
		urlAuths.put("/back_end/server_manager/activity.jsp", ACTIVITY);
		urlAuths.put("/back_end/server_manager/product.jsp", DOUBLE_PROD);
		urlAuths.put("/back_end/move/moveRequestManage.jsp", MOVE); 
		urlAuths.put("/back_end/server_manager/manager.jsp",MEMBER);
		urlAuths.put("/back_end/server_manager/FAQ.jsp", FAQ);
	}
}	


//		boolean hasAuthSM = false;
//		boolean hasAuthACT = false;
//		boolean hasAuthDprod = false;
//		boolean hasAuthMove = false;
//		boolean hasAuthMan = false;
//		boolean hasAuthFaq = false;
//		for(ServerManagerAuthVO authVo : authVos) {
//			if(authVo.getSmgeAuthId() == SERVER_MANAGER) {
//				hasAuthSM = true;
//				session.setAttribute("hasAuthSM", hasAuthSM);
//			}
//			else if (authVo.getSmgeAuthId() == ACTIVITY) {
//				hasAuthACT = true;
//				session.setAttribute("hasAuthACT", hasAuthACT);
//			}
//			else if(authVo.getSmgeAuthId() == DOUBLE_PROD) {
//				hasAuthDprod = true;
//				session.setAttribute("hasAuthDprod", hasAuthDprod);
//				System.out.println("獲得hasAuthDprod");
//			}	
//			else if(authVo.getSmgeAuthId() == MOVE) {
//				hasAuthMove = true;
//				session.setAttribute("hasAuthMove", hasAuthMove);
//			}
//			else if(authVo.getSmgeAuthId() == MEMBER) {
//				hasAuthMan = true;
//				session.setAttribute("hasAuthMan", hasAuthMan);
//			}
//			else if(authVo.getSmgeAuthId() == FAQ) {
//				hasAuthFaq = true;
//				session.setAttribute("hasAuthFaq", hasAuthFaq);
//			}
//		}