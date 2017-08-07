package web.filter;

import java.io.IOException;
import java.net.URLDecoder;
import java.net.URLEncoder;

import javax.activation.URLDataSource;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import daomain.User;
import service.UserService;

/**
 * Servlet Filter implementation class autoLoginFilter
 */
public class autoLoginFilter implements Filter {

    /**
     * Default constructor. 
     */
    public autoLoginFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}


	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
//		获得cookie进行用户名进行登录
		HttpServletRequest req =(HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		HttpSession session = req.getSession();
		Cookie[] cookies = req.getCookies();
		String username = null;
		String password = null;
		
		if(cookies!=null){
//			获得名字是username password的cookie
			for(Cookie cookie:cookies){
				if(cookie.getName().equals("username")){
//					cookie不能设置中文，需要进行编码
					username = URLDecoder.decode(cookie.getValue(), "UTF-8");
				}
				if(cookie.getName().equals("password")){
					password = cookie.getValue();
				}
			}
		}
		
//		判断用户名和密码是否为空
		if(username!=null&&password!=null){
			UserService userService = new UserService();
			User user = userService.findUserByNamePassword(username, password);
			// 登录成功
			if (user != null) {
				System.out.println(user.getName() + user.getPassword());
				session.setAttribute("user", user);
				}
		}
		// pass the request along the filter chain
		chain.doFilter(request, response);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
