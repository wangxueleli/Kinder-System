package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Student;
import util.C3P0Utils;

/**
 * Servlet implementation class DeleteStu
 */
@WebServlet("/deleteStu")
public class DeleteStu extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteStu() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String id=request.getParameter("id");
		System.out.println(id);
		String sql="select * from stuinfo where stuno=?";
		Student student=C3P0Utils.beanHandler(sql, Student.class, id);
		sql="delete from stuinfo where stuno=?";
		C3P0Utils.update(sql, id);
		/*sql="select * from stuinfo order by updatetime desc ";
		List<Student>list=C3P0Utils.beanListHandler(sql, Student.class);*/
		sql="update classes set stuNumber=stuNumber-1 where classType=? and name=? "; //删除一个人数
		C3P0Utils.update(sql, student.getClasssort(),student.getClassname());
		//System.out.println(list.size()+"------------------");
		//request.getSession().setAttribute("list", list);
		//request.getSession().setAttribute("aaa", "你好");
		//response.sendRedirect("stuinfo.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		/*String id=request.getParameter("id");
		System.out.println(id);
		String sql="select * from stuinfo where stuno=?";
		Student student=C3P0Utils.beanHandler(sql, Student.class, id);
		sql="delete from stuinfo where stuno=?";
		C3P0Utils.update(sql, id);
		sql="select * from stuinfo order by updatetime desc ";
		List<Student>list=C3P0Utils.beanListHandler(sql, Student.class);
		sql="update class set nowp=nowp-1 where fatherid=(select id from classsort where classname=?) and name=? "; //删除一个人数
		C3P0Utils.update(sql, student.getClasssort(),student.getClassname());
		System.out.println(list.size()+"------------------");
		request.getSession().setAttribute("list", list);
		//request.getSession().setAttribute("aaa", "你好");
		response.sendRedirect("stuinfo.jsp");*/
		doGet(request, response);
	}

}
