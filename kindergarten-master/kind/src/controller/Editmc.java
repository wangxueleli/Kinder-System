package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mchange.v2.cfg.PropertiesConfigSource.Parse;

import bean.MorningCheck;
import util.C3P0Utils;

/**
 * Servlet implementation class Editstu
 */
@WebServlet("/Editmc")

public class Editmc extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Editmc() {
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
		response.setCharacterEncoding("utf-8");
		String stuno=request.getParameter("stuno1");
		String sql="select * from morningcheck where stuno=?";//���ѧ�Ų�ѯ��δ�޸�֮ǰ��ѧ����Ϣ
		MorningCheck student=C3P0Utils.beanHandler(sql, MorningCheck.class,stuno);
		String stuname=request.getParameter("stuname1");
		String sex=request.getParameter("sex1");
		Integer age=Integer.valueOf(request.getParameter("age1"));
		String classsort=request.getParameter("classsort1");
		String classno=request.getParameter("classno1");
		String parent=request.getParameter("parent1");
		String phone=request.getParameter("phone1");
		//����޸��˰༶ ���߰�� ����Ӧ�İ༶����ҲҪ�ı䣬����3�����
		//1.����޸��˰༶
		if((!student.getClasssort().equals(classsort))&&student.getClassname().equals(classno)) {
			sql="update class set nowp=nowp+1 where fatherid=(select id from classsort where classname=?) and name=? ";//����+1
			C3P0Utils.update(sql, classsort,classno);
			sql="update class set nowp=nowp-1 where fatherid=(select id from classsort where classname=?) and name=?";
			C3P0Utils.update(sql, student.getClasssort(),classno);
		}//2.ֻ�ı��˰��
		if(student.getClasssort().equals(classsort)&&(!student.getClassname().equals(classno))) {
			sql="update class set nowp=nowp+1 where fatherid=(select id from classsort where classname=?) and name=? ";//����+1
			C3P0Utils.update(sql, classsort,classno);
			sql="update class set nowp=nowp-1 where fatherid=(select id from classsort where classname=?) and name=?";
			C3P0Utils.update(sql, classsort,student.getClassname());
		}//3.�༶�Ͱ�Ŷ��ı���
		if((!student.getClasssort().equals(classsort))&&(!student.getClassname().equals(classno))) {
			sql="update class set nowp=nowp+1 where fatherid=(select id from classsort where classname=?) and name=? ";//����+1
			C3P0Utils.update(sql, classsort,classno);
			sql="update class set nowp=nowp-1 where fatherid=(select id from classsort where classname=?) and name=?";
			C3P0Utils.update(sql, student.getClasssort(),student.getClassname());
		}//���ͳһ�޸���Ϣ 
		sql="update morningcheck set name=?,sex=?,age=?,classsort=?,classname=?,parentname=?,phone=?"
				+ " where stuno=? ";
		if(C3P0Utils.update(sql, stuname,sex,age,classsort,classno,parent,phone,stuno)) {
			System.out.println("���³ɹ�");
		}
		sql="select * from morningcheck";
		List<MorningCheck>list=C3P0Utils.beanListHandler(sql, MorningCheck.class);
		System.out.println(list.size()+"------------------");
		request.getSession().setAttribute("list", list);
		response.sendRedirect("morningcheck.jsp");
	}



}
