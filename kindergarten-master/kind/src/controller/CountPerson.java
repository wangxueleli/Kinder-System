package controller;

import java.io.IOException;
import java.io.PrintWriter;
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
 * Servlet implementation class CountPerson
 */
@WebServlet("/countPerson")
public class CountPerson extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CountPerson() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		response.setCharacterEncoding("utf-8");
		String sql="select SUM(classes.stuNumber) AS value, classes.classType AS name FROM classes GROUP BY classes.classType";
		String sql1="select  claName  FROM classes";
		String sql2="select stuNumber as value, claName as name FROM classes ";
		List<Map<String,Object>> listgrade=C3P0Utils.MapListHandler(sql);
		List listclass=C3P0Utils.columnListHandler(sql1);
		List<Map<String,Object>> listclassnum=C3P0Utils.MapListHandler(sql2);
		Object[] js = {listclass,listgrade,listclassnum};
		String json =JSON.toJSONString(js);
		PrintWriter printWriter=response.getWriter();
		printWriter.append(json);
		printWriter.flush();
		printWriter.close();

		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
