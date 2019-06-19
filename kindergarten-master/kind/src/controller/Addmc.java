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
 * Servlet implementation class Addstu
 */
@WebServlet("/Addmc")
public class Addmc extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Addmc() {
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
		request.setCharacterEncoding("utf-8");
		//String stuno=request.getParameter("stuno");
		String stuname=request.getParameter("stuname");
		String sex=request.getParameter("sex");
		Integer age=Integer.valueOf(request.getParameter("age"));
		String classsort=request.getParameter("classsort");//��໹��С��
		String classno=request.getParameter("classno");//һ�� ����
		String parent=request.getParameter("parent");
		String phone=request.getParameter("phone");
		String chefei=request.getParameter("chefei");
		System.out.println(chefei+1);
		if(chefei==null) {
			chefei="δ�ɷ�";
		}
		String xuefei=request.getParameter("xuefei");
		System.out.println(xuefei+2);
		if(xuefei==null) {
			xuefei="δ�ɷ�";
		}
		String chifei=request.getParameter("chifei");
		System.out.println(chifei+3);
		if(chifei==null) {
			chifei="δ�ɷ�";
		}
		String address=request.getParameter("address");
		String carname=(String) request.getSession().getAttribute("carno");
		if(carname==null) {
			carname="��";
		}
		System.out.println(carname+1); //���û��ѡ�񳵴���Ϊ��
		String sql="";
			sql="insert into morningcheck(name,sex,age,classsort,classname,parentname,phone,address,chefei,xuefei,chifei,carno)"
					+ " values(?,?,?,?,?,?,?,?,?,?,?,?)";
			C3P0Utils.update(sql, stuname,sex,age,classsort,classno,parent,phone,address,chefei,xuefei,chifei,carname);
		
		sql="update class set nowp=nowp+1 where fatherid=(select id from classsort where classname=?) and name=? ";//����+1
		C3P0Utils.update(sql, classsort,classno);
		sql="select * from morningcheck";
		List<MorningCheck>list=C3P0Utils.beanListHandler(sql, MorningCheck.class);
		System.out.println(list.size()+"------------------");
		request.getSession().setAttribute("list", list);
		//request.getSession().setAttribute("aaa", "���");
		response.sendRedirect("morningcheck.jsp");
	}

}
