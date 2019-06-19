package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;

import bean.Certificate;
import bean.school;
import service.SchoolService;
import util.C3P0Utils;


/**
 * Servlet implementation class SchoolServlet
 */
@WebServlet("/SchoolServlet/*")
public class SchoolServlet extends BasicServlet {
	
	SchoolService ss= new SchoolService();	
	public String select(HttpServletRequest  request,HttpServletResponse response) {
		school sh=ss.seclet();
		request.getSession().setAttribute("school", sh);
		return "r:../school.jsp";
	}
	
	
	public  String   addtext(HttpServletRequest  request,HttpServletResponse response){
		String name= request.getParameter("name");
		String minidec= request.getParameter("minidec");
		String leader= request.getParameter("leader");
		String tel= request.getParameter("tel");
		String address= request.getParameter("address");
		String  bigdec= request.getParameter("bigdec");
		String  id= request.getParameter("id");
		school sc = ss.seclet();
		if(sc==null) {
			boolean tf=ss.addtext(name, minidec, leader, tel, address, bigdec);
			if(tf) {
				sc = ss.seclet();
				request.getSession().setAttribute("school", sc);
				request.getSession().setAttribute("message", "添加成功");
				return "r:../school.jsp";
			}else {
				request.getSession().setAttribute("message", "�添加失败");
				return "r:../school.jsp";
			}
		}else {
		
			boolean tf=ss.updatetext(id,name, minidec, leader, tel, address, bigdec);
			if(tf) {
				sc = ss.seclet();
				request.getSession().setAttribute("school", sc);
				request.getSession().setAttribute("message", "修改成功");
				return "r:../school.jsp";
			}else {
				request.getSession().setAttribute("message", "修改失败");
				return "r:../school.jsp";
			}
		}
	}
	public void selectwx(HttpServletRequest  request,HttpServletResponse response) throws IOException {
		String sql = "select t_school.name, t_school.minidec from t_school";
		List listwx=C3P0Utils.MapListHandler(sql);
		String json=JSON.toJSONString(listwx);
		 PrintWriter  pw=response.getWriter();
		   pw.append(json);
		   pw.flush();
		   pw.close();
	}

}
