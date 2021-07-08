package controller;

import model.bean.Customer;
import model.bean.Service;
import model.service.ServiceService;
import model.service.ServiceServiceIplm;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ServiceServlet" , urlPatterns ="/service")
public class ServiceServlet extends HttpServlet {
    private ServiceService serviceIplm=new ServiceServiceIplm();
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
        String service_name= request.getParameter("service_name");
        int area=Integer.parseInt(request.getParameter("service_area"));
        double cost=Double.parseDouble(request.getParameter("service_cost"));
        int people=Integer.parseInt(request.getParameter("service_max_people"));
        int rent_type_id=Integer.parseInt(request.getParameter("rent_type_id"));
        int serviceTypeId=Integer.parseInt(request.getParameter("service_type_id"));

        String room=request.getParameter("strandard_room");
        String descriptionOtherConvenience=request.getParameter("description_other_convenience");
        double pool_area=Double.parseDouble(request.getParameter("pool_area"));
        int floor=Integer.parseInt(request.getParameter("number_of_floor"));

        String code=request.getParameter("service_code");


        Service  service=  new Service(id,service_name,area,cost,people,rent_type_id,serviceTypeId,room,descriptionOtherConvenience,pool_area,floor,code);
        serviceIplm.updateService(service);
        list_service(request,response);
    }

    private void list_service(HttpServletRequest request, HttpServletResponse response) {
        List<Service> serviceList=serviceIplm.selectAllService();
        request.setAttribute("list_service",serviceList);
        RequestDispatcher dispatcher=request.getRequestDispatcher("/view/service/home_service.jsp");
        try {
            dispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void insertUser(HttpServletRequest request, HttpServletResponse response) {
        String service_name= request.getParameter("service_name");
        int area=Integer.parseInt(request.getParameter("service_area"));
        double cost=Double.parseDouble(request.getParameter("service_cost"));
        int people=Integer.parseInt(request.getParameter("service_max_people"));
        int rent_type_id=Integer.parseInt(request.getParameter("rent_type_id"));
        int serviceTypeId=Integer.parseInt(request.getParameter("service_type_id"));
        String room=request.getParameter("strandard_room");
        String descriptionOtherConvenience=request.getParameter("description_other_convenience");
        double pool_area=Double.parseDouble(request.getParameter("pool_area"));
        int floor=Integer.parseInt(request.getParameter("number_of_floor"));
        String code=request.getParameter("service_code");


        Service  service=  new Service(service_name,area,cost,people,rent_type_id,serviceTypeId,room,descriptionOtherConvenience,pool_area,floor,code);
        serviceIplm.insertService(service);
        list_service(request,response);
    }
    private void deleteUser(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id=Integer.parseInt( request.getParameter("id"));
        serviceIplm.deleteService(id);
        response.sendRedirect("/service");
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
                list_service(request, response);
                break;
        }
    }

    private void search(HttpServletRequest request, HttpServletResponse response) {
        String name=request.getParameter("name");
        List<Service>  serviceList=serviceIplm.searchName(name);
        request.setAttribute("list_service",serviceList);
        RequestDispatcher dispatcher=request.getRequestDispatcher("/view/service/home_service.jsp");
        try {
            dispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id=Integer.parseInt(request.getParameter("id"));
        Service existingUser=serviceIplm.selectService(id);
        request.setAttribute("service",existingUser);
        RequestDispatcher dispatcher=request.getRequestDispatcher("/view/service/update_service.jsp");
        dispatcher.forward(request,response);
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher=request.getRequestDispatcher("/view/service/create_service.jsp");
        dispatcher.forward(request,response);
    }
}
