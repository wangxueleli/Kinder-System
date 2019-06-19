package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;

import bean.Homework;
import bean.Ready;
import service.ReadyService;
import util.C3P0Utils;

/**
 * Servlet implementation class readyServlet
 */
@WebServlet("/readyServlet/*")
public class readyServlet extends BasicServlet {
	ReadyService rs= new ReadyService();
	
	public String select(HttpServletRequest  request,HttpServletResponse response) {
		List listready=rs.selectready();
		List listclass=rs.select();
		List listlimt=rs.selectlimt();
		request.getSession().setAttribute("bclass", listclass);
		request.getSession().setAttribute("listready", listready);
		request.getSession().setAttribute("listlimt", listlimt);
		return "r:../ready.jsp";
		
	}
	
public void ajaxselect(HttpServletRequest  request,HttpServletResponse response) throws IOException {
		String id=request.getParameter("id");
		List listajax=rs.ajaxselect(id);
		String json=JSON.toJSONString(listajax);
		System.out.println(json);
		   //ajax  ����Ӧ�����
		   PrintWriter  pw=response.getWriter();
		   pw.append(json);
		   pw.flush();
		   pw.close();		
	}
public String update(HttpServletRequest  request,HttpServletResponse response) {
		String classtype=request.getParameter("classid");
		String num=request.getParameter("sum");
		System.out.println(num);
		System.out.println(classtype);
		boolean tf = rs.update(classtype, num);
		if(!tf) {
			String sql= "insert into t_class(idtype,num) values(?,?)";
			tf=C3P0Utils.update(sql, classtype, num);
		}
			
		
		List listlimt=rs.selectlimt();
		request.getSession().setAttribute("listlimt", listlimt);
		request.getSession().setAttribute("message5", "修改成功");
		return "r:../ready.jsp";	
	}
public String delete(HttpServletRequest request, HttpServletResponse response) {
	String arrId = request.getParameter("arrId");
	Object[] id= arrId.split(",");
	arrId = arrId.substring(0,arrId.length() - 1);
	Object[][]arrid = new Object[id.length][1];
	for(int i=0; i<id.length; i++ ) {
		for(int j=0;j<1;j++) {
			arrid[i][j]=id[i];
			System.out.println(arrid[i][j]);
		}
	}
	boolean tf = rs.delete(arrid);
	if(tf) {
		List listready=rs.selectready();
		request.getSession().setAttribute("listready", listready);
		request.getSession().setAttribute("message5", "删除成功");
		}else {
			request.getSession().setAttribute("message5", "删除失败");
		}
		return "r:../ready.jsp";
}
}
