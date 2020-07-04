package Dao;
public class Round {//计算机圆的面积
    public static double round(double r)
    {
        double area=r*r*Math.PI;
        return area;
    }
    public static void main(String[] args) {
        double r=2;
        System.out.println(String.format("%.2f",round(r)));
    }
}