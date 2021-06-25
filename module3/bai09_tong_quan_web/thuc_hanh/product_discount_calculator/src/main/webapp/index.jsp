<%--
  Created by IntelliJ IDEA.
  User: truongquocphap
  Date: 6/25/21
  Time: 10:43 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>$Title$</title>
  </head>
  <body>
  <form  action="/tinh-toan?action=discount"method="post">
    <h3>Product Description</h3><br>
    <input type="text" name="p-description" placeholder="Product Description">
    <h3>List price</h3>
    <input type="text" name="price" placeholder="List Price">
    <h3>Discount Percent</h3>
    <input type="text" name="percent" placeholder="Discount Percent">
    <input type="submit" id="submit" value="Calculade Discount">
  </form>
  </body>
</html>
