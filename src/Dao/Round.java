package Dao;
import static java.lang.String.format;

public class Round {
    public static double round(double r)
    {
        double mianji=r*r*Math.PI;
        return mianji;
    }
    public static void main(String[] args) {
        double r=2;
        System.out.println(String.format("%.2f",round(r)));
    }
}