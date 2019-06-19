package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;

import bean.Classes;
import bean.Grade;
import bean.Teacher;
import util.C3P0Utils;

/**
 * Servlet implementation class ClassServlet
 */
@WebServlet("/ClassServlet/*")
public class ClassServlet extends BasicServlet {
	private static final long serialVersionUID = 1L;
	C3P0Utils util = new C3P0Utils();

	/**
	 * 展示所有班级
	 */
	public String showclasses(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("utf-8");
		String sql = "select * from classes order by updateTime desc";
		List<Classes> classlist = util.beanListHandler(sql, Classes.class);
		request.getSession().setAttribute("classlist", classlist);
		return "r:../classlist.jsp";
	}

	/**
	 * 添加班级
	 * 
	 * @param request
	 * @param response
	 * @return
	 */

	public String addclass(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) { // TODO Auto-generated catch
													// block
			e.printStackTrace();
		}
		response.setCharacterEncoding("utf-8");
		String name = request.getParameter("name");
		String teacher = request.getParameter("teacher");
		String classType = request.getParameter("classType");
		String time = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
		String claname=classType+name;
		String sql = "insert into  classes(name,teacher,classType,claName,updateTime) value(?,?,?,?,?)";
		String sql2 = "select * from classes where name=? and classType=?";
		Classes cla = util.beanHandler(sql2, Classes.class, name, classType);
		if (cla == null) {
			util.update(sql, name, teacher, classType,claname, time);
			return "r:../ClassServlet/showclasses";
		} else {
			return "r:../classadd.jsp";

		}
	}

	/**
	 * 班级删除
	 */
	public void deleteclass(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String id = request.getParameter("id");
		String sql = "delete from classes where classNo=?";
		util.update(sql, id);
	}

	/**
	 * 修改班级信息
	 */
	public String updateclass(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String name = request.getParameter("name");
		System.out.println(name);
		String teacher = request.getParameter("teacher");
		System.out.println(teacher);
		String classType = request.getParameter("classType");
		System.out.println(classType);
		String claname=classType+name;
		String time = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
		Integer id = ((Classes) request.getSession().getAttribute("classes")).getClassNo();
		System.out.println(id);
		String sql = "update classes set name=?,teacher=?,classType=?,claName=?,updateTime=? where classNo=?";
		String sql2 = "select * from classes where name=? and classType=? and classNo<>?";
		Classes cla = util.beanHandler(sql2, Classes.class, name, classType,id);
		if (cla == null) {
			util.update(sql, name, teacher, classType,claname, time, id);
			return "r:../ClassServlet/showclasses";
		} else {
			return "r:../classupdate.jsp";
		}
	}

	/**
	 * 查询年级
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 */
	public void getgrade(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setCharacterEncoding("utf-8");
		// 查询所有年级
		String sql = "select * from grade";
		List<Grade> gradelist = util.beanListHandler(sql, Grade.class);
		// 把list转换为JSON数据
		String pro = JSON.toJSONString(gradelist);
		// ajax 用响应流输出
		PrintWriter pw = response.getWriter();
		pw.append(pro);
		pw.flush();
		pw.close();
	}

	/**
	 * 查询单个班级信息
	 */
	public void selectclass(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		System.out.println(id);
		String sql = "select * from classes where classNo=?";
		Classes classes = util.beanHandler(sql, Classes.class, id);
		request.getSession().setAttribute("classes", classes);
	}

	/**
	 * 查询老师
	 */
	public void getteacher(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setCharacterEncoding("utf-8");
		// 查询所有老师
		String sql = "SELECT * from teacher where name  not in (SELECT teacher from classes)";
		List<Teacher> teacherlist = util.beanListHandler(sql, Teacher.class);
		// 把list转换为JSON数据
		String pro = JSON.toJSONString(teacherlist);
		// ajax 用响应流输出
		PrintWriter pw = response.getWriter();
		pw.append(pro);
		pw.flush();
		pw.close();
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
		String json = request.getParameter("json");
		System.out.println(json + "------------");
		List<Classes> list = JSON.parseArray(json, Classes.class);// 字符串转成对象数组
		Object[][] obj = new Object[list.size()][];
		for (int i = 0; i < list.size(); i++) {
			obj[i] = new Object[] { list.get(i).getClassNo()};
		}
		String sql = "delete from classes where classNo=?";
		util.updateBybatch(sql, obj);
		return "r:../ClassServlet/showclasses";
	}
}
