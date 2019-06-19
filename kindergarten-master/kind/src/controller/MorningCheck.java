package controller;

import util.C3P0Utils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * @wangxuelei
 * @create 2019-05-15-20:36
 * @describe
 */
@WebServlet("/MorningCheck")
public class MorningCheck extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public MorningCheck() {
        super();
    }
    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        doPost(request, response);
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        request.setCharacterEncoding("utf-8");
        //String stuno=request.getParameter("stuno");
        String sql="";
        sql="select * from morningcheck";
        List<bean.MorningCheck> list=C3P0Utils.beanListHandler(sql, bean.MorningCheck.class);
        System.out.println(list.size()+"------------------");
        request.getSession().setAttribute("list", list);
        //request.getSession().setAttribute("aaa", "���");
        response.sendRedirect("morningcheck.jsp");
    }

}
