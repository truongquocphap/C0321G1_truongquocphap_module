<%--
  Created by IntelliJ IDEA.
  User: truongquocphap
  Date: 6/29/21
  Time: 3:30 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>$Title$</title>
  </head>
  <body>
  <c:if test="${empty product}">
    <h3>Product List empty!</h3>
  </c:if>
  <c:if test="${not empty product}">
    <table style="border: 2px solid magenta">
      <tr>
        <td>ID</td>
        <td>Name</td>
        <td>CodeProduct</td>
        <td>producer</td>
        <td>Edit</td>
        <td>Delete</td>
      </tr>
      <:c:forEach items="${product}" var="products">
        <tr>
          <td>${products.id}</td>
          <td>${products.name}</td>
          <td>${products.codeProduct}</td>
          <td>${products.producer}</td>
          <td><input type="button" value="Edit"></td>
          <td><input type="button" value="Delete"></td>
        </tr>
      </:c:forEach>
    </table>
  </c:if>
  </body>
</html>
