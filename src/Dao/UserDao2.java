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
        System.out.println(login("admin","admin"));
    }
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

}
