<%--
  Created by IntelliJ IDEA.
  User: truongquocphap
  Date: 6/30/21
  Time: 11:11 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        td{
            border: 2px;
            width: 50px;
            height: 50px;
            background-color: bisque;
        }
    </style>
</head>
<body>
<h1>Create Product</h1>
<form action="/list" method="post">
    <input type="hidden" name="action" value="create">
    <tabel>
        <tr>
            <td>ID:</td>
            <td><input type="number" name="id"></td>
        </tr>
        <tr>
            <td>Name: </td>
            <td><input type="text" name="name"></td>
        </tr>
        <tr>
            <td>Code Product:</td>
            <td><input type="text" name="code_product"></td>
        </tr>
        <tr>
            <td>Producer:</td>
            <td><input type="text" name="producer"></td>
        </tr>
        <tr>
            <td></td>
            <td><input type="submit" value="Create"></td>
        </tr>
    </tabel>
</form>
</body>
</html>
