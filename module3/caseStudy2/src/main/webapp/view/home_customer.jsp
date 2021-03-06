<%--
  Created by IntelliJ IDEA.
  User: truongquocphap
  Date: 7/6/21
  Time: 1:39 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="../../css/style.css">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="../../bootstrap/bootstrap4/css/bootstrap.css">

<html>
<head>
    <title>Title</title>
</head>
<body>
<nav class="navbar navbar-light bg-light" style="height: 60px;color: #6f42c1;background: #9fcdff" >
    <a class="navbar-brand"><img src="../img/img_P.jpg" style="height: 60px" width="50px"></a>
    <h1 style="font-family: Parisienne, Papyrus" >PhÁpCP</h1>
</nav>
<nav class="navbar navbar-expand-lg navbar-light bg-light navbar-dark bg-primary" style="background-color: #d4edda">
    <a class="navbar-brand" href="#">Home</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto d-flex justify-content-center">
            <li class="nav-item active ">
                <a class="nav-link" style="color: black" href="/employee" >Employee <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" style="color: black" href="/customer">Customer</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" style="color: black" href="/service">Service</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" style="color: black" href="#">Contract</a>
            </li>
        </ul>
        <form class="form-inline my-2 my-lg-0" action="/customer" method="get">
            <input type="hidden" name="action" value="search">
            <input class="form-control mr-sm-2" type="search" name="name" placeholder="Search" aria-label="Search">
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
        </form>
    </div>
</nav>
<div class="container-fluid">
        <div class="row">
            <div class="col-3">
                <div class="list-group">
                    <a href="#" class="list-group-item list-group-item-action active" aria-current="true">
                        The current link item
                    </a>
                    <a href="#" class="list-group-item list-group-item-action">A second link item</a>
                    <a href="#" class="list-group-item list-group-item-action">A third link item</a>
                    <a href="#" class="list-group-item list-group-item-action">A fourth link item</a>
                    <a href="#" class="list-group-item list-group-item-action disabled" tabindex="-1" aria-disabled="true">A disabled link item</a>
                </div>
            </div>
            <div class="col-9">
                <c:if test="${empty list_customer}">
                    <h3>Customer List empty!</h3>
                </c:if>
                <c:if test="${not empty list_customer}">
                    <table class="table table-striped table-dark" >
                        <tr>
                            <td scope="col">
                                <button type="button" class="btn btn-primary">
                                    <a href="view/create_customer.jsp" style="color: #1d2124">Create Customer</a></button>
                            </td>
                        </tr>
                    </table>
                    <table class=" table-striped table-dark" style="overflow-x:scroll; max-width: 100%; display: inline-block;text-align: center">
                        <thead>
                        <tr>
                            <th scope="col">ID</th>
                            <th scope="col">Customer_type_id</th>
                            <th scope="col">Name</th>
                            <th scope="col">Birthday</th>
                            <th scope="col">Gender</th>
                            <th scope="col">Id_card</th>
                            <th scope="col">Phone</th>
                            <th scope="col">Email</th>
                            <th scope="col">Address</th>
                            <th scope="col">Code</th>
                            <th scope="col">Edit</th>
                            <th scope="col">Delete</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${list_customer}" var="customer">
                            <tr>
                                <th scope="row">${customer.getCustomer_id()}</th>
                                <td>${customer.getCustomer_type_id()}</td>
                                <td>${customer.getCustomer_name()}</td>
                                <td>${customer.getCustomer_birthday()}</td>
                                <td>${customer.getCustomer_gender()}</td>
                                <td>${customer.getCustomer_id_card()}</td>
                                <td>${customer.getCustomer_phone()}</td>
                                <td>${customer.getCustomer_email()}</td>
                                <td>${customer.getCustomer_address()}</td>
                                <td>${customer.getCustomer_code()}</td>
                                <th>
                                    <button type="button" class="btn btn-primary">
                                        <a href="/customer?action=edit&id=${customer.getCustomer_id()}" style="color: #1d2124">Edit</a>
                                    </button>
                                </th>
                                <th>
                                    <button type="button" onclick="onDelete(${customer.getCustomer_id()})" class="btn btn-danger" data-toggle="modal" data-target="#exampleModal">
                                        Delete
                                    </button>
                                </th>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </c:if>

            </div>
        </div>
