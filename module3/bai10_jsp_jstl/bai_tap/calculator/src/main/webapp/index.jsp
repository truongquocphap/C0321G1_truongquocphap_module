<%--
  Created by IntelliJ IDEA.
  User: truongquocphap
  Date: 6/28/21
  Time: 10:48 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>$Title$</title>
  </head>
  <body>
  <h2>Simple Calculator</h2>
 <fieldset>
     <legend>Calculator</legend>
    <form action="/calculator" method="get">
      <span>First operand: </span>
      <input type="text" style="width: 100px" name="first"><br>
      <span>Operator: </span>
    <select name="operand">
      <option value="-">-</option>
      <option value="*">*</option>
      <option value="/">/</option>
      <option value="+">+</option>
    </select>
      <br>
      <span>Second operand:</span>
      <input type="text" name="second"><br>
      <input type="submit" name="submit">
    </form>
 </fieldset>
  </body>
</html>
