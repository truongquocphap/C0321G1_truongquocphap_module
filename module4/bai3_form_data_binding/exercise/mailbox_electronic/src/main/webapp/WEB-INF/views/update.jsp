<%--
  Created by IntelliJ IDEA.
  User: truongquocphap
  Date: 7/16/21
  Time: 3:00 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Main Box </title>
</head>
<body>
<form:form action="update" method="post" modelAttribute="mailBox">
    <fieldset>
        <legend>Update Mail Box</legend>
        <table>
            <tr>
                <td><form:label path="languages">Languages: </form:label></td>
                <td><form:select path="languages" items="${language}"/></td>
            </tr>
            <tr>
                <td><form:label path="pageSize">Page Size: </form:label></td>
                <td><form:select path="pageSize" items="${pageSize}"/></td>
            </tr>
            <tr>
                <td><form:label path="spamsFilter">Spams Filter: </form:label></td>
                <td><form:checkbox path="spamsFilter"/><span>Enable spams filter</span></td>
            </tr>
            <tr>
                <td><form:label path="signature">Signature: </form:label></td>
                <td><form:textarea path="signature"/></td>
            </tr>
            <tr>
                <td><input type="submit" value="Update"></td>
                <td><input type="reset" value="Cancel"></td>
            </tr>
        </table>

    </fieldset>
</form:form>
</body>
</html>
