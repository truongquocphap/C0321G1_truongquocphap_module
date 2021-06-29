<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: truongquocphap
  Date: 6/28/21
  Time: 3:19 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit customer</title>
</head>
<body>
<h1>Edit Customer</h1>
<p>
    <c:if test="${message!=null}">
        <span class="message">${message}</span>
    </c:if>
</p>
<p>
    <a href="/customers"></a>
</p>
<form action="/customers?action=edit" method="post">
    <fieldset>
        <legend>Customer Information</legend>
        <table>
            <tr>
                <td>Id:</td>
                <td><input type="text" name="id"></td>
            </tr>
            <tr>
                <td>Name:</td>
                <td><input type="text" name="name"></td>
            </tr>
            <tr>
                <td>Email:</td>
                <td><input type="text" name="email"></td>
            </tr>
            <tr>
                <td>Address:</td>
                <td><input type="text" name="address"></td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" value="Update Customer"></td>
            </tr>
        </table>
    </fieldset>
</form>
<p>
    <a href="/customers"> Back to customer list</a>
</p>
</body>
</html>
