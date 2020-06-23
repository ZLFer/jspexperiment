<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script language="javascript"></script>
<html>
<head>
  <title>商城</title>
</head>
<body>
<div align="right">
  当前登录用户<%=session.getAttribute("name")%>;
  <%
    if (session.getAttribute("name") != null) {
      out.println("<a href='logout.jsp'>注销</a>");
    } else {
      out.println("<a href='login.html'>请登录</a>");
    }
  %>
</div>

<div align="center">
  <h1>SUPERMARKET</h1>
  <p>请选购商品并填写所需要购买的数量</p>
  <form action="order.jsp" method="post">
    <table style="border:1px solid green;" cellpadding="0" border="1" align="center">
      <thead>
      <tr>
        <th>编号</th>
        <th>商品名</th>
        <th>单价</th>
        <th>购买数量</th>
      </tr>
      </thead>
      <tbody>
      <tr>
        <td>1</td>
        <td><img src="${pageContext.request.contextPath}/images/apple.jpg" height="100" width="100"/>苹果</td>
        <td>￥5.0</td>
        <td><input type="text" name="apple" id="1" placeholder="0"></td>
      </tr>
      <tr>
        <td>2</td>
        <td><img src="${pageContext.request.contextPath}/images/orange.jpg" height="100" width="100"/>橘子</td>
        <td>￥3.0</td>
        <td><input type="text" name="orange" id="2" placeholder="0"></td>
      </tr>
      <tr>
        <td>3</td>
        <td><img src="${pageContext.request.contextPath}/images/banana.jpg" height="100" width="100"/>香蕉</td>
        <td>￥2.0</td>
        <td><input type="text" name="banana" id="3" placeholder="0"></td>
      </tr>
      <tr>
        <td>4</td>
        <td><img src="${pageContext.request.contextPath}/images/pomelo.jpg" height="100" width="100"/>柚子</td>
        <td>￥4.5</td>
        <td><input type="text" name="grapefruit" id="4" placeholder="0"></td>
      </tr>
      <tr>
        <td>5</td>
        <td><img src="${pageContext.request.contextPath}/images/peach.jpg" height="100" width="100"/>桃子</td>
        <td>￥5.5</td>
        <td><input type="text" name="peach" id="5" placeholder="0"></td>
      </tr>
      </tbody>
    </table>
    <input type="submit" value="提交订单">
  </form>
</div>
</body>
</html>