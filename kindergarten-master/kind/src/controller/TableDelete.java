package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;

import bean.Student;
import util.C3P0Utils;

/**
 * Servlet implementation class TableDelete
 */
@WebServlet("/tableDelete")
public class TableDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TableDelete() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println(11111);
		request.setCharacterEncoding("utf-8");  //考虑删除失败的回滚
		response.setCharacterEncoding("utf-8");
		String json=request.getParameter("json");
		System.out.println(json+"------------");
		List<Student> list=JSON.parseArray(json,Student.class);//字符串转成对象数组
		Object[][] obj=new Object[list.size()][];
		String sql="";
		for(int i=0;i<list.size();i++) {
			obj[i]=new Object[]{list.get(i).getStuno()};
		}
		List<Student>list2=new ArrayList<Student>(); //存放删除之前的学生信息  防止失败回滚
		for(int i=0;i<obj.length;i++) { 
			int id=(int) obj[i][0];
			sql="select * from stuinfo where stuno=?";
			Student student=C3P0Utils.beanHandler(sql, Student.class, id);
			list2.add(student);
		}
		sql="delete from stuinfo where stuno=?";
		if(C3P0Utils.updateBybatch(sql, obj)) {//根据学号，批量删除人数时需要修改班级人数
			for(int i=0;i<list2.size();i++){
				sql="update classes set stuNumber=stuNumber-1 where classType=? and name=? "; //删除一个人数
				C3P0Utils.update(sql, list2.get(i).getClasssort(),list2.get(i).getClassname());//班级类型和班级名
			}	
		}
		sql="select * from stuinfo order by updatetime desc";
		List<Student> list1=C3P0Utils.beanListHandler(sql, Student.class);
		request.getSession().setAttribute("list", list1);
		PrintWriter printWriter=response.getWriter();
		printWriter.append("success");
		printWriter.flush();
		printWriter.close();
		//response.sendRedirect("stuinfo.jsp");
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
