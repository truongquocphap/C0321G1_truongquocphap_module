<%--
  Created by IntelliJ IDEA.
  User: truongquocphap
  Date: 7/8/21
  Time: 1:59 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="../../bootstrap/bootstrap4/css/bootstrap.css">

<html>
<head>
    <title>Title</title>
</head>
<body>
<%@ include file="../navbar.jsp" %>

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
        <form action="/service?action=create" method="post">
            <%--            <input type="hidden" name="action" value="create">--%>
            <div class="form-group">
                <label for="inputEmail4">Service Name</label>
                <input class="form-control" name="service_name">
            </div>
            <div class="form-group ">
                <label for="inputEmail4">Service Area</label>
                <input class="form-control" id="inputEmail4" name="service_area">
            </div>
            <div class="form-group">
                <label for="inputEmail4">Cost</label>
                <input class="form-control" name="service_cost">
            </div>
            <div class="form-group col-md-12">
                <label for="inputEmail4">Max People</label>
                <input class="form-control" name="service_max_people">
            </div>
            <div class="form-group col-md-12">
                <label >Rent type ID</label>
                <select name="rent_type_id">
                    <option value="1">DAY</option>
                    <option value="2">WEEk</option>
                    <option value="3">MONTH</option>
                    <option value="4">YEAR</option>
                </select>
            </div>
                <div class="form-group col-md-12">
                    <label >Service type ID</label>
                    <select name="service_type_id">
                        <option value="1">House</option>
                        <option value="2">Villa</option>
                        <option value="3">Room</option>
                    </select>
<%--                    <label for="inputEmail4">Service type ID</label>--%>
<%--                    <input class="form-control" name="service_type_id">--%>
                </div>
            <div class="form-group col-md-12">
                <label for="inputEmail4">Strand Room</label>
                <input class="form-control" name="strandard_room">
            </div>
            <div class="form-group col-md-12">
                <label for="inputEmail4">Description</label>
                <input class="form-control" name="description_other_convenience">
            </div>
            <div class="form-group">
                <label for="inputAddress">Pool Area</label>
                <input type="text" class="form-control" id="inputAddress" name="pool_area">
            </div>
            <div class="form-group">
                <label for="inputAddress">Number of Floor</label>
                <input type="text" class="form-control" name="number_of_floor">
            </div>
                <div class="form-group">
                    <label for="inputAddress">Service Code</label>
                    <input type="text" class="form-control" name="service_code">
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
    <%@ include file="../footer.jsp" %>


    <script src="../../bootstrap/jquery/jquery-3.5.1.min.js"></script>
    <script src="../../bootstrap/jquery/popper.min.js"></script>
    <script src="../../bootstrap/bootstrap4/js/bootstrap.js"></script>
</body>
</html>
