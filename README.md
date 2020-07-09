# 购物车系统的设计

学号：2701170227                    姓名：张利峰

## 1、项目准备

- Git建仓库
- 项目同步
- 整体框架

## 2、解决方案

##### 连接本地数据库：

```java
package Dao;

import java.sql.*;
import java.security.MessageDigest;
public class UserDao2 {
    final static String url = "jdbc:mysql://localhost:3306/ahstu";
    static Connection con = null;
    static Statement stmt = null;
    static final String USER = "root";
    static final String PASS = "123456";
    static {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(url,USER,PASS);
            stmt = con.createStatement();
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
    public static void main(String[] args) {
    }
```

##### 数据库实现增查及MD5加密：

```java
 public final static String MD5(String s) {
        char hexDigits[] = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
                'A', 'B', 'C', 'D', 'E', 'F' };
        try {
            byte[] btInput = s.getBytes();
            // 获得MD5摘要算法的 MessageDigest 对象
            MessageDigest mdInst = MessageDigest.getInstance("MD5");
            // 使用指定的字节更新摘要
            mdInst.update(btInput);
            // 获得密文
            byte[] md = mdInst.digest();
            // 把密文转换成十六进制的字符串形式
            int j = md.length;
            char str[] = new char[j * 2];
            int k = 0;
            for (int i = 0; i < j; i++) {
                byte byte0 = md[i];
                str[k++] = hexDigits[byte0 >>> 4 & 0xf];
                str[k++] = hexDigits[byte0 & 0xf];
            }
            return new String(str);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }


    public static boolean updatePassword(String name, String pass1, String pass2) {
        if (!login(name, pass1)) {
            System.err.println("初始密码错误");
            return false;
        }
        String sql = "update users set password='" + MD5(pass2) + "' where user_id='" + name + "'";

        boolean result = executeUpdate(sql);
        if (result) {
            System.err.println("修改密码成功");
        } else {
            System.err.println("修改密码失败");
        }
        return result;
    }

    public static boolean login(String name, String pass) {
        String sql = "select 1 from users where user_id='" + name + "' and password='" + MD5(pass) + "' LIMIT 1";
        String sql2 = String.format("select 1 from users where user_id='%s' and password='%s' LIMIT 1", name, MD5(pass));//

        System.err.println(sql);
        System.err.println(sql2);
        boolean result = executeQuery(sql);
        if (result) {
            System.err.println("登录成功,user=" + name + ",pass=" + pass);
        } else {
            System.err.println("登录失败,user=" + name + ",pass=" + pass);
        }
        return result;
    }
   public static boolean executeQuery(String sql) {
        try {
            ResultSet rs = stmt.executeQuery(sql);
            return rs.next();
        } catch (SQLException e) {
            return false;
        }

    }

    public static boolean register(String name, String pass) {
        String sql = "select 1 from users where user_id='" + name + "'";
        if (executeQuery(sql)) {
            System.err.println("用户名已经存在,name=" + name);
            return false;
        }
        sql = "insert into users(user_id,password) VALUE('" + name + "','" + MD5(pass) + "')";
        System.err.println(sql);
        boolean result = executeUpdate(sql);
        if (result) {
            System.err.println("注册成功,user=" + name + ",pass=" + pass);
        } else {
            System.err.println("注册失败,user=" + name + ",pass=" + pass);
        }
        return result;
    }

    public static boolean executeUpdate(String sql) {
        try {
            int affectedRows = stmt.executeUpdate(sql);
            return affectedRows > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
```

##### JavaBean实现价格计算：

