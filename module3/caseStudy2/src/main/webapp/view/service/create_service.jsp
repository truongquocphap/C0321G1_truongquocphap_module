<%--
  Created by IntelliJ IDEA.
  User: truongquocphap
  Date: 7/8/21
  Time: 1:59 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
                <label>Service Name</label>
                <input type="text" class="form-control" id="service_name" aria-describedby="service_name"
                       name="service_name" value="${service.service_name}">
                <c:if test="${messName != null}">
                    <small id="customer_name" class="form-text text-danger">${messName}</small>
                </c:if>
            </div>
            <div class="form-group ">
                <label>Service Area</label>
                <input type="text" class="form-control" id="service_area" aria-describedby="service_area"
                       name="service_area" value="${service.service_area}">
                <c:if test="${messArea != null}">
                    <small id="service_area" class="form-text text-danger">${messArea}</small>
                </c:if>
            </div>
            <div class="form-group">
                <label>Cost</label>
                <input type="text" class="form-control" id="service_cost" aria-describedby="service_cost"
                       name="service_cost" value="${service.service_cost}">
                <c:if test="${messCost != null}">
                    <small id="service_cost" class="form-text text-danger">${messCost}</small>
                </c:if>
            </div>
            <div class="form-group col-md-12">
                <label>Max People</label>
                <input type="text" class="form-control" id="service_max_people" aria-describedby="service_max_people"
                       name="service_max_people" value="${service.service_max_people}">
                <c:if test="${messMaxPeople != null}">
                    <small id="service_max_people" class="form-text text-danger">${messMaxPeople}</small>
                </c:if>

            </div>
            <div class="form-group col-md-12">
                <label>Rent type ID</label>
                <select name="rent_type_id">
                    <option value="1">DAY</option>
                    <option value="2">WEEk</option>
                    <option value="3">MONTH</option>
                    <option value="4">YEAR</option>
                </select>
            </div>
            <div class="form-group col-md-12">
                <label>Service type ID</label>
                <select name="service_type_id">
                    <option value="1">House</option>
                    <option value="2">Villa</option>
                    <option value="3">Room</option>
                </select>
                <%--                    <label for="inputEmail4">Service type ID</label>--%>
                <%--                    <input class="form-control" name="service_type_id">--%>
            </div>
            <div class="form-group col-md-12">
                <label>Strand Room</label>
                <input class="form-control" name="strandard_room" value="${service.strandard_room}">
            </div>
            <div class="form-group col-md-12">
                <label>Description</label>
                <input class="form-control" name="description_other_convenience"
                       value="${service.description_other_convenience}">
            </div>
            <div class="form-group">
                <label>Pool Area</label>
                <input type="text" class="form-control" id="pool_area" aria-describedby="pool_area" name="pool_area"
                       value="${service.pool_area}">
                <c:if test="${messPoolArea != null}">
                    <small id="pool_area" class="form-text text-danger">${messPoolArea}</small>
                </c:if>
            </div>
            <div class="form-group">
                <label>Number of Floor</label>
                <input type="text" class="form-control" id="number_of_floor" aria-describedby="number_of_floor"
                       name="number_of_floor" value="${service.number_of_floor}">
                <c:if test="${messNumberOfFloor != null}">
                    <small id="number_of_floor" class="form-text text-danger">${messNumberOfFloor}</small>
                </c:if>
            </div>
            <div class="form-group">
                <label>Service Code</label>
                <input type="text" class="form-control" id="service_code" aria-describedby="service_code"
                       name="service_code" value="${service.service_code}">
                <c:if test="${messCode != null}">
                    <small id="service_code" class="form-text text-danger">${messCode}</small>
                </c:if>
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
