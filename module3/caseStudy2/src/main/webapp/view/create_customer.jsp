<%--
  Created by IntelliJ IDEA.
  User: truongquocphap
  Date: 7/7/21
  Time: 8:45 AM
  To change this template use File | Settings | File Templates.
--%>
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
                <label for="inputEmail4">Customer type ID</label>
                <input class="form-control" name="customer_type_id">
            </div>
            <div class="form-group ">
                <label for="inputEmail4">Name</label>
                <input class="form-control" id="inputEmail4" name="customer_name">
            </div>
            <div class="form-group">
                <label for="inputEmail4">Birthday</label>
                <input class="form-control" name="customer_birthday">
            </div>
            <div class="form-group col-md-12">
                <label for="inputEmail4">Gender</label>
                <input class="form-control" name="customer_gender">
            </div>
            <div class="form-group col-md-12">
                <label for="inputEmail4">ID Card</label>
                <input class="form-control" name="customer_id_card">
            </div>
            <div class="form-group col-md-12">
                <label for="inputEmail4">Phone</label>
                <input class="form-control" name="customer_phone">
            </div>
            <div class="form-group col-md-12">
                <label for="inputEmail4">Email</label>
                <input class="form-control" name="customer_email">
            </div>
            <div class="form-group">
                <label for="inputAddress">Address</label>
                <input type="text" class="form-control" id="inputAddress" name="customer_address">
            </div>
            <div class="form-group">
                <label for="inputAddress">Code</label>
                <input type="text" class="form-control" name="customer_code">
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
