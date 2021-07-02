<%--
  Created by IntelliJ IDEA.
  User: truongquocphap
  Date: 6/30/21
  Time: 10:41 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="/user" method="post">
    <input type="hidden" name="action" value="edit">
    <tabel>
        <input type="hidden" name="id" value="${user.id}">

        <tr>
            <td>Name: </td>
            <td><input type="text" name="name" placeholder="${user.name}"></td>
        </tr>
        <tr>
            <td>email:</td>
            <td><input type="text" name="email" placeholder="${user.email}"></td>
        </tr>
        <tr>
            <td>country:</td>
            <td><input type="text" name="country" placeholder="${user.country}"></td>
        </tr>
        <tr>
            <td></td>
            <td><input type="submit" value="Edit"></td>
        </tr>
    </tabel>
</form>
</body>
</html>
