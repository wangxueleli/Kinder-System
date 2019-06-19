package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Admin;
import bean.Student;
import util.C3P0Utils;

/**
 * Servlet implementation class Stuinformation
 */
@WebServlet("/stuinformation")
public class Stuinformation extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Stuinformation() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		/*String name=request.getParameter("name");
		String password=request.getParameter("password");
		String sql="select * from admin where name=? and password=?";
		Admin admin=C3P0Utils.beanHandler(sql, Admin.class, name,password);
		if(admin!=null) {
			request.getSession().setAttribute("admin", admin);*/
			String sql="select * from stuinfo order by updatetime desc";
			List<Student>list=C3P0Utils.beanListHandler(sql, Student.class);
			System.out.println(list.size()+"------------------");
			request.getSession().setAttribute("list", list);
			//request.getSession().setAttribute("aaa", "ÄãºÃ");
			response.sendRedirect("stuinfo.jsp");
		/*}else {
			response.sendRedirect("login.html");
		}*/
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
