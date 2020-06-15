<%--
  Created by IntelliJ IDEA.
  User: LittleOne
  Date: 2020/6/15
  Time: 21:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="Dao.Round" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div align="middle">
        <%
    double radius= Double.parseDouble(request.getParameter("radius"));
    out.print(String.format("面积等于 %.2f",Round.round(radius)));
%>
    <a href="round.html">再试一次！</a>
</body>
</html>
