package web;


import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daomain.User;
import service.UserService;
/**
 * 
* @author: qlq
* @date :  2017年7月6日上午10:18:39
* @description:get ALL pucture  from database and show in JSP page
 */



@WebServlet("/xianshishangpin")
public class UserListServlet extends HttpServlet {
	
	private UserService userService=null;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		userService = new UserService();
		List<User> userList = userService.findAllUser();

		String realPath = request.getContextPath();
		System.out.println(realPath);
		request.setAttribute("path", realPath);
		//商品的集合准备好
		//将数据存到request域 转发给product_list.js进行显示
		request.setAttribute("userList", userList);
		for(User u:userList){
			System.out.println(u.getPicture());
		}
		request.getRequestDispatcher("/shangpinxianshi.jsp").forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}