```java
package Dao;

public class TotalPrice {
    private double num_apple;
    private double num_orange;
    private double num_banana;
    private double num_grapefruit;
    private double num_peach;
    private double pri_apple;
    private double pri_orange;
    private double pri_banana;
    private double pri_grapefruit;
    private double pri_peach;
    private double total_price;

    public double getNum_apple() {
        return num_apple;
    }

    public void setNum_apple(double num_apple) {
        this.num_apple = num_apple;
        this.setPri_apple(num_apple * 5.0);
    }

    public double getNum_orange() {
        return num_orange;
    }

    public void setNum_orange(double num_orange) {
        this.num_orange = num_orange;
        this.setPri_orange(num_orange * 3.0);
    }
    public double getNum_banana() {
        return num_banana;

    }

    public void setNum_banana(double num_banana) {
        this.num_banana = num_banana;
        this.setPri_banana(num_banana * 2.0);
    }

    public double getNum_grapefruit() {
        return num_grapefruit;
    }

    public void setNum_grapefruit(double num_grapefruit) {
        this.num_grapefruit = num_grapefruit;
        this.setPri_grapefruit(num_grapefruit * 4.5);
    }

    public double getNum_peach() {
        return num_peach;
    }

    public void setNum_peach(double num_peach) {
        this.num_peach = num_peach;
        this.setPri_peach(num_peach * 5.5);
    }

    public double getPri_apple() {
        return pri_apple;
    }

    public void setPri_apple(double pri_apple) {
        this.pri_apple = pri_apple;
    }

    public double getPri_orange() {
        return pri_orange;
    }

    public void setPri_orange(double pri_orange) {
        this.pri_orange = pri_orange;
    }

    public double getPri_banana() {
        return pri_banana;
    }

    public void setPri_banana(double pri_banana) {
        this.pri_banana = pri_banana;
    }

    public double getPri_grapefruit() {
        return pri_grapefruit;
    }

    public void setPri_grapefruit(double pri_grapefruit) {
        this.pri_grapefruit = pri_grapefruit;
    }

    public double getPri_peach() {
        return pri_peach;
    }

    public void setPri_peach(double pri_peach) {
        this.pri_peach = pri_peach;
    }

    public double getTotal_price() {
        this.total_price = this.getPri_apple() + this.getPri_banana()
                + this.getPri_grapefruit() + this.getPri_grapefruit()
                + this.getPri_orange() + this.getPri_peach();
        return total_price;
    }
}

```

##### 使用JS实现商城加减号加减商品功能：

```javascript
<script>
    let num_add=new Array();
    let num_dec=new Array();
    let num_total=new Array();
    for(let i=1;i<6;i++){
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
```

##### 登陆界面按钮样式设计：

```css
<style>
        body
        {
            background-color: #faf5e3;
            background-image:url('../images/loginbackground.jpg');
            width: 300px;
            height: 400px;
            background-repeat:no-repeat;
            background-position:left top;
            background-attachment:fixed;
        }
        .write
        {
            position:fixed;
            right:250px;
            top:40%;
        }
        .fm-button {
            background-color: #ff9000;
            background-image: -webkit-gradient(linear,left top,right top,from(#ff9000),to(#ff9000));
            background-image: linear-gradient(90deg,#ff9000,#ff9000);
            border: 1px solid #ff9000;
            border-radius: 3px;
            font-size: 20px;
            height: 42px;
            line-height: 42px;
            outline: none;
            color: #fff;
            width: 20%;
            cursor: pointer;
            position:fixed;
        }
        .fm-name {
            background-color: #faf5e3;
            background-image: -webkit-gradient(linear,left top,right top,from(#faf5e3),to(#faf5e3));
            background-image: linear-gradient(90deg,#faf5e3,#faf5e3);
            border: 1px solid #faf5e3;
            border-radius: 3px;
            font-size: 20px;
            height: 42px;
            line-height: 42px;
            outline: none;
            color: #000;
            width: 20%;
            cursor: pointer;
            position:fixed;
        }
    </style>
```

##### 调用JavaBean实现查询购物车购买的数量：

```jsp
<body>

<jsp:useBean id="car" scope="page" class="Dao.TotalPrice">
    <jsp:setProperty name="car" property="num_apple" param="apple"/>
    <jsp:setProperty name="car" property="num_orange" param="orange"/>
    <jsp:setProperty name="car" property="num_banana" param="banana"/>
    <jsp:setProperty name="car" property="num_grapefruit" param="grapefruit"/>
    <jsp:setProperty name="car" property="num_peach" param="peach"/>
    <h1 align="center" style="color: #ff9000">购 物 车</h1>
    <p align="center">您选购的订单详情如下:</p>
    <table cellpadding="0" border="1" align="center">
        <thead>
        <tr><th>编号</th><th>商品名</th><th>单价/Kg</th><th>购买数量</th><th>价格</th></tr>
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
    <div >总价为：💴￥<jsp:getProperty  name="car" property="total_price"/></div>
        <a href="pay.html"><button><b>立即支付</b></button></a>
    <a href="index.jsp"><button><b>取消订单</b></button></a>
    </div>
</jsp:useBean>
</body>
```

## 3、总结

1. Tomcat、Mysql、Git应用技术
2. Java核心技术
3. Jsp开发基础  
4. Web前端优化（html、css、js）