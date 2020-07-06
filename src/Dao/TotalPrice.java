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
