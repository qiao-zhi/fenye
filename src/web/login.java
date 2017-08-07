package web;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daomain.User;
import service.UserService;

/**
 * 
 * @author: qlq
 * @date : 2017年7月6日上午10:19:37
 * @description: chuli denglu
 */

@WebServlet("/login")
public class login extends HttpServlet {
	private UserService userService = null;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		// 获取客户端输入
		String name = request.getParameter("name");  
		System.out.println(name);
		String password = request.getParameter("password");
		System.out.println(name + "\t" + password);
		userService = new UserService();
		User user = userService.findUserByNamePassword(name, password);
		// 登录成功
		if (user != null) {
			System.out.println(user.getName() + user.getPassword());
			request.getSession().setAttribute("user", user);
			System.out.println(user);
			String autologin = request.getParameter("autologin");
//			如果用户选择自动登录
			if (autologin != null) {
//				增加cookie,解码防止中文乱码
				Cookie cookie_username=new Cookie("username", URLEncoder.encode(user.getName(),"UTF-8"));
				Cookie cookie_password=new Cookie("password", user.getPassword());
//				设置生命期
				cookie_password.setMaxAge(60*60*24);
				cookie_username.setMaxAge(60*60*24);
//				设置cookie的携带路径
				cookie_password.setPath(request.getContextPath());
				cookie_username.setPath(request.getContextPath());
//				增加cookie
				response.addCookie(cookie_username);
				response.addCookie(cookie_password);
				System.out.println(autologin);
				
			} else {

			}
			request.getRequestDispatcher("/index.jsp").forward(request, response);
		}
		// 登录失败
		else {
			request.getRequestDispatcher("/login.html").forward(request, response);
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}