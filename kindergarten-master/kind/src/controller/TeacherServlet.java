package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;

import bean.Classes;
import bean.Teacher;
import util.C3P0Utils;

@WebServlet("/TeacherServlet/*")
public class TeacherServlet extends BasicServlet {
	private static final long serialVersionUID = 1L;
	C3P0Utils util = new C3P0Utils();

	/**
	 * 展示所有老师
	 */
	public String showteachers(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("utf-8");
		String sql = "select * from teacher order by updateTime desc";
		List<Teacher> teacherlist = util.beanListHandler(sql, Teacher.class);
		request.getSession().setAttribute("teacherall", teacherlist);
		return "r:../teacherlist.jsp";
	}

	/**
	 * 添加老师
	 * 
	 * @param request
	 * @param response
	 * @return
	 */

	public String addteacher(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) { // TODO Auto-generated catch
													// block
			e.printStackTrace();
		}
		response.setCharacterEncoding("utf-8");
		String name = request.getParameter("name");
		System.out.println(name);
		String age = request.getParameter("age");
		String sex = request.getParameter("sex");
		String phone = request.getParameter("phone");
		String course = request.getParameter("course");
		String descri = request.getParameter("descri");
		String intime = request.getParameter("intime");
		String time = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
		String sql = "insert into  teacher(name,age,sex,phone,course,descri,intime,updateTime) value(?,?,?,?,?,?,?,?)";
		util.update(sql, name, age, sex, phone,course, descri, intime, time);
		return "r:../TeacherServlet/showteachers";
	}

	/**
	 * 老师删除
	 */
	public void deleteteacher(HttpServletRequest request, HttpServletResponse response) {

		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String id = request.getParameter("id");
		System.out.println(id);
		String sql = "delete from teacher where teacherId=?";
		util.update(sql, id);
	}

	/**
	 * 修改老师信息
	 */
	public String updateteacher(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String name = request.getParameter("name");
		System.out.println(name);
		String age = request.getParameter("age");
		String sex = request.getParameter("sex");
		String phone = request.getParameter("phone");
		String descri = request.getParameter("descri");
		String course = request.getParameter("course");
		String intime = request.getParameter("intime");
		String time = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
		Integer id = ((Teacher) request.getSession().getAttribute("teacher")).getTeacherId();
		String sql = "update teacher set  name=?,age=?,sex=?,course=?,phone=?,descri=?,intime=?,updateTime=? where teacherId=?";
		util.update(sql, name, age, sex,course, phone, descri, intime, time, id);
		return "r:../TeacherServlet/showteachers";
	}

	/**
	 * 查询单个老师信息
	 */
	public void selectteacher(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		System.out.println(id);
		String sql = "select * from teacher where teacherId=?";
		Teacher teacher = util.beanHandler(sql, Teacher.class, id);
		request.getSession().setAttribute("teacher", teacher);
	}
	
	/**
	 * 查询单个老师男女信息
	 */
	public void selectsex(HttpServletRequest request, HttpServletResponse response) {
		String sql = "SELECT COUNT(teacherId) AS value, sex AS name FROM teacher GROUP BY sex ";
		List<Map<String, Object>> sex = util.MapListHandler(sql);
		System.out.println(sex);
		String list = JSON.toJSONString(sex);
		System.out.println(list);
		PrintWriter pw = null;
		try {
			pw = response.getWriter();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		pw.append(list);//把消息输出到 页面
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
		List<Teacher> list = JSON.parseArray(json, Teacher.class);// 字符串转成对象数组
		Object[][] obj = new Object[list.size()][];
		for (int i = 0; i < list.size(); i++) {
			obj[i] = new Object[] { list.get(i).getTeacherId() };
		}
		String sql = "delete from teacher where teacherId=?";
		util.updateBybatch(sql, obj);
		return "r:../" + "TeacherServlet/showteachers";
	}

}
