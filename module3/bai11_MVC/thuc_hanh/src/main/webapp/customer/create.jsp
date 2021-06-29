<%--
  Created by IntelliJ IDEA.
  User: truongquocphap
  Date: 6/28/21
  Time: 3:19 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<style>
.message{
    color: rebeccapurple;
}
</style>
<h1>Create view customer</h1>
<p>
    <c:if test="${message!=null}">
        <span class="message">${message}</span>
    </c:if>
</p>
<p>
    <a href="/customers"> Back to customer list</a>
</p>
<form method="post" action="/customers?action=create">
    <fieldset>
        <legend>Customer information</legend>
        <table>
            <tr>
                <td>Name: </td>
                <td><input type="text" name="name"></td>
            </tr>
            <tr>
                <td>Email: </td>
                <td><input type="text" name="email"></td>
            </tr>
            <tr>
                <td>Address: </td>
                <td><input type="text" name="address"></td>
            </tr>
            <tr>
                <td> </td>
                <td><input type="submit"  value="Create customer"></td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>
