package controller;

import model.bean.PhongTro;
import model.service.PhongTroService;
import model.service.PhongTroServiceImlp;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet(name = "PhongTroServlet", urlPatterns = {"", "/phongtro"})
public class PhongTroServlet extends HttpServlet {
    PhongTroService phongTroService = new PhongTroServiceImlp();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action == null) {
            action = "";
        }

        switch (action) {
            case "create":
                addNewProduct(request, response);
                break;
            case "search":
                searchProductByName(request, response);
                break;
        }
    }

    private void searchProductByName(HttpServletRequest request, HttpServletResponse response) {
        String nameProduct = request.getParameter("name");
        List<PhongTro> phongTroList = phongTroService.findByName(nameProduct);

        request.setAttribute("phongTroList", phongTroList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/view/list.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }



    private void addNewProduct(HttpServletRequest request, HttpServletResponse response) {
        String tenNguoiThue = request.getParameter("ten_nguoi_thue");
        String soDienThoai = request.getParameter("so_dien_thoai");
        String ngayBatDau = request.getParameter("ngay_bat_dau");
        int idHinhThuc = Integer.parseInt(request.getParameter("hinh_thuc"));
        String ghiChu = request.getParameter("ghi_chu");
        PhongTro phongTro = new PhongTro(tenNguoiThue, soDienThoai, ngayBatDau, idHinhThuc, ghiChu);
        Map<String,String> map=phongTroService.save(phongTro);
        if (map.isEmpty())
            showList (request,response);
        else {
            request.setAttribute("messName",map.get("ten_nguoi_thue"));
            request.setAttribute("messSDT",map.get("so_dien_thoai"));
            request.setAttribute("messGhiChu",map.get("ghi_chu"));
            addNewProduct(request,response);
        }
        try {
            response.sendRedirect("/phongtro");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action == null) {
            action = "";
        }

        switch (action) {
            case "create":
                showFormCreate(request, response);
            case "delete":
                deleteProduct(request, response);
                break;
            default:
                showList(request, response);
        }
    }

    private void showFormCreate(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher dispatcher = request.getRequestDispatcher("/view/create.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void deleteProduct(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        phongTroService.remove(id);
        try {
            response.sendRedirect("/phongtro");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


    private void showList(HttpServletRequest request, HttpServletResponse response) {
        List<PhongTro> phongTroList = phongTroService.findAll();
        request.setAttribute("phongTroList", phongTroList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/list.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
