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
		request.setCharacterEncoding("utf-8");  //����ɾ��ʧ�ܵĻع�
		response.setCharacterEncoding("utf-8");
		String json=request.getParameter("json");
		System.out.println(json+"------------");
		List<Student> list=JSON.parseArray(json,Student.class);//�ַ���ת�ɶ�������
		Object[][] obj=new Object[list.size()][];
		String sql="";
		for(int i=0;i<list.size();i++) {
			obj[i]=new Object[]{list.get(i).getStuno()};
		}
		List<Student>list2=new ArrayList<Student>(); //���ɾ��֮ǰ��ѧ����Ϣ  ��ֹʧ�ܻع�
		for(int i=0;i<obj.length;i++) { 
			int id=(int) obj[i][0];
			sql="select * from stuinfo where stuno=?";
			Student student=C3P0Utils.beanHandler(sql, Student.class, id);
			list2.add(student);
		}
		sql="delete from stuinfo where stuno=?";
		if(C3P0Utils.updateBybatch(sql, obj)) {//����ѧ�ţ�����ɾ������ʱ��Ҫ�޸İ༶����
			for(int i=0;i<list2.size();i++){
				sql="update classes set stuNumber=stuNumber-1 where classType=? and name=? "; //ɾ��һ������
				C3P0Utils.update(sql, list2.get(i).getClasssort(),list2.get(i).getClassname());//�༶���ͺͰ༶��
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
