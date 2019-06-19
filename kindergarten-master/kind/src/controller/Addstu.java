package controller;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Student;
import util.C3P0Utils;
import util.ToolUtil;

/**
 * Servlet implementation class Addstu
 */
@WebServlet("/addstu")
public class Addstu extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Addstu() {
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
			chefei="未缴费";
		}
		String xuefei=request.getParameter("xuefei");
		System.out.println(xuefei+2);
		if(xuefei==null) {
			xuefei="未缴费";
		}
		String chifei=request.getParameter("chifei");
		System.out.println(chifei+3);
		if(chifei==null) {
			chifei="未缴费";
		}
		String address=request.getParameter("address");
		String carname=(String) request.getSession().getAttribute("carno");
		if(carname==null) {
			carname="无";
		}
		System.out.println(carname+1); //���û��ѡ�񳵴���Ϊ��
		String sql="";
			sql="insert into stuinfo(name,sex,age,classsort,classname,parentname,phone,address,chefei,xuefei,chifei,carno)"
					+ " values(?,?,?,?,?,?,?,?,?,?,?,?)";
			C3P0Utils.update(sql, stuname,sex,age,classsort,classno,parent,phone,address,chefei,xuefei,chifei,carname);
		
		sql="update classes set stuNumber=stuNumber+1 where classType=? and name=? ";//����+1
		C3P0Utils.update(sql, classsort,classno);
		//����ü�¼�������Ϣ
		Date date=new Date();
		String time=ToolUtil.getTime(date);
		sql="select * from stuinfo where stuno=(select max(stuno) from stuinfo)";
		Student student=C3P0Utils.beanHandler(sql, Student.class);
		String clas=student.getClasssort()+"_"+student.getClassname();
		sql="insert into record(studentid,studentname,clas,pricetype,state,time) values(?,?,?,?,?,?)";
		C3P0Utils.update(sql, student.getStuno(),student.getName(),clas,"学费",xuefei,time);
		sql="insert into record(studentid,studentname,clas,pricetype,state,time) values(?,?,?,?,?,?)";
		C3P0Utils.update(sql, student.getStuno(),student.getName(),clas,"车费",chefei,time);
		sql="insert into record(studentid,studentname,clas,pricetype,state,time) values(?,?,?,?,?,?)";
		C3P0Utils.update(sql, student.getStuno(),student.getName(),clas,"生活费",chifei,time);
		//int studentid=
		sql="select * from stuinfo order by updatetime desc";
		List<Student>list=C3P0Utils.beanListHandler(sql, Student.class);
		System.out.println(list.size()+"------------------");
		request.getSession().setAttribute("list", list);
		//request.getSession().setAttribute("aaa", "���");
		response.sendRedirect("stuinfo.jsp");
	}

}
