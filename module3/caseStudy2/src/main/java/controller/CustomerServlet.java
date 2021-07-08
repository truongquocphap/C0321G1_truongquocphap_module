package controller;

import model.bean.Customer;
import model.service.CustomerService;
import model.service.CustomerSeviceImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "CustomerServlet" ,urlPatterns = {"","/customer"})
public class CustomerServlet extends HttpServlet {
    private CustomerService furamaService=new CustomerSeviceImpl();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action=request.getParameter("action");
        if (action==null){
            action="";
        }
        switch (action){
            case "create":
                insertUser(request,response);
                break;
            case "edit":
                updateUser(request,response);
                break;
            case "delete":
                deleteUser(request,response);
                break;
        }
    }

    private void updateUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id= Integer.parseInt(request.getParameter("id"));
        int type_id= Integer.parseInt(request.getParameter("customer_type_id"));
        String name=request.getParameter("customer_name");
        String birthday=request.getParameter("customer_birthday");
        String gender=request.getParameter("customer_gender");
        String id_card=request.getParameter("customer_id_card");
        String phone=request.getParameter("customer_phone");
        String email=request.getParameter("customer_email");
        String address=request.getParameter("customer_address");
        String code=request.getParameter("customer_code");


        Customer customer=  new Customer(id,type_id,name,birthday,gender,id_card,phone,email,address,code);
        furamaService.updateCustomer(customer);
        listCustomer(request,response);
    }

    private void insertUser(HttpServletRequest request, HttpServletResponse response) {
        int id=Integer.parseInt(request.getParameter("customer_type_id"));
        String name=request.getParameter("customer_name");
        String birthday=request.getParameter("customer_birthday");
        String gender=request.getParameter("customer_gender");
        String id_card=request.getParameter("customer_id_card");
        String phone=request.getParameter("customer_phone");
        String email=request.getParameter("customer_email");
        String address=request.getParameter("customer_address");
        String code=request.getParameter("customer_code");
        Customer customer=new Customer(id,name,birthday,gender,id_card,phone,email,address,code);
        furamaService.insertCustomer(customer);
        listCustomer(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showNewForm(request, response);
                break;
            case "edit":
               showEditForm(request, response);
                break;
            case "search":
                search(request, response);
                break;

            default:
               listCustomer(request, response);
                break;
        }
    }

    private void search(HttpServletRequest request, HttpServletResponse response) {
        String name=request.getParameter("name");
        List<Customer>  customerList=furamaService.searchName(name);
        request.setAttribute("list_customer",customerList);
        RequestDispatcher dispatcher=request.getRequestDispatcher("/view/home_customer.jsp");
        try {
            dispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void deleteUser(HttpServletRequest request, HttpServletResponse response) throws IOException {
       int id=Integer.parseInt( request.getParameter("id"));
       furamaService.deleteCustomer(id);
       response.sendRedirect("/customer");
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id=Integer.parseInt(request.getParameter("id"));
        Customer existingUser=furamaService.selectCustomer(id);
        request.setAttribute("customer",existingUser);
        RequestDispatcher dispatcher=request.getRequestDispatcher("/view/update_customer.jsp");
        dispatcher.forward(request,response);
    }

    private void listCustomer(HttpServletRequest request, HttpServletResponse response) {
        List<Customer> customerList=furamaService.selectAllCustomer();
        request.setAttribute("list_customer",customerList);
        RequestDispatcher dispatcher=request.getRequestDispatcher("/view/home_customer.jsp");
        try {
            dispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher=request.getRequestDispatcher("/view/create_customer.jsp");
        dispatcher.forward(request,response);
    }
}
