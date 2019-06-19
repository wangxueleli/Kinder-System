package controller;

import bean.Charging;
import service.ChargingService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ChargingServlet",urlPatterns = "/chargingServlet")
public class ChargingServlet extends HttpServlet {
    ChargingService service=new ChargingService();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        List<Charging> chargingList=service.findAll();
        request.setAttribute("chargingList",chargingList);
        request.getRequestDispatcher("charging.jsp").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
