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

import bean.Nianji;
import bean.Fei;
import util.C3P0Utils;

/**
 * Servlet implementation class Getfeesort
 */
@WebServlet("/HuoQufeesort")
public class HuoQufeesort extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HuoQufeesort() {
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
		String fatherclass=request.getParameter("name");
		System.out.println(fatherclass);
		String sql="select * from fees where fatherclass=?";
		List<Fei>list=C3P0Utils.beanListHandler(sql, Fei.class, fatherclass);
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
