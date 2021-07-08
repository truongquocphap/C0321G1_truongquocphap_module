<%--
  Created by IntelliJ IDEA.
  User: truongquocphap
  Date: 7/7/21
  Time: 8:48 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<nav class="navbar navbar-light bg-light" style="height: 60px">
    <a class="navbar-brand"><img src="../../img/img_P.jsp" style="height: 60px" width="50px"></a>
    <h1 style="font-family: Parisienne, Papyrus" >PhÁpCP</h1>
</nav>
<nav class="navbar navbar-expand-lg navbar-light bg-light navbar-dark bg-primary">
    <a class="navbar-brand" href="#">Home</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto d-flex justify-content-center">
            <li class="nav-item active ">
                <a class="nav-link" style="color: black" href="#" >Employee <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" style="color: black" href="#">Customer</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" style="color: black" href="#">Service</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" style="color: black" href="#">Contract</a>
            </li>
        </ul>
        <form class="form-inline my-2 my-lg-0">
            <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
        </form>
    </div>
</nav>
</body>
</html>
