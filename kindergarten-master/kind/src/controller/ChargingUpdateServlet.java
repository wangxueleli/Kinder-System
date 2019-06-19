package controller;

import com.alibaba.fastjson.JSON;
import service.ChargingService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;
import java.util.List;

@WebServlet(name = "ChargingUpdateServlet",urlPatterns = "/chargingUpdateServlet")
public class ChargingUpdateServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        ChargingService service=new ChargingService();
        String json=request.getParameter("json");
        List<List> jsonArray=JSON.parseArray(json,List.class);
        Object[][] objects=new Object[jsonArray.size()][];
        int index=0;
        for (List list : jsonArray) {
            objects[index]=list.toArray();
            index++;
        }
        System.out.println(Arrays.toString(objects));
        String message;
        if(service.update(objects)){
            message="保存成功!";
        }else {
            message="保存失败!";
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
