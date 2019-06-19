package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.MorningCheck;
import util.C3P0Utils;

/**
 * Servlet implementation class DeleteStu
 */

@WebServlet("/Deletemc")
public class Deletemc extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Deletemc() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String id=request.getParameter("id");
		System.out.println(id);
		String sql="select * from morningcheck where stuno=?";
		MorningCheck student=C3P0Utils.beanHandler(sql, MorningCheck.class, id);
		sql="delete from morningcheck where stuno=?";
		C3P0Utils.update(sql, id);
		sql="select * from morningcheck";
		List<MorningCheck>list=C3P0Utils.beanListHandler(sql, MorningCheck.class);
		sql="update class set nowp=nowp-1 where fatherid=(select id from classsort where classname=?) and name=? "; //ɾ��һ������
		C3P0Utils.update(sql, student.getClasssort(),student.getClassname());
		System.out.println(list.size()+"------------------");
		request.getSession().setAttribute("list", list);
		//request.getSession().setAttribute("aaa", "���");
		response.sendRedirect("morningcheck.jsp");
	}

}
