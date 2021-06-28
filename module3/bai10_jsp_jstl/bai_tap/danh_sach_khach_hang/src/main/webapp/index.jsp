<%--
  Created by IntelliJ IDEA.
  User: truongquocphap
  Date: 6/27/21
  Time: 10:32 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>$Title$</title>
  </head>
  <style>
    table th{
      border: 1px solid rebeccapurple;
    }
  </style>
  <body>
  <table>
    <tr>
      <th>Họ tên | </th>
      <th>Ngày Tháng năm sinh | </th>
      <th>Địa chỉ | </th>
      <th>Hình ảnh</th>
    </tr>
    <c:forEach  items="${customer}" var="customers">

    <tr >
      <td>${customers.name}</td>
      <td>${customers.birthday}</td>
      <td>${customers.address}</td>
      <td> <img style="width: 50px; height: 50px" src="${customers.img}"> </td>
    </tr>
    </c:forEach>
  </table>
  </body>
</html>
