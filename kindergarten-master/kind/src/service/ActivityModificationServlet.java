package service;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Activity;
import util.C3P0Utils;

/**
 * Servlet implementation class ActivityModificationServlet
 */
@WebServlet("/activityModification")
public class ActivityModificationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ActivityModificationServlet() {
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
		String times=request.getParameter("times");
		String daytime=request.getParameter("daytime");
		String leader=C3P0Utils.setUTF8(request.getParameter("leader"));
		String phone=request.getParameter("phone");
		String description=C3P0Utils.setUTF8(request.getParameter("description"));
		String sql="update activity set  name=?, times=?, daytime=?, leader=?,  phone=?,description=?  where id=?";
		C3P0Utils.update(sql, name, times, daytime, leader, phone, description,id);
		String sql1="select * from activity order by `times` desc";
		List<Activity> list=C3P0Utils.beanListHandler(sql1, Activity.class);
		System.out.println(list.size()+"------------------");
		request.getSession().setAttribute("listActivity", list);
		response.sendRedirect("activity.jsp");*/
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String id=request.getParameter("id");
		String name=request.getParameter("name");
		System.out.println("&&&"+name);
		String times=request.getParameter("times");
		String daytime=request.getParameter("daytime");
		String leader=request.getParameter("leader");
		String phone=request.getParameter("phone");
		String description=request.getParameter("description");
		String sql="update activity set  name=?, times=?, daytime=?, leader=?,  phone=?,description=?  where id=?";
		C3P0Utils.update(sql, name, times, daytime, leader, phone, description,id);
		String sql1="select * from activity order by `times` desc";
		List<Activity> list=C3P0Utils.beanListHandler(sql1, Activity.class);
		System.out.println(list.size()+"------------------");
		request.getSession().setAttribute("listActivity", list);
		response.sendRedirect("activity.jsp");
		System.out.println(2);
	}

}
