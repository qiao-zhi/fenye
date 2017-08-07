package web;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import net.sf.json.JSONArray;
import service.UserService;

@WebServlet("/zhanneisousuo")
public class ZhanNeiSouSuo extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public ZhanNeiSouSuo() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String word = request.getParameter("word");
		UserService us = new UserService();
		List<Object> objList=null;
		try {
			 objList= us.findUserName(word);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
//		对返回的集合进行JSON转换，这个针对单个对象与集合有不同方法
		JSONArray fromObject = JSONArray.fromObject(objList);
		String string = fromObject.toString();
		System.out.println(string);
		
		
		//谷歌公司的，转一个或者集合都是这个方法
		Gson gson = new Gson();
		String json = gson.toJson(objList);
		System.out.println(json);
		response.setCharacterEncoding("utf-8");
		response.getWriter().write(json);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