</div>
<div class="row" style="background: #062c33">
    <ul class="nav col-md-6">
        <li>
            <p>Follow this page</p>
        </li>
        <li class="nav-item pl-3">
            <a itemprop="sameAs" href="http://www.facebook.com/surface" aria-label="Follow this page on Facebook" title="Follow this page on Facebook" target="_blank"
               data-bi-name="facebook" data-bi-bhvr="SOCIALLIKE" data-bi-socchn="facebook" data-bi-type="image" class="x-hidden-focus"><picture>
                <source srcset="https://c.s-microsoft.com/en-us/CMSImages/facebook-gray.svg?version=0b3295fd-6d09-d5a5-af3b-498b3ad72a95" media="(min-width:0px)">
                <img src="https://c.s-microsoft.com/en-us/CMSImages/facebook-gray.svg?version=0b3295fd-6d09-d5a5-af3b-498b3ad72a95" class="nav-link" width="" height="" alt=""></picture></a>
        </li>
        <li class="nav-item pl-3">
            <a itemprop="sameAs" href="http://www.twitter.com/surface" aria-label="Follow this page on Twitter" title="Follow this page on Twitter" target="_blank" data-bi-name="twitter"
               data-bi-bhvr="SOCIALLIKE" data-bi-socchn="twitter" data-bi-type="image" class="x-hidden-focus"><picture>
                <source srcset="https://c.s-microsoft.com/en-us/CMSImages/twitter-gray.svg?version=9b4af76e-357b-33af-9bf5-7b5dbf882330" media="(min-width:0px)">
                <img src="https://c.s-microsoft.com/en-us/CMSImages/twitter-gray.svg?version=9b4af76e-357b-33af-9bf5-7b5dbf882330" class="nav-link" width="" height="" alt=""></picture></a>
        </li>
        <li class="nav-item pl-3">
            <a itemprop="sameAs" href="https://www.instagram.com/surface" class="instagram x-hidden-focus" title="Follow this page on instagram" aria-label="Follow this page on instagram" target="_blank" data-bi-name="instagram" data-bi-bhvr="SOCIALLIKE" data-bi-socchn="instagram" data-bi-type="image"><picture>
                <mscom:image usedatasource="true" htmlcustomattributes="{'media':'(min-width:0px)'}" alt="Follow this page on instagram"
                                md:payloadguid="0e6f04f3-3223-417f-a349-926b12613b8f"></mscom:image>
                <source srcset="https://c.s-microsoft.com/en-us/CMSImages/intagram.svg?version=3571ba35-1fde-08f2-8396-dd1969712cd8" media="(min-width:0px)">
                <img src="https://c.s-microsoft.com/en-us/CMSImages/intagram.svg?version=3571ba35-1fde-08f2-8396-dd1969712cd8" class="nav-link" width="" height="" alt=""></picture></a>
        </li>
        <li class="nav-itemp-3 pl-3">
            <a itemprop="sameAs" href="https://www.linkedin.com/showcase/microsoft-surface" class="LinkedIn x-hidden-focus" aria-label="Follow this page on LinkedIn"
               title="undefined" target="_blank" data-bi-name="linkedin" data-bi-bhvr="SOCIALLIKE" data-bi-socchn="linkedin" data-bi-type="image"><picture>
                <source srcset="https://c.s-microsoft.com/en-us/CMSImages/linkedin-black.svg?version=9e943abf-c655-434c-6e60-91aed3e9ea11" media="(min-width:0px)">
                <img src="https://c.s-microsoft.com/en-us/CMSImages/linkedin-black.svg?version=9e943abf-c655-434c-6e60-91aed3e9ea11" class="nav-link" width="" height="" alt=""></picture></a>
        </li>
    </ul>
    <ul class="nav justify-content-end col-md-6">
        <li>
            <p>Share this page</p>
        </li>
        <li class="nav-item pr-3">
            <a itemprop="sameAs" href="http://www.facebook.com/surface" aria-label="Follow this page on Facebook" title="Follow this page on Facebook" target="_blank"
               data-bi-name="facebook" data-bi-bhvr="SOCIALLIKE" data-bi-socchn="facebook" data-bi-type="image" class="x-hidden-focus"><picture>
                <source srcset="https://c.s-microsoft.com/en-us/CMSImages/facebook-gray.svg?version=0b3295fd-6d09-d5a5-af3b-498b3ad72a95" media="(min-width:0px)">
                <img src="https://c.s-microsoft.com/en-us/CMSImages/facebook-gray.svg?version=0b3295fd-6d09-d5a5-af3b-498b3ad72a95" class="nav-link" width="" height="" alt=""></picture></a>
        </li>
        <li class="nav-item pr-3">
            <a itemprop="sameAs" href="http://www.twitter.com/surface" aria-label="Follow this page on Twitter" title="Follow this page on Twitter" target="_blank" data-bi-name="twitter"
               data-bi-bhvr="SOCIALLIKE" data-bi-socchn="twitter" data-bi-type="image" class="x-hidden-focus"><picture>
                <source srcset="https://c.s-microsoft.com/en-us/CMSImages/twitter-gray.svg?version=9b4af76e-357b-33af-9bf5-7b5dbf882330" media="(min-width:0px)">
                <img src="https://c.s-microsoft.com/en-us/CMSImages/twitter-gray.svg?version=9b4af76e-357b-33af-9bf5-7b5dbf882330" class="nav-link" width="" height="" alt=""></picture></a>
        </li>
        <li class="nav-itemp-3 pr-3">
            <a itemprop="sameAs" href="https://www.linkedin.com/showcase/microsoft-surface" class="LinkedIn x-hidden-focus" aria-label="Follow this page on LinkedIn"
               title="undefined" target="_blank" data-bi-name="linkedin" data-bi-bhvr="SOCIALLIKE" data-bi-socchn="linkedin" data-bi-type="image"><picture>
                <source srcset="https://c.s-microsoft.com/en-us/CMSImages/linkedin-black.svg?version=9e943abf-c655-434c-6e60-91aed3e9ea11" media="(min-width:0px)">
                <img src="https://c.s-microsoft.com/en-us/CMSImages/linkedin-black.svg?version=9e943abf-c655-434c-6e60-91aed3e9ea11" class="nav-link" width="" height="" alt=""></picture></a>
        </li>
    </ul>
</div>



<!-- Button trigger modal -->


<!-- Modal -->

<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <form method="post" action="/customer?action=delete">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <input type="hidden" id="idCustomer" name="id">
            <div class="modal-body" >
                Ban co muon xoa khong
                <span id="id_Customer"></span>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>

                <input type="submit" class="btn btn-primary">
            </div>
        </div>
        </form>
    </div>
</div>
<script>
    function onDelete(id) {
        document.getElementById("idCustomer").value=id;
        document.getElementById("id_Customer").innerHTML=id;

    }
</script>
<script src="../../bootstrap/jquery/jquery-3.5.1.min.js"></script>
<script src="../../bootstrap/jquery/popper.min.js"></script>
<script src="../../bootstrap/bootstrap4/js/bootstrap.js"></script>
</body>
</html>
