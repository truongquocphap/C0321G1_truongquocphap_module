package controller;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@javax.servlet.annotation.WebServlet(name = "controller.DiscountServlet",urlPatterns = "/tinh-toan")
public class DiscountServlet extends javax.servlet.http.HttpServlet {
    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        String action=request.getParameter("action");
        if (action==null){
            action="";

        }
        switch (action){
            case "discount":
                discount(request,response);
                break;

        }

    }
    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {

    }
    private void discount(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            float price=Float.parseFloat(request.getParameter("price"));
            float percent=Float.parseFloat(request.getParameter("percent"));
            String description=request.getParameter("p-description");
            float result=price*percent*0.01f;
            request.setAttribute( "result",result);
            request.setAttribute( "description",description);
        request.getRequestDispatcher("tinh_toan.jsp").forward(request,response);
    }

}
