package controller;

import bean.Admin;
import service.LoginService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "LoginServlet",urlPatterns = "/loginServlet")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        LoginService loginService=new LoginService();
        String name=request.getParameter("username");
        String password=request.getParameter("password");
        Admin admin=loginService.loginTF(name,password);
        if(admin!=null){
            request.getSession().setAttribute("admin",admin);
            response.sendRedirect("index.jsp");
        } else {
            request.setAttribute("message","用户名或密码错误!");
            request.getRequestDispatcher("login.jsp").forward(request,response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
