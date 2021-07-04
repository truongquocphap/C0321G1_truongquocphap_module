package controller;

import model.Service.UserService;
import model.Service.UserServiceIplm;
import model.bean.User;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@javax.servlet.annotation.WebServlet(name = "UserServlet",urlPatterns = {"","/user"})
public class UserServlet extends javax.servlet.http.HttpServlet {
    private static final long serialVersion=1L;
    private UserService userService=new UserServiceIplm();

    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        String action=request.getParameter("action");
        if (action==null){
            action="";
        }

            switch (action){
                case "create":
                    try {
                        insertUser(request,response);
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                    break;
                case "edit":
                    try {
                        updateUser(request,response);
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                    break;
            }

    }

    private void updateUser(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        int id= Integer.parseInt(request.getParameter("id"));
        String name=request.getParameter("name");
        String email=request.getParameter("email");
        String country=request.getParameter("country");

        User user=  new User(id,name,email,country);
                userService.updateUser(user);
//        user.setName(name);
//        user.setEmail(email);
//        user.setCountry(country);
        sortName(request,response);
    }

    private void insertUser(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
            String name=request.getParameter("name");
            String email=request.getParameter("email");
            String country=request.getParameter("country");
            User user=new User(name,email,country);
            userService.insertUser(user);
           sortName(request,response);

    }
    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
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
            case "delete":
                try {
                    deleteUser(request,response);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                break;
            case "search":
                search(request, response);
                break;
            case "permision":
                addUserPermision(request, response);
                break;
            case "test_without_tran":
                testWithoutTran(request, response);
                break;
            case "test_use_tran":
                test_use_tran(request, response);
                break;
            default:
                sortName(request, response);
                break;
        }
    }

    private void test_use_tran(HttpServletRequest request, HttpServletResponse response) {
        userService.insertUpdateTransaction();
    }

    private void testWithoutTran(HttpServletRequest request, HttpServletResponse response) {
        userService.insertUpdateWithoutTransaction();
    }

    private void addUserPermision(HttpServletRequest request, HttpServletResponse response) {
        User user=new User("quang","quang@gmail.com","binh dinh");
        int[] permision={1,2,4};
        userService.addUserTransaction(user,permision);
    }

    private void deleteUser(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        int id=Integer.parseInt(request.getParameter("id"));
      userService.deleteUser(id);
      List<User> userList = userService.selectAllUser();
      request.setAttribute("user",userList);
      RequestDispatcher dispatcher=request.getRequestDispatcher("/view/list.jsp");
    }

    private void listUser(HttpServletRequest request, HttpServletResponse response) {
        List<User>  userList=userService.selectAllUser();
        request.setAttribute("listUser",userList);
        RequestDispatcher dispatcher=request.getRequestDispatcher("view/list.jsp");
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
        User existingUser=userService.selectUser(id);
        request.setAttribute("user",existingUser);
        RequestDispatcher dispatcher=request.getRequestDispatcher("/view/edit.jsp");
        dispatcher.forward(request,response);
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher=request.getRequestDispatcher("/view/create.jsp");
        dispatcher.forward(request,response);
    }
    private void search(HttpServletRequest request, HttpServletResponse response){
        String country=request.getParameter("country");
        List<User>  userList=userService.search(country);
        request.setAttribute("listUser",userList);
        RequestDispatcher dispatcher=request.getRequestDispatcher("/view/list.jsp");
        try {
            dispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    private void sortName(HttpServletRequest request, HttpServletResponse response) {
        List<User>  userList=userService.sortName();
        request.setAttribute("listUser",userList);
        RequestDispatcher dispatcher=request.getRequestDispatcher("view/list.jsp");
        try {
            dispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
