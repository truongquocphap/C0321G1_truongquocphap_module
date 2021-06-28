<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.lang.*" %>
  Created by IntelliJ IDEA.
  User: truongquocphap
  Date: 6/27/21
  Time: 9:13 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Simple Dictionary</title>
</head>
<body>
<%!
    Map<String,String> dic=new HashMap<>();
%>
<%
    dic.put("hello","Xin chào");
    dic.put("how","Thế nào");
    dic.put("book","quyển vở");
    dic.put("computer","Máy tính");
    dic.put("forever","mãi mãi");
    String search=request.getParameter("search");
    String result=dic.get(search);
    if (result!=null){
        out.println("Word: " + search);
        out.println("Result: " + result);
    }
%>
</body>
</html>
