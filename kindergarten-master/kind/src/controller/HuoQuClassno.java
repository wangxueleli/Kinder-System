package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;

import bean.NianJiFenLei;
import bean.Nianji;
import util.C3P0Utils;

/**
 * Servlet implementation class GetClassno
 */
@WebServlet("/HuoQuClassno")
public class HuoQuClassno extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HuoQuClassno() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String classname=request.getParameter("name");
		System.out.println(classname);
		String sql="select * from class where fatherid =(select id from classsort where classname=?)";
		List<Nianji>list=C3P0Utils.beanListHandler(sql, Nianji.class, classname);
		String json=JSON.toJSONString(list);
		System.out.println(json);
		PrintWriter printWriter=response.getWriter();
		printWriter.append(json);
		printWriter.flush();
		printWriter.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
