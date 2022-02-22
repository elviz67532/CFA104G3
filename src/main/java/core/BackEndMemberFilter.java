package core;

import java.io.IOException;
import java.util.Enumeration;
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

import com.server_manager.model.ServerManagerVO;
import com.server_manager_auth.model.ServerManagerAuthVO;

public class BackEndMemberFilter implements Filter {
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
		session.setAttribute("beforeLoginURL", req.getRequestURI());
		ServerManagerVO smVO = (ServerManagerVO) session.getAttribute("ServerManagerVO");
		if (smVO == null) {
			System.out.println("尚未登入");
			res.sendRedirect(req.getContextPath() + "/back_end/server_manager/loginServer.jsp");
			return;
		}

		// 判斷當前路徑所需權限
		String servletPath = req.getServletPath();
		Integer currentURLAuth = urlAuths.get(servletPath);
		if (currentURLAuth == null) {
			System.out.println("當前頁面無須權限, 請檢查xml設定, url=" + servletPath);
			chain.doFilter(request, response);
			return;
		}
		
		// 判斷使用者權限
			//【取得session】
		List<ServerManagerAuthVO> authVos = (List<ServerManagerAuthVO>) session.getAttribute("auth");
		if (authVos == null) {
			System.out.println("使用者無此權限");
			res.sendRedirect(req.getContextPath() + "/back_end/server_manager/unAuth.jsp");
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
			res.sendRedirect(req.getContextPath() + "/back_end/server_manager/unAuth.jsp");
		}
		
		chain.doFilter(request, response);
	}

	private void initAuths() {
		Enumeration<String> initParameterNames = config.getInitParameterNames();
		while(initParameterNames.hasMoreElements()) {
			String urls = initParameterNames.nextElement();
			String urlAuth = config.getInitParameter(urls);
			Integer authCode = Integer.valueOf(urlAuth);
			urlAuths.put(urls, authCode);
		}
	}
}	