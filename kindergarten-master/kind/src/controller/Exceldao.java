package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Student;
import util.C3P0Utils;
import util.ImportFile;

/**
 * Servlet implementation class Exceldao
 */
@WebServlet("/exceldao")
public class Exceldao extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Exceldao() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String path=request.getParameter("name");
		System.out.println(path);
		PrintWriter printWriter=response.getWriter();
		if(path.length()==0||path.lastIndexOf(".xls")==-1&&path.lastIndexOf(".xlsx")==-1) {
			System.out.println("cuowu1111");
			//request.getSession().setAttribute("infor", "��������ȷ���ļ���");
			printWriter.append("请输入正确的文件名");
			printWriter.flush();
			printWriter.close();
			
		}else {
			List<Student>list=ImportFile.getDataFromExcel2(path);
			if(list!=null) {
				Object[][]objects=new Object[list.size()][];
				for(int i=0;i<list.size();i++) {
					objects[i]=new Object[]{list.get(i).getName(),list.get(i).getSex(),list.get(i).getAge(),
							list.get(i).getClasssort(),list.get(i).getClassname(),list.get(i).getParentname(),
							list.get(i).getPhone(),list.get(i).getAddress(),list.get(i).getChefei(),
							list.get(i).getXuefei(),list.get(i).getChifei(),list.get(i).getCarno()};
					
				}
				String sql="insert into stuinfo(name,sex,age,classsort,classname,parentname,phone,address,chefei,xuefei,chifei,carno)"
				+ " values(?,?,?,?,?,?,?,?,?,?,?,?)";
				if(C3P0Utils.updateBybatch(sql, objects)) {
					//request.getSession().setAttribute("infor", "��������ȷ���ļ���");
					printWriter.append("导入成功");
					printWriter.flush();
					printWriter.close();
				}
			}else {
				printWriter.append("系统找不到指定的文件");
				printWriter.flush();
				printWriter.close();
			}
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
