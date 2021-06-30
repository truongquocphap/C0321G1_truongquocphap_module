<%--
  Created by IntelliJ IDEA.
  User: truongquocphap
  Date: 6/30/21
  Time: 11:39 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit Product</title>
</head>
<body>
<h1>Create Product</h1>
<form action="/products?action=edit" method="post">
    <input type="hidden" name="action" value="Edit">
    <tabel>
        <input type="hidden"  name="id" value="${products.id}">
        <tr>
            <td>Name: </td>
            <td><input type="text" name="name" value="${products.name}"></td>
        </tr>
        <tr>
            <td>Code Product:</td>
            <td><input type="text" name="code_product" value="${products.codeProduct}"></td>
        </tr>
        <tr>
            <td>Producer:</td>
            <td><input type="text" name="producer" value="${products.producer}"></td>
        </tr>
        <tr>
            <td></td>
            <td><input type="submit" value="Edit"></td>
        </tr>
    </tabel>
</form>
</body>
</html>
