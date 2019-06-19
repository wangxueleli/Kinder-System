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
import bean.Lessons;
import bean.Teacher;
import util.C3P0Utils;

/**
 * Servlet implementation class LessonServlet
 */
@WebServlet("/LessonServlet/*")
public class LessonServlet extends BasicServlet {
	private static final long serialVersionUID = 1L;
	C3P0Utils util = new C3P0Utils();

	/**
	 * 展示所有课程
	 */
	public String showlessons(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("utf-8");
		String sql = "select * from lessons order by updateTime desc";
		List<Lessons> lessonlist = util.beanListHandler(sql, Lessons.class);
		request.getSession().setAttribute("lessonlist", lessonlist);
		return "r:../lessonlist.jsp";
	}

	/**
	 * 添加课程
	 * 
	 * @param request
	 * @param response
	 * @return
	 */

	public String addlesson(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		response.setCharacterEncoding("utf-8");
		String week = request.getParameter("week");
		String potime = request.getParameter("potime");
		String classType = request.getParameter("classType");
		String classname = request.getParameter("className");
		String teacher = request.getParameter("teacher");
		String course = request.getParameter("course");
		String time = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
		String sql = "insert into  lessons(weekTime,poTime,classType,className,teacherName,courseName,updateTime) value(?,?,?,?,?,?,?)";
		util.update(sql, week, potime, classType, classname, teacher, course, time);
		return "r:../LessonServlet/showlessons";
	}

	/**
	 * 删除课程
	 */
	public void deletelesson(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String id = request.getParameter("id");
		String sql = "delete from lessons where id=?";
		util.update(sql, id);
	}

	/**
	 * 修改课程信息
	 */
	public String updatelesson(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String week = request.getParameter("week");
		System.out.println(week);
		String potime = request.getParameter("potime");
		System.out.println(potime);
		String classType = request.getParameter("classType");
		System.out.println(classType);
		String classname = request.getParameter("className");
		System.out.println(classname);
		String teacher = request.getParameter("teacher");
		System.out.println(teacher);
		String course = request.getParameter("course");
		System.out.println(course);
		String time = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
		Integer id = ((Lessons) request.getSession().getAttribute("lesson")).getId();
		String sql = "update lessons set weekTime=?,poTime=?,classType=?,className=?,teacherName=?,courseName=?,updateTime=? where id=?";
		util.update(sql, week, potime, classType, classname, teacher, course, time, id);
		return "r:../LessonServlet/showlessons";
	}

	/**
	 * 获取周几
	 */
	String weektime = null;

	public void selectweek(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		weektime = request.getParameter("weektime");
		System.out.println("***" + weektime);
	}

	/**
	 * 获取第几节
	 */
	String pootime = null;

	public void selectpoo(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		pootime = request.getParameter("pootime");
		System.out.println("***" + pootime);
	}

	/**
	 * 查询班级
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 */
	public void getclass(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		String weekk = weektime;
		String poott = pootime;
		System.out.println("******" + weekk);
		System.out.println("****" + poott);
		System.out.println("******" + weekk);
		System.out.println("*****" + poott);
		// 查询所有班级
		String sql = "select * from classes where classType=? and name not in (select className from lessons where weekTime=? and poTime=? and classType=?)";
		List<Classes> classlist = util.beanListHandler(sql, Classes.class, id, weekk, poott,id);
		// 把list转换为JSON数据
		String pro = JSON.toJSONString(classlist);
		// ajax 用响应流输出
		PrintWriter pw = response.getWriter();
		pw.append(pro);
		pw.flush();
		pw.close();
	}

	/**
	 * 查询年级
	 */
	public void getgrade(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setCharacterEncoding("utf-8");
		// 查询所有班级
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
	 * 查询单个课程信息
	 */
	public void selectlesson(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		// System.out.println(id);
		String sql = "select * from lessons where id=?";
		Lessons lesson = util.beanHandler(sql, Lessons.class, id);
		request.getSession().setAttribute("lesson", lesson);
	}

	/**
	 * 查询老师
	 */
	public void getteacher(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setCharacterEncoding("utf-8");
		String weekk = weektime;
		String poott = pootime;
		// 查询所有老师
		String sql = "select * from teacher where name not in (select teacherName from lessons where weekTime=? and poTime=? )";
		List<Teacher> teacherlist = util.beanListHandler(sql, Teacher.class, weekk, poott);
		// 把list转换为JSON数据
		String pro = JSON.toJSONString(teacherlist);
		// ajax 用响应流输出
		PrintWriter pw = response.getWriter();
		pw.append(pro);
		pw.flush();
		pw.close();
	}
    
	/**
	 * 查询老师一周课程
	 */
	public void thlesson(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setCharacterEncoding("utf-8");
		String name = request.getParameter("name");
		System.out.println(name);
		// 查询所有老师
		String sql = "select * from lessons where teacherName=?";
		List<Lessons> teacherlist = util.beanListHandler(sql, Lessons.class, name);		
		// 把list转换为JSON数据
		String pro = JSON.toJSONString(teacherlist);
		System.out.println(pro);
		// ajax 用响应流输出
		PrintWriter pw = response.getWriter();
		pw.append(pro);
		pw.flush();
		pw.close();
	}
	
	/**
	 * 查询班级一周课程
	 */
	public void clalesson(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setCharacterEncoding("utf-8");
		String type = request.getParameter("type");
		String name = request.getParameter("name");
		System.out.println(name);
		// 查询所有老师
		String sql = "select * from lessons where classType=? and className=?";
		List<Lessons> clalist = util.beanListHandler(sql, Lessons.class,type, name);		
		// 把list转换为JSON数据
		String pro = JSON.toJSONString(clalist);
		System.out.println(pro);
		// ajax 用响应流输出
		PrintWriter pw = response.getWriter();
		pw.append(pro);
		pw.flush();
		pw.close();
	}
	
	
	/**
	 * 查询老师教学科目
	 */
	public void getthcourse(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setCharacterEncoding("utf-8");
		String name = request.getParameter("id");
		System.out.println(name);
		// 查询所有老师
		String sql = "select * from teacher where name=?";
		List<Teacher> teacherlist = util.beanListHandler(sql, Teacher.class, name);
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
		// System.out.println(json + "------------");
		List<Lessons> list = JSON.parseArray(json, Lessons.class);// 字符串转成对象数组
		Object[][] obj = new Object[list.size()][];
		for (int i = 0; i < list.size(); i++) {
			obj[i] = new Object[] { list.get(i).getId() };
		}
		String sql = "delete from lessons where id=?";
		util.updateBybatch(sql, obj);
		return "r:../LessonServlet/showlessons";
	}
}
