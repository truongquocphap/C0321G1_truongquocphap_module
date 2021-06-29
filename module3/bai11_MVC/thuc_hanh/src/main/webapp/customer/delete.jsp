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
    <title>Title</title>
</head>
<body>
<h1>Delete customer</h1>
<p>
    <a href="/customers">Back to customer list</a>
</p>
<form method="post" action="/customers?action=delete">
    <h3>Are you sure?</h3>
    <fieldset>
        <legend>Customer information</legend>
        <table>
            <tr>
                <td>Nhap id muon xoa: </td>
                <td><input type="text" name="id"></td>
            </tr>

            <tr>
                <td><input type="submit" value="Delete customer"></td>
                <td><a href="/customers">Back to customer list</a></td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>
