<%@ page import="Dao.UserDao" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: LittleOne
  Date: 2020/5/21
  Time: 16:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
username=<%=request.getParameter("username")%>
password=<%=request.getParameter("password")%>
<%
    String username=request.getParameter("username");
    String password=request.getParameter("password");
    if(UserDao.login(username,password))
    {
        out.println("welcome "+username);
        session.setAttribute("name",username);
        response.sendRedirect("index.jsp");
    }
    else
    {
        out.println("登陆失败");
        response.sendRedirect("login.html");
    }
%>
</body>
</html>
