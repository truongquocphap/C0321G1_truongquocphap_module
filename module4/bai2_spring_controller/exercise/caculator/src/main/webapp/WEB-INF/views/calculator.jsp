<%--
  Created by IntelliJ IDEA.
  User: truongquocphap
  Date: 7/15/21
  Time: 4:15 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Calculator</title>
</head>
<body>
<h1>Calculator</h1>
<form action="calculator"  method="get">
    <span> </span><input type="text" name="number" style="width: 100px">
    <input type="text" name="number" style="width: 100px"><br>
    <input type="text" id="calculate" name="operator" style="width: 100px"><br>
    <input type="button" onclick="opera('+')" value="+" style="width: 50px">
    <input type="button" onclick="opera('-')" value="-" style="width: 50px">
    <input type="button" onclick="opera('*')" value="*" style="width: 50px">
    <input type="button" onclick="opera('/')" value="/" style="width: 50px">
    <input type="submit" value="Result"><br>
</form>
<h3>Result Division : ${result}</h3>
<script>
    function opera(opera) {
        document.getElementById("calculate").value=opera;
    }
</script>
</body>
</html>
