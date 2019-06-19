package controller;

import java.io.IOException;
import java.io.PrintWriter;
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

import util.C3P0Utils;

/**
 * Servlet implementation class WxServlet
 */
@WebServlet("/WxServlet/*")
public class WxServlet extends BasicServlet {
	public void selecttel(HttpServletRequest  request,HttpServletResponse response) throws IOException {
		String sql="select t_school.bigdec, t_school.address, t_school.leader, t_school.tel from t_school";
		List listwx = C3P0Utils.MapListHandler(sql);
		String json=JSON.toJSONString(listwx);
		 PrintWriter  pw=response.getWriter();
		   pw.append(json);
		   pw.flush();
		   pw.close();
	}
	public void selectclass(HttpServletRequest  request,HttpServletResponse response) throws IOException {
		String sql=" SELECT t_class.*, grade.classType FROM grade LEFT JOIN t_class ON t_class.idtype=grade.id";
		List listwx = C3P0Utils.MapListHandler(sql);
		String json=JSON.toJSONString(listwx);
		 PrintWriter  pw=response.getWriter();
		   pw.append(json);
		   pw.flush();
		   pw.close();
	}
	public void add(HttpServletRequest  request,HttpServletResponse response) throws IOException {
		Integer res=0;
		String idtype= request.getParameter("type");
		String name = request.getParameter("name");		
		String tel= request.getParameter("tel");		
		String sql1="select t1.*, COUNT(t_ready.id) FROM (select t_class.num FROM t_class where t_class.idtype=?) AS t1 LEFT JOIN t_ready ON t_ready.type=?";		
		Object[] listnum=C3P0Utils.arrayHandler(sql1,idtype,idtype);
		int sum =Integer.parseInt(listnum[0].toString())-Integer.parseInt(listnum[1].toString());
		System.out.println("sum="+sum);
		if(sum==0) {
			res=0;
		}else{
			
			String sql2="select * FROM t_ready where t_ready.tel=?";		
			if(C3P0Utils.arrayHandler(sql2, tel).length!=0) {
				res=1;
			}else {
				
			String timeing = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
			String sql3="insert into t_ready(name,tel,timeing,type) values(?,?,?,?)";
			boolean tf= C3P0Utils.update(sql3, name,tel,timeing,idtype);
				if(tf) {
					res=3;
				}
			}			
		}
		String json=JSON.toJSONString(res);
		 PrintWriter  pw=response.getWriter();
		   pw.append(json);
		   pw.flush();
		   pw.close();
	}
	

}
