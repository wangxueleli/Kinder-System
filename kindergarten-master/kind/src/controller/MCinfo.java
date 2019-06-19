package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;

import bean.RenYuan;
import bean.MorningCheck;
import dao.ApacheDBUtil;
import util.C3P0Utils;


/**
 * Servlet implementation class CustomerSelectAll
 */
@WebServlet("/MCinfo")
public class MCinfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MCinfo() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<RenYuan> list=new ApacheDBUtil().findListBean("select *  from  Person", null, RenYuan.class);
		/*String sql="select * from morningcheck";
		List<Student>list=C3P0Utils.beanListHandler(sql, Student.class);*/
		System.out.println(list.size()+"------------------");
		request.getSession().setAttribute("list", list);
		request.getSession().setAttribute("aaa", "���");
		response.sendRedirect("morningcheck.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
