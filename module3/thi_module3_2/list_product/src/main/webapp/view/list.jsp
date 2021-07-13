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
    <link rel="stylesheet" type="text/css" href="../assert/bootstrap4/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="../assert/datatables/css/dataTables.bootstrap4.min.css">
</head>

<body>
<div class="container-fluid mt-3">
    <h1 class="text-center">Phòng Trọ List</h1>

    <nav class="navbar navbar-expand-lg navbar-light">
        <a class="navbar-brand btn btn-primary mb-2 text-white" href="/phongtro?action=create" role="button"> + Create
            Phòng Trọ</a>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <div class="navbar-nav mr-auto"></div>

            <form class="form-inline my-2 my-lg-0" action="/phongtro" method="post">
                <input type="hidden" name="action" value="search">
                <input name="name" class="form-control me-2 mr-1" type="search" placeholder="Search"
                       aria-label="Search">

                <button class="btn btn-info text-white" type="submit">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="14" fill="currentColor"
                                 class="bi bi-search" viewBox="0 0 16 16">
                                <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
                            </svg>
                        </li>
                        <li class="nav-item pl-2">
                            Search
                        </li>
                    </ul>
                </button>
            </form>
        </div>
    </nav>
</div>


<div class="container-fluid">
    <form action="/phongtro" method="post">
        <input type="hidden" name="action" value="edit">
        <input type="hidden" name="id" value="" id="idEdit">

        <table class="table table-bordered table-striped" style="overflow-x:scroll; max-width: 100%; display: inline-block">
            <thead>
            <tr>
                <th>STT</th>
                <th>ID</th>
                <th>Tên người thuê Phòng</th>
                <th>Số Điện Thoại</th>
                <th>Ngày Bắt đầu</th>
                <th>Hình thức thanh toán</th>
                <th>Ghi chú</th>
                <th >delete</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${phongTroList}" var="phongTro" varStatus="stt">
                <tr>
                    <td>${stt.count}</td>
                    <td>${phongTro.id}</td>

                    <td>${phongTro.tenNguoiThue}</td>

                    <td>${phongTro.soDienThoai}</td>

                    <td>${phongTro.ngayBatDau}</td>

                    <td>${phongTro.hinhThuc}</td>

                    <td>
                      ${phongTro.ghiChu}
                    </td>

                    <td>
                        <button onclick="onDelete(${phongTro.id})" type="button" class="btn btn-danger"
                                data-toggle="modal" data-target="#exampleModal">
                            Delete
                        </button>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </form>
</div>

<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Confirm Delete</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="/phongtro">

                <input type="hidden" name="action" value="delete">
                <input type="hidden" name="id" value="" id="phongtroID">

                <div class="modal-body">

                    Are you sure delete ?
                    <span>${phongTro.id} </span>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-danger">Delete</button>
                </div>
            </form>
        </div>
    </div>
</div>

<script>
    function onDelete(id) {
        document.getElementById("phongtroID").value = id;
    }
</script>
<script src="../assert/jquery/jquery-3.5.1.min.js"></script>
<script src="../assert/datatables/js/jquery.dataTables.min.js"></script>
<script src="../assert/datatables/js/dataTables.bootstrap4.min.js"></script>
<script src="../assert/jquery/popper.min.js"></script>
<script src="../assert/bootstrap4/js/bootstrap.js"></script>
</body>
</html>