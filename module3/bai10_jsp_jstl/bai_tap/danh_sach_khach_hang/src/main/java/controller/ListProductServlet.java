package controller;

import model.Customer;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "ListProductServlet",urlPatterns = "")
public class ListProductServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Customer> customerList= new ArrayList<>();
        customerList.add(new Customer("Doraemon","1999-11-11","Quang ngai","https://www.google.com/url?sa=i&url=https%3A%2F%2Fen.wikipedia.org%2Fwiki%2FDoraemon_(character)&psig=AOvVaw0rSSDu2R1Hvxl10WcFBY-X&ust=1624895219427000&source=images&cd=vfe&ved=0CAoQjRxqFwoTCKDMy8SUuPECFQAAAAAdAAAAABAI"));
        customerList.add(new Customer("Nobita","1999-11-11","Quang ngai","https://www.google.com/url?sa=i&url=https%3A%2F%2Fvi.wikipedia.org%2Fwiki%2FNobi_Nobita&psig=AOvVaw06bBbJEwzkBQH3RoiIVHZ4&ust=1624895290448000&source=images&cd=vfe&ved=0CAoQjRxqFwoTCKip0eaUuPECFQAAAAAdAAAAABAD"));
        customerList.add(new Customer("Chaien","1999-11-11","Quang ngai","https://www.google.com/url?sa=i&url=https%3A%2F%2Fzh-cn.facebook.com%2F215313238879321%2Fphotos%2Fchaien-trong-phim-doraemon-ch%25C3%25BA-m%25C3%25A8o-m%25C3%25A1y-%25C4%2591%25E1%25BA%25BFn-t%25E1%25BB%25AB-t%25C6%25B0%25C6%25A1ng-lai-chaien-c%25C3%25B3-s%25E1%25BB%25A9c-l%25E1%25BB%25B1c-r%25E1%25BA%25A5t-m%25E1%25BA%25A1%2F215322175545094%2F&psig=AOvVaw1aKeU9QnFxL_YiEj6HH2rW&ust=1624895342385000&source=images&cd=vfe&ved=0CAoQjRxqFwoTCKC2yP-UuPECFQAAAAAdAAAAABAD"));
        customerList.add(new Customer("Suka","1999-11-11","Quang ngai","https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.facebook.com%2FSuka-Shop-h%25C3%25A0ng-x%25C3%25A1ch-tay-Nh%25E1%25BA%25ADt-cho-m%25E1%25BA%25B9-v%25C3%25A0-b%25C3%25A9-217444288947061%2Fposts&psig=AOvVaw1VnYg3mOhOpv09V3aBHsNk&ust=1624895384385000&source=images&cd=vfe&ved=0CAoQjRxqFwoTCLj6xpOVuPECFQAAAAAdAAAAABAD"));
        customerList.add(new Customer("Luffi","1999-11-11","Quang ngai","https://www.google.com/url?sa=i&url=https%3A%2F%2Fm.facebook.com%2F140463663240279%2Fphotos%2Fa.140463693240276%2F140464113240234%2F%3Ftype%3D3&psig=AOvVaw3OoW2p-1xSHJ45ABcipo6w&ust=1624895438729000&source=images&cd=vfe&ved=0CAoQjRxqFwoTCLjbrK2VuPECFQAAAAAdAAAAABAD"));
        request.setAttribute("products",customerList);
        RequestDispatcher requestDispatcher=request.getRequestDispatcher("/index.jsp");
        requestDispatcher.forward(request,response);
    }
}
