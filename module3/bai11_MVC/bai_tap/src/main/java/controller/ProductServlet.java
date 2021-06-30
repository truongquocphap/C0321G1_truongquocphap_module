package controller;

import model.bean.Product;
import model.service.ProductService;
import model.service.ProductServicelmpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@javax.servlet.annotation.WebServlet(name = "ProductServlet", urlPatterns = {"","/products"})
public class ProductServlet extends javax.servlet.http.HttpServlet {
    private ProductService productService=new ProductServicelmpl();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                createProduct(request,response);
                break;
            case "edit":
                editProduct(request,response);
                break;
            case "search":
                searchProductName(request,response);
                break;
            default:
                showList(request,response);
        }
    }

    private void searchProductName(HttpServletRequest request, HttpServletResponse response) {
        String name=request.getParameter("search");
                List<Product> listProduct=new ArrayList<>();
                     listProduct=   productService.findByName(name);
        request.setAttribute("product",listProduct);
        RequestDispatcher dispatcher=request.getRequestDispatcher("/product/show_name.jsp");
        try {
            dispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    private void editProduct(HttpServletRequest request, HttpServletResponse response) {
        int id= Integer.parseInt(request.getParameter("id"));
        String name=request.getParameter("name");
        String codeProduct=request.getParameter("code_product");
        String producer=request.getParameter("producer");

        Product product=  productService.finById(id);
        product.setName(name);
        product.setCodeProduct(codeProduct);
        product.setProducer(producer);
            showList(request,response);


    }

    private void createProduct(HttpServletRequest request, HttpServletResponse response) {
        int id=Integer.parseInt(request.getParameter("id"));
        String name=request.getParameter("name");
        String address=request.getParameter("code_product");
        String producer=request.getParameter("producer");
        Product product=new Product(id,name,address,producer);
        productService.save(product);
        try {
            response.sendRedirect("/product/list.jsp");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showCreatePages(request,response);
                break;
            case "edit":
                showEditPages(request,response);
                break;
            case "delete":
                deleteProduct(request,response);
                break;
            case "search":
                showSearch(request,response);
                break;
            default:
                showList(request, response);
                break;
        }
    }

    private void showSearch(HttpServletRequest request, HttpServletResponse response) {
        try {
            response.sendRedirect("/product/search.jsp");
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    private void deleteProduct(HttpServletRequest request, HttpServletResponse response) {
        int id=Integer.parseInt(request.getParameter("id"));
      productService.remove(id);
      showList(request,response);
    }

    private void showEditPages(HttpServletRequest request, HttpServletResponse response) {
        int id= Integer.parseInt(request.getParameter("id"));
        Product product=  productService.finById(id);
        request.setAttribute("products",product);

        try {
            request.getRequestDispatcher("/product/edit.jsp").forward(request,response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void showCreatePages(HttpServletRequest request, HttpServletResponse response) {
        try {
            response.sendRedirect("/product/create.jsp");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showList(HttpServletRequest request, HttpServletResponse response) {
        List<Product> listProduct=productService.findAll();
        request.setAttribute("product",listProduct);
        RequestDispatcher dispatcher=request.getRequestDispatcher("/product/list.jsp");
        try {
            dispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }



}
