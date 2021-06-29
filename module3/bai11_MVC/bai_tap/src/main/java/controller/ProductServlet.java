package controller;

import model.service.ProductService;
import model.service.ProductServicelmpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@javax.servlet.annotation.WebServlet(name = "ProductServlet",urlPatterns = {"","/list"})
public class ProductServlet extends javax.servlet.http.HttpServlet {
    private ProductService productService=new ProductServicelmpl();
    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        String action=request.getParameter("action");
        if (action==null){
            action="";
        }
        switch (action){
            case "create":
                break;
            case "edit":
                break;
            case "delete":
                break;
            case "search":
                break;
        }
    }



    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        String action=request.getParameter("action");
        if (action==null){
            action="";
        }
        switch (action){
            case "create":
                break;
            case "edit":
                break;
            case "delete":
                break;
            case "search":
                break;
            default:
                showList(request,response);
        }
    }
    private void showList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
request.setAttribute("product",productService.findAll());
request.getRequestDispatcher("/product/list.jsp").forward(request,response);
    }
}
