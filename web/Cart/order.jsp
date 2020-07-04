<%--
  Created by IntelliJ IDEA.
  User: LittleOne
  Date: 2020/6/22
  Time: 16:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="Dao.CountPrice" %>
<html>
<head>
    <title>Title</title>
    <style>
        body
        {
            background-color: #faf5e3;
        }
        table
        {
            border: #ff9000;
            width: 300px;
            height: 400px;
        }

    </style>
</head>
<body>
<jsp:useBean id="car" scope="page" class="Dao.CountPrice">
    <jsp:setProperty name="car" property="num_apple" param="apple"/>
    <jsp:setProperty name="car" property="num_orange" param="orange"/>
    <jsp:setProperty name="car" property="num_banana" param="banana"/>
    <jsp:setProperty name="car" property="num_grapefruit" param="grapefruit"/>
    <jsp:setProperty name="car" property="num_peach" param="peach"/>
    尊敬的用户：<%=
    session.getAttribute("name")
    %>;
    <%
        if (session.getAttribute("name") != null) {
            out.println("<a href='logout.jsp'>注销</a>");
        } else {
            out.println("<a href='login.html'>请登录</a>");
        }
    %>
    <p align="center">您选购的订单详情如下:</p>
    <table cellpadding="0" border="1" align="center">
        <thead>
        <tr><th>编号</th><th>商品名</th><th>单价</th><th>购买数量</th><th>价格</th></tr>
        </thead>
        <tbody>
        <tr>
            <td>1</td>
            <td>苹果</td>
            <td>￥5.0</td>
            <td><jsp:getProperty name = "car" property="num_apple" /></td>
            <td><jsp:getProperty name = "car" property="pri_apple" /></td>
        </tr>
        <tr>
            <td>2</td>
            <td>橘子</td>
            <td>￥3.0</td>
            <td><jsp:getProperty name = "car" property="num_orange" /></td>
            <td><jsp:getProperty name = "car" property="pri_orange" /></td>
        </tr>
        <tr>
            <td>3</td>
            <td>香蕉</td>
            <td>￥2.0</td>
            <td><jsp:getProperty name = "car" property="num_banana" /></td>
            <td><jsp:getProperty name = "car" property="pri_banana" /></td>
        </tr>
        <tr>
            <td>4</td>
            <td>柚子</td>
            <td>￥4.5</td>
            <td><jsp:getProperty name = "car" property="num_grapefruit" /></td>
            <td><jsp:getProperty name = "car" property="pri_grapefruit" /></td>
        </tr>
        <tr>
            <td>5</td>
            <td>桃子</td>
            <td>￥5.5</td>
            <td><jsp:getProperty name = "car" property="num_peach" /></td>
            <td><jsp:getProperty name = "car" property="pri_peach" /></td>
        </tr>
        </tbody>
    </table>
    <div align="center">
    <div >总价为：<jsp:getProperty  name="car" property="total_price"/></div>
        <a href="pay.html"><button>立即支付</button></a>
    <a href="index.jsp"><button>取消订单</button></a>
    </div>
</jsp:useBean>
</body>
</html>
