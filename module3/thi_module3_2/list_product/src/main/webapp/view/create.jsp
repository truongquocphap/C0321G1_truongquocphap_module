<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 7/11/2021
  Time: 9:07 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="/assert/bootstrap4/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="/assert/datatables/css/dataTables.bootstrap4.min.css">
</head>
<body>
<h1 class="text-center">Thêm Phòng Trọ</h1>
<div class="container-fluid mt-2">
    <h2>Thêm Phòng Trọ</h2>
    <form action="/phongtro" method="post">
        <input type="hidden" name="action" value="create">
        <div>
            <div class="form-group">
                <div>
                    <label>Tên người Thuê :</label>
                    <td><input type="text" class="form-control" id="ten_nguoi_thue" aria-describedby="ten_nguoi_thue" name="ten_nguoi_thue" value="${phongTro.tenNguoiThue}">
                        <c:if test="${messName != null}">
                            <small id="ten_nguoi_thue" class="form-text text-danger">${messName}</small>
                        </c:if>
                    </td>
                </div>

                <div>
                    <label>Số điện thoại :</label>
                    <td><input type="text" class="form-control" id="so_dien_thoai" aria-describedby="so_dien_thoai" name="so_dien_thoai" value="${phongTro.soDienThoai}">
                        <c:if test="${messSDT != null}">
                            <small id="so_dien_thoai" class="form-text text-danger">${messSDT}</small>
                        </c:if>
                    </td>
                </div>

                <div>
                    <label>Ngày bắt đầu</label>
                    <td><input type="text" class="form-control" id="ngay_bat_dau" aria-describedby="ngay_bat_dau" name="ngay_bat_dau" value="${phongTro.ngayBatDau}">
                        <c:if test="${messNgayBatDau != null}">
                            <small id="ngay_bat_dau" class="form-text text-danger">${messNgayBatDau}</small>
                        </c:if>
                    </td>
                </div>

                <div>
                    <label>Hinh Thuc Thanh Toan</label>
                    <select name="hinh_thuc">
                        <option value="1">Tháng</option>
                        <option value="2">Quý</option>
                        <option value="3">Năm</option>
                    </select>
                </div>

                <div>
                    <label>Ghi chu :</label>
                    <td><input type="text" class="form-control" id="ghi_chu" aria-describedby="ghi_chu" name="ghi_chu" value="${phongTro.ghiChu}">
                        <c:if test="${messGhiuChu != null}">
                            <small id="ghi_chu" class="form-text text-danger">${messGhiChu}</small>
                        </c:if>
                    </td>
                </div>

            </div>
        </div>
        <div class="mt-2">
            <input class="btn btn-success" type="submit" value="Create"> |
            <a class="btn btn-dark" href="/phongtro" role="button">Back</a>
        </div>
    </form>
</div>


<script src="/assert/jquery/jquery-3.5.1.min.js"></script>
<script src="assert/datatables/js/jquery.dataTables.min.js"></script>
<script src="assert/datatables/js/dataTables.bootstrap4.min.js"></script>
<script src="/assert/jquery/popper.min.js"></script>
<script src="/assert/bootstrap4/js/bootstrap.js"></script>
</body>
</html>
