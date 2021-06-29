<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: truongquocphap
  Date: 6/28/21
  Time: 3:20 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Customer List</title>
</head>
<body>
<h1>Customer</h1>
<p>
    <a href="/customer/create.jsp"> Create new Customer</a>
</p>
<table border="1px">
    <tr>
        <td>Id</td>
        <td>Name</td>
        <td>Email</td>
        <td>Address</td>
        <td>Edit</td>
        <td>Delete</td>
    </tr>
    <c:forEach items='${customers}' var="customer">

    <tr>
        <td>${customer.id}</td>
        <td><a href="/customer?action=view&id=${customer.id}">${customer.name}</a> </td>
        <td>${customer.email}</td>
        <td>${customer.address}</td>
        <td><a href="/customer/edit.jsp">Edit</a></td>
        <td><a href="/customer/delete.jsp">Delete</a></td>
    </tr>
    </c:forEach>
</table>
</body>
</html>
