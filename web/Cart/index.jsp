<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script language="javascript"></script>
<html>
<head>
  <title>商城</title>
    <style>
        body{
            background-color: #faf5e3;
        }
        table
        {
            border:2px solid #ff9000;
        }
        .num_add,.num_dec
        {
            display: inline-block;
            width: 28px;
            height: 28px;
            line-height: 28px;
            text-align: center;
            font-size: 18px;
            background: #ff9000;
            cursor: pointer;
            border: 1px solid #e6e6e6;
        }
        input{
            width: 50px;
        }
        span{
            user-select: none;
        }

    </style>
</head>
<body>
<div align="left">
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
  <h1 style="color: #ff9000">SUPERMARKET</h1>
  <p>请选购商品并填写所需要购买的数量</p>
  <form action="order.jsp" method="post">
    <table cellpadding="0" border="1" align="center">
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
        <td><img src="../images/apple.jpg" height="100" width="100"/>苹果</td>
        <td>￥5.0</td>
          <td> <span id="num_jian1" class="num_dec">-</span>
        <input type="text" name="apple" id="input_num1" value="0">
            <span id="num_jia1" class="num_add">+</span></td>
      </tr>
      <tr>
        <td>2</td>
        <td><img src="../images/orange.jpg" height="100" width="100"/>橘子</td>
        <td>￥3.0</td>
          <td><span id="num_jian2" class="num_dec">-</span>
       <input type="text" name="orange" id="input_num2" value="0">
          <span id="num_jia2" class="num_add">+</span></td>
      </tr>
      <tr>
        <td>3</td>
        <td><img src="../images/banana.jpg" height="100" width="100"/>香蕉</td>
        <td>￥2.0</td>
          <td> <span id="num_jian3" class="num_dec">-</span>
        <input type="text" name="banana" id="input_num3" value="0">
          <span id="num_jia3" class="num_add">+</span></td>
      </tr>
      <tr>
        <td>4</td>
        <td><img src="../images/pomelo.jpg" height="100" width="100"/>柚子</td>
        <td>￥4.5</td>
        <td>
            <span id="num_jian4" class="num_dec">-</span>
            <input type="text" name="grapefruit" id="input_num4" value="0">
            <span id="num_jia4" class="num_add">+</span>
        </td>
      </tr>
      <tr>
        <td>5</td>
        <td><img src="../images/peach.jpg" height="100" width="100"/>桃子</td>
        <td>￥5.5</td>
          <td>
              <span id="num_jian5" class="num_dec">-</span>
              <input type="text" name="peach" id="input_num5" value="0">
              <span id="num_jia5" class="num_add">+</span>
          </td>
      </tr>
      </tbody>
    </table>
      <button type="submit" style="width: 100px"><b>提交订单</b></button>
      <button type="reset" style="width: 100px"><b>清空选择</b></button>
  </form>

</div>
<script>
    let num_add=new Array();
    let num_dec=new Array();
    let num_total=new Array();
    for(let i=1;i<6;i++) {
        let add="num_jia".concat(i.toString());
        let dec="num_jian".concat(i.toString());
        let total="input_num".concat(i.toString());
        num_add[i] = document.getElementById(add);
        num_dec[i] = document.getElementById(dec);
        num_total[i] = document.getElementById(total);
        num_add[i].onclick = function () {
            if (num_total[i].value <= 0 || num_total[i].value == NaN)
                num_total[i].value = 0;
            num_total[i].value = parseInt(num_total[i].value) + 1;
        }
        num_dec[i].onclick = function () {

            if (num_total[i].value <= 0 || num_total[i].value == NaN) {
                num_total[i].value = 0;
            } else {

                num_total[i].value = parseInt(num_total[i].value) - 1;
            }
        }
    }
</script>
</body>
</html>