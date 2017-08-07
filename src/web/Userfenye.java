package web;



import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daomain.User;
import service.UserService;
import utils.PageBean;
@WebServlet("/userfenye")
public class Userfenye extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		UserService service = new UserService();
		
		//模拟当前是第一页，如果刚进来显示第一页数据
		String currentPageStr = request.getParameter("currentPage");
		if(currentPageStr==null) currentPageStr="1";
		int currentPage = Integer.parseInt(currentPageStr);
		//认为每页显示12条，后期可以根据用户输入设置每页显示的页数
		int currentCount = 8;
		
		PageBean<User> pageBean = null;
		try {
			pageBean = service.findPageBean(currentPage,currentCount);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		request.setAttribute("pageBean", pageBean);
		System.out.println(pageBean.getProductList());
		
		request.getRequestDispatcher("/shangpinxianshi.jsp").forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}