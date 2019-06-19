package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;

import bean.Grade;
import util.C3P0Utils;

@WebServlet("/GradeServlet/*")
public class GradeServlet extends BasicServlet {
	C3P0Utils util = new C3P0Utils();
	private static final long serialVersionUID = 1L;

	/**
	 * 展示所有年级
	 */
	public String showgrades(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("utf-8");
		String sql = "select * from grade";
		List<Grade> gradelist = C3P0Utils.beanListHandler(sql, Grade.class);
		request.getSession().setAttribute("list", gradelist);
		return "r:../gradelist.jsp";
	}

	/**
	 * 添加年级
	 * 
	 * @param request
	 * @param response
	 * @return
	 */

	public String addgrade(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		response.setCharacterEncoding("utf-8");
		String name = request.getParameter("name");
		System.out.println(name);
		String descri = request.getParameter("descri");
		System.out.println(descri);
		String sql = "insert into  grade(classType,descri) value(?,?)";
		String sql2 = "select * from grade where classType=?";
		Grade grade = util.beanHandler(sql2, Grade.class, name);
		if (grade == null) {
			util.update(sql, name, descri);
			return "r:../GradeServlet/showgrades";
		} else {
			return "r:../gradeadd.jsp";
		}
	}

	/**
	 * 年级删除
	 */
	public void deletegrade(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String name = request.getParameter("id");
		String sql = "delete from grade where id=?";
		util.update(sql, name);
	}

	/**
	 * 修改年级信息
	 */
	public String updategrade(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		String name = request.getParameter("name");
		System.out.println(name);
		String descri = request.getParameter("descri");
		System.out.println(descri);
		String id = request.getParameter("id");
		String sql = "update grade set classType=?,descri=? where id=?";
		String sql2 = "select * from grade where classType=? and id <>?";
		Grade grade = util.beanHandler(sql2, Grade.class, name,id);
		System.out.println("--------------------x修改XXXX");
		if (grade == null) {
			util.update(sql, name, descri, id);
			return "r:../GradeServlet/showgrades";
		} else {
			return "r:../gradeupdate.jsp";
		}
	}

	/**
	 * 查询单个年级信息
	 */
	public void selectgrade(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		System.out.println(id);
		String sql = "select * from grade where id=?";
		Grade grade = util.beanHandler(sql, Grade.class, id);
		request.getSession().setAttribute("grade", grade);
	}

	/**
	 * 多个删除
	 */
	public String deleteall(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		response.setCharacterEncoding("utf-8");
		String json=request.getParameter("json");
		System.out.println(json+"------------");
		List<Grade> list=JSON.parseArray(json,Grade.class);//字符串转成对象数组
		Object[][] obj=new Object[list.size()][];
		for(int i=0;i<list.size();i++) {
			obj[i]=new Object[]{list.get(i).getId()};
		}
		String sql="delete from grade where id=?";		
		util.updateBybatch(sql, obj);
		return "r:../GradeServlet/showgrades";
	}

}
