<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: truongquocphap
  Date: 6/30/21
  Time: 10:42 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="../../bootstrap/bootstrap4/css/bootstrap.css">
<title>User manager</title>
<html>
<head>
    <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
        <ol class="carousel-indicators">
            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
        </ol>
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="../../img/img_P.jpg" style="height: 150px" class="d-block w-100" alt="...">
            </div>
            <div class="carousel-item">
                <img src="../../img/img_P.jpg"style="height: 150px" class="d-block w-100" alt="...">
            </div>
            <div class="carousel-item">
                <img src="../../img/img_P.jpg" style="height: 150px" class="d-block w-100" alt="...">
            </div>
        </div>
        <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>
<h1 style="font-family: Parisienne, Papyrus" >PhÁpCP</h1>
<c:if test="${empty listUser}">
    <h3>Product List empty!</h3>
</c:if>
<c:if test="${not empty listUser}">
    <table class="table table-striped table-dark">
        <tr>
            <th scope="col">
                <button type="button" class="btn btn-primary">
                    <a href="view/create.jsp" style="color: #1d2124">Create User</a></button>
            </th>

        </tr>

    </table>
    <form action="/user" method="get">
        <input type="hidden" name="action" value="search">

        <th scope="col">
            <input type="text" name="country" placeholder="Search...">
        </th>
        <th>
            <button type="submit" class="btn btn-primary">Search</button>
        </th>
    </form>
    <table class="table table-striped table-dark">
        <thead>
        <tr>
            <th scope="col">ID</th>
            <th scope="col">Name</th>
            <th scope="col">Email</th>
            <th scope="col">Country</th>
            <th scope="col">Edit</th>
            <th scope="col">Delete</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${listUser}" var="user">

      
        <tr>
            <th scope="row">${user.id}</th>
            <td>${user.name}</td>
            <td>${user.email}</td>
            <td>${user.country}</td>
            <th>
                <button type="button" class="btn btn-primary">
                    <a href="/user?action=edit&id=${user.getId()}" style="color: #1d2124">Edit</a>
                </button>
            </th>
            <th>
                <button type="button" class="btn btn-primary">
                    <a href="/user?action=delete&id=${user.getId()}" style="color: #1d2124">Delete</a>
                </button>
            </th>
        </tr>
        </c:forEach>
        </tbody>
    </table>
</c:if>
</head>
<body>
<script src="../../bootstrap/jquery/jquery-3.5.1.min.js"></script>
<script src="../../bootstrap/jquery/popper.min.js"></script>
<script src="../../bootstrap/bootstrap4/js/bootstrap.js"></script>
</body>
</html>
