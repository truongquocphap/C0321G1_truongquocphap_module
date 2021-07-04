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
    <input type="hidden" name="action" value="create">
    <tabel>
        <tr>
            <td>Name: </td>
            <td><input type="text" name="name"></td>
        </tr>
        <tr>
            <td>email:</td>
            <td><input type="text" name="email"></td>
        </tr>
        <tr>
            <td>country:</td>
            <td><input type="text" name="country"></td>
        </tr>
        <tr>
            <td></td>
            <td><input type="submit" value="Create"></td>
        </tr>
    </tabel>
</form>
</body>
</html>
