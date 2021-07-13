<%--
  Created by IntelliJ IDEA.
  User: truongquocphap
  Date: 7/8/21
  Time: 9:32 PM
  To change this template use File | Settings | File Templates.
--%>
<link rel="stylesheet" href="../../bootstrap/bootstrap4/css/bootstrap.css">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
        <form action="/employee?action=create" method="post">
            <%--            <input type="hidden" name="action" value="create">--%>
            <div class="form-group ">
                <label >Name</label>
                <td><input type="text" class="form-control" id="employeeName" aria-describedby="employeeName" name="employeeName" value="${employee.employeeName}">
                    <c:if test="${messName != null}">
                        <small id="employeeName" class="form-text text-danger">${messName}</small>
                    </c:if>
                </td>
            </div>
            <div class="form-group">
                <label >Birthday</label>
                <td><input type="text" class="form-control" id="employeeBirthday" aria-describedby="employeeBirthday" name="employeeBirthday" value="${employee.employeeBirthday}">
                    <c:if test="${messBirthday != null}">
                        <small id="employeeBirthday" class="form-text text-danger">${messBirthday}</small>
                    </c:if>
                </td>
            </div>
                <div class="form-group col-md-12">
                    <label >ID Card</label>
                    <td><input type="text" class="form-control" id="employeeIdCard" aria-describedby="employeeIdCard" name="employeeIdCard" value="${employee.employeeIdCard}">
                        <c:if test="${messIdCard != null}">
                            <small id="employeeIdCard" class="form-text text-danger">${messIdCard}</small>
                        </c:if>
                    </td>
                </div>
                <div class="form-group col-md-12">
                    <label >Salary</label>
                    <td><input type="text" class="form-control" id="employeeSalary" aria-describedby="employeeSalary" name="employeeSalary" value="${employee.employeeSalary}">
                        <c:if test="${messSalary != null}">
                            <small id="employeeSalary" class="form-text text-danger">${messSalary}</small>
                        </c:if>
                    </td>
                </div>
                <div class="form-group col-md-12">
                    <label >Phone</label>
                    <td><input type="text" class="form-control" id="employeePhone" aria-describedby="employeePhone" name="employeePhone" value="${employee.employeePhone}">
                        <c:if test="${messPhone != null}">
                            <small id="employeePhone" class="form-text text-danger">${messPhone}</small>
                        </c:if>
                    </td>
                </div>
                <div class="form-group col-md-12">
                    <label >Email</label>
                    <td><input type="text" class="form-control" id="employeeEmail" aria-describedby="employeeEmail" name="employeeEmail" value="${employee.employeeEmail}">
                        <c:if test="${messEmail != null}">
                            <small id="employeeEmail" class="form-text text-danger">${messEmail}</small>
                        </c:if>
                    </td>
                </div>
            <div class="form-group col-md-12">
                <label >Address</label>
                <input class="form-control" name="employeeAddress">
            </div>

            <div class="form-group">
                <label >Position ID</label>
                <select name="positionId">
                    <option value="1">Nhan Vien</option>
                    <option value="2">Lao Cong</option>
                </select>
<%--                <input class="form-control" name="positionId" value="${employee.positionId}">--%>
            </div>
                <div class="form-group">
                    <label >Education Degree ID</label>
                    <select name="educationDegreeId">
                        <option value="1">Dai Hoc</option>
                        <option value="2">Cao Dang</option>
                    </select>
<%--                    <input class="form-control" name="educationDegreeId" value="${employee.educationDegreeId}">--%>
                </div>
                <div class="form-group">
                    <label >DivisionId</label>
                    <select name="divisionId">
                        <option value="1">Lễ Tân</option>
                        <option value="2">Quản Lý</option>
                        <option value="3">Kinh Doanh</option>
                        <option value="4">Quản Trị</option>
                    </select>
<%--                    <input class="form-control" name="divisionId" value="${employee.divisionId}">--%>
                </div>
                <div class="form-group">
                    <label >User Name</label>
                    <input class="form-control" name="username" value="${employee.username}">
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
