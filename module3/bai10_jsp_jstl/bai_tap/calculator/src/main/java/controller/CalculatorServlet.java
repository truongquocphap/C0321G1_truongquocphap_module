package controller;

import model.Calcurator;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "CalculatorServlet",urlPatterns = "/calculator")
public class CalculatorServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            float first=Float.parseFloat(request.getParameter("first"));
            float second=Float.parseFloat(request.getParameter("second"));
            String operand=request.getParameter("operand");
       float result= Calcurator.calculate(first,second,operand);
            request.setAttribute("first",first);
            request.setAttribute("second",second);
            request.setAttribute("operand",operand);
            request.setAttribute("result",result);
            request.getRequestDispatcher("show_response.jsp").forward(request,response);
    }

}
