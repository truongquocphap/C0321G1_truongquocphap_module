<%--
  Created by IntelliJ IDEA.
  User: truongquocphap
  Date: 7/15/21
  Time: 11:11 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>$Title$</title>
  </head>
  <body>
  <h1>Sandwich Condiments</h1>
  <form action="/save" method="get">
  <input type="checkbox" name="condiments" value="Lettuce"> <span>Lettuce</span>
  <input type="checkbox" name="condiments" value="Tomato"> <span>Tomato</span>
  <input type="checkbox" name="condiments" value="Mustard"> <span>Mustard</span>
  <input type="checkbox" name="condiments" value="Sprouts"> <span>Sprouts</span>
  <input type="hidden" name="condiments" value="">
    <input type="submit" value="Save">
  </form>
  <h1>Selected Sandwich Condiments</h1>
<c:forEach items="${condiment}" var="condiments">
<h5>${condiments}</h5>
</c:forEach>
  
  </body>
</html>
