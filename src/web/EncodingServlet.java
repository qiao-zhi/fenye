package web;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author liqiang  
 * @version 创建时间：2017年7月8日  下午4:21:20
 * tags
 */
@WebServlet("/encodingServlet")
public class EncodingServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		
		
		String para = request.getParameter("name");
//		String para2 = new String(para.getBytes("iso-8859-1"),"utf-8");
		System.out.println(para);
		response.getWriter().write("你好"); 
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}