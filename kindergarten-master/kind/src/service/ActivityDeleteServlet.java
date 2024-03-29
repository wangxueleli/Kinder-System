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
 * Servlet implementation class ActivityDeleteServlet
 */
@WebServlet("/activityDelete")
public class ActivityDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ActivityDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String id=request.getParameter("id");
		System.out.println("delete" + id);
		 String sql ="delete from activity where id=?";
		 C3P0Utils.update(sql, id);
		 String sql1="select * from activity order by `times` desc";
			List<Activity> list=C3P0Utils.beanListHandler(sql1, Activity.class);
			System.out.println(list.size()+"------------------");
			request.getSession().setAttribute("listActivity", list);
			response.sendRedirect("activity.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
