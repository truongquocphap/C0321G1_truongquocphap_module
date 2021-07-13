package controller;

import model.bean.Customer;
import model.bean.Employee;
import model.service.EmployeeService;
import model.service.EmployeeServiceIplm;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet(name = "EmployeeServlet" , urlPatterns = "/employee")
public class EmployeeServlet extends HttpServlet {
    EmployeeService employeeService=new EmployeeServiceIplm();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action=request.getParameter("action");
        if (action==null){
            action="";
        }
        switch (action){
            case "create":
                insertEmployee(request,response);
                break;
        }
    }

    private void insertEmployee(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String employeeName= request.getParameter("employeeName");
        String employeeBirthday = request.getParameter("employeeBirthday");
        String employeeIdCard = request.getParameter("employeeIdCard");
        double employeeSalary = Double.parseDouble(request.getParameter("employeeSalary"));
        String employeePhone = request.getParameter("employeePhone");
        String employeeEmail = request.getParameter("employeeEmail");
        String employeeAddress = request.getParameter("employeeAddress");
        int positionId = Integer.parseInt(request.getParameter("positionId"));
        int educationDegreeId = Integer.parseInt(request.getParameter("educationDegreeId"));
        int divisionId = Integer.parseInt(request.getParameter("divisionId"));
        String username = request.getParameter("username");
        Employee employee = new Employee(employeeName,employeeBirthday,employeeIdCard,employeeSalary,employeePhone,employeeEmail,employeeAddress,positionId,educationDegreeId,divisionId,username);
        Map<String, String> mapMessage =  employeeService.insertEmployee(employee);;
        if (mapMessage.isEmpty()){
            listEmployee(request, response);
        }else {
            request.setAttribute("messName", mapMessage.get("name"));
            request.setAttribute("messBirthday", mapMessage.get("birthday"));
            request.setAttribute("messIdCard", mapMessage.get("idCard"));
            request.setAttribute("messPhone", mapMessage.get("phone"));
            request.setAttribute("messEmail", mapMessage.get("email"));
            request.setAttribute("messSalary", mapMessage.get("salary"));
            request.setAttribute("employee", employee);
            showNewForm(request,response);
        }
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
            default:
                listEmployee(request, response);
                break;
        }
    }

    private void listEmployee(HttpServletRequest request, HttpServletResponse response) {
        List<Employee> employeeList=employeeService.selectAllEmployee();
        request.setAttribute("list_employee",employeeList);
        RequestDispatcher dispatcher=request.getRequestDispatcher("/view/employee/home_employee.jsp");
        try {
            dispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher=request.getRequestDispatcher("/view/employee/create_employee.jsp");
        dispatcher.forward(request,response);
    }
}
