package service;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Accident;
import util.C3P0Utils;

/**
 * Servlet implementation class AccidentModificationServlet
 */
@WebServlet("/accidentModification")
public class AccidentModificationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AccidentModificationServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	/*	request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String id=request.getParameter("id");
		String name=C3P0Utils.setUTF8(request.getParameter("name"));
		System.out.println("***"+name);
		String date=request.getParameter("date");
		String accident=C3P0Utils.setUTF8(request.getParameter("accident"));
		String dispose=C3P0Utils.setUTF8(request.getParameter("dispose"));
		String inform=C3P0Utils.setUTF8(request.getParameter("inform"));
		String sql="update accident set  name=?, date=?, accident=?, dispose=?,  inform=?  where id=?";
		C3P0Utils.update(sql, name, date, accident,dispose, inform,id);
		String sql1="select * from accident ";
		List<Accident> list=C3P0Utils.beanListHandler(sql1, Accident.class);
		System.out.println(list.size()+"------------------");
		request.getSession().setAttribute("listAccident", list);
		response.sendRedirect("accident.jsp");*/
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String id=request.getParameter("id");
		String name=request.getParameter("name");
		System.out.println("$$$$"+name);
		String date=request.getParameter("date");
		String accident=request.getParameter("accident");
		String dispose=request.getParameter("dispose");
		String inform=request.getParameter("inform");
		String sql="update accident set  name=?, date=?, accident=?, dispose=?,  inform=?  where id=?";
		C3P0Utils.update(sql, name, date, accident,dispose, inform,id);
		String sql1="select * from accident ";
		List<Accident> list=C3P0Utils.beanListHandler(sql1, Accident.class);
		System.out.println(list.size()+"------------------");
		request.getSession().setAttribute("listAccident", list);
		response.sendRedirect("accident.jsp");
	}

}
