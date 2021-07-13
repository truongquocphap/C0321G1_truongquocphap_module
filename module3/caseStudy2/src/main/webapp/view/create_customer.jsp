<%--
  Created by IntelliJ IDEA.
  User: truongquocphap
  Date: 7/7/21
  Time: 8:45 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="../../bootstrap/bootstrap4/css/bootstrap.css">

<html>
<head>
    <title>Create customer</title>
</head>
<body>
<%@ include file="navbar.jsp" %>

<div class="row">
    <div class="col-3">
        <div class="list-group">
            <a href="#" class="list-group-item list-group-item-action active" aria-current="true">
                The current link item
            </a>
            <a href="#" class="list-group-item list-group-item-action">A second link item</a>
            <a href="#" class="list-group-item list-group-item-action">A third link item</a>
            <a href="#" class="list-group-item list-group-item-action">A fourth link item</a>
            <a href="#" class="list-group-item list-group-item-action disabled" tabindex="-1" aria-disabled="true">A
                disabled link item</a>
        </div>
    </div>
    <div class="col-9">
        <form action="/customer?action=create" method="post">
            <%--            <input type="hidden" name="action" value="create">--%>
            <div class="form-group">
                <label >Customer type ID</label>
                <input class="form-control" name="customer_type_id">
            </div>
            <div class="form-group ">
                <label >Name</label>
                <td><input type="text" class="form-control" id="customer_name" aria-describedby="customer_name" name="customer_name" value="${customer.customer_name}">
                    <c:if test="${messName != null}">
                        <small id="customer_name" class="form-text text-danger">${messName}</small>
                    </c:if>
                </td>
            </div>
            <div class="form-group">
                <label >Birthday</label>
                <td><input type="text" class="form-control" id="customer_birthday" aria-describedby="customer_birthday" name="customer_birthday" value="${customer.customer_birthday}">
                    <c:if test="${messBirthday != null}">
                        <small id="customer_birthday" class="form-text text-danger">${messBirthday}</small>
                    </c:if>
                </td>
            </div>
            <div class="form-group col-md-12">
                <label >Gender</label>
                <input class="form-control" name="customer_gender">
            </div>
            <div class="form-group col-md-12">
                <label >ID Card</label>
                <td><input type="text" class="form-control" id="customer_id_card" aria-describedby="customer_id_card" name="customer_id_card" value="${customer.customer_id_card}">
                    <c:if test="${messIdCard != null}">
                        <small id="customer_id_card" class="form-text text-danger">${messIdCard}</small>
                    </c:if>
                </td>
            </div>
            <div class="form-group col-md-12">
                <label >Phone</label>
                <td><input type="text" class="form-control" id="customer_phone" aria-describedby="customer_phone" name="customer_phone" value="${customer.customer_phone}">
                    <c:if test="${messPhone != null}">
                        <small id="customer_phone" class="form-text text-danger">${messPhone}</small>
                    </c:if>
                </td>
            </div>
            <div class="form-group col-md-12">
                <label >Email</label>
                <td><input type="text" class="form-control" id="customer_email" aria-describedby="customer_email" name="customer_email" value="${customer.customer_email}">
                    <c:if test="${messEmail != null}">
                        <small id="customer_email" class="form-text text-danger">${messEmail}</small>
                    </c:if>
                </td>
            </div>
            <div class="form-group">
                <label >Address</label>
                <input class="form-control" name="customer_address">
            </div>
            <div class="form-group">
                <label >Code</label>
                <td><input type="text" class="form-control" id="customer_code" aria-describedby="customer_code" name="customer_code" value="${customer.customer_code}">
                    <c:if test="${messCode != null}">
                        <small id="customer_code" class="form-text text-danger">${messCode}</small>
                    </c:if>
                </td>

            </div>
            <button type="submit" class="btn btn-primary">Create</button>
            <%--        <div class="form-group">--%>
            <%--            <div class="form-check">--%>
            <%--                <input class="form-check-input" type="checkbox" id="gridCheck">--%>
            <%--                <label class="form-check-label" for="gridCheck">--%>
            <%--                    Check me out--%>
            <%--                </label>--%>
            <%--            </div>--%>
            <%--        </div>--%>
        </form>
    </div>
    <div/>
    <%@ include file="../view/footer.jsp" %>


    <script src="../../bootstrap/jquery/jquery-3.5.1.min.js"></script>
    <script src="../../bootstrap/jquery/popper.min.js"></script>
    <script src="../../bootstrap/bootstrap4/js/bootstrap.js"></script>
</body>
</html>
