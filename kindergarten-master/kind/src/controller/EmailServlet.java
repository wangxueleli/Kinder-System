package controller;

import service.EmailService;
import util.SendmailUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "EmailServlet",urlPatterns = "/emailServlet")
public class EmailServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        String email=request.getParameter("mail");
        String name=request.getParameter("name");
        SendmailUtil sendmailUtil=new SendmailUtil();
        EmailService emailService=new EmailService();
        Object[] data= emailService.getdata(name);
        String message;
        if(data.length>0 && data[0].equals(email)) {
            sendmailUtil.sendEmail((String) data[0], (String) data[1]);
            message="已将密码发送至你的邮箱,请注意查收!";
        } else {
            message="用户名或邮箱地址错误!";
        }
        PrintWriter writer=response.getWriter();
        writer.append(message);
        writer.flush();
        writer.close();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
