package controller;

import bean.PageBean;
import service.PageService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.Array;
import java.util.Arrays;

@WebServlet(name = "RecordServlet",urlPatterns = "/recordServlet")
public class RecordServlet extends HttpServlet {
    //初始化
    private Integer pageNum = 1;// 当前页

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        String pageNewNum=request.getParameter("pageNum");
        String id=request.getParameter("id");
        String studentId=request.getParameter("studentId");
        String studentName=request.getParameter("studentName");
        String clas=request.getParameter("clas");
        String[] priceTypes=request.getParameterValues("priceType");
        String state=request.getParameter("state");
        String person=request.getParameter("person");
        String time=request.getParameter("time");
        String description=request.getParameter("description");
        if(pageNewNum!=null && !pageNewNum.equals("")){
            pageNum= Integer.parseInt(pageNewNum);
        }
        PageBean pageBean=new PageService().getPageBean(id,studentId,studentName,clas,priceTypes,state,person,time,description,pageNum);
        pageNum=1;
        request.getSession().setAttribute("pageBean",pageBean);
        response.sendRedirect("record.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
