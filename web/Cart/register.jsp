<%@ page import="Dao.UserDao2" %><%--
  Created by IntelliJ IDEA.
  User: LittleOne
  Date: 2020/5/29
  Time: 11:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <%
        String name=request.getParameter("username");
        String pass=request.getParameter("password");
        String pass1=request.getParameter("password1");
        if(pass.equals(pass1)&& UserDao2.register(name,pass)){
            out.println("注册成功！");

            out.println("<a href='login.html'>请登录</a>");
        }
        else{
            out.print("<script>alert('注册失败！请重新注册！'); window.location='register.html' </script>");
        }
    %>
</body>
</html>
