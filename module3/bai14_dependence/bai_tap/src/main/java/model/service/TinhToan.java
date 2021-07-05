package model.service;

import model.bean.PhuongTrinhBat2;

public class TinhToan {
    PhuongTrinhBat2 phuongTrinhBat2=new PhuongTrinhBat2();
    public double kiemTraNghiem() {
        return (phuongTrinhBat2.getB() * phuongTrinhBat2.getB()) - (4 * phuongTrinhBat2.getA() * phuongTrinhBat2.getC());
    }

    public double nghiemKep() {
        return -phuongTrinhBat2.getB() / 2 * phuongTrinhBat2.getA();
    }

    public double nghiem1() {
        return (-phuongTrinhBat2.getB()) + Math.sqrt((phuongTrinhBat2.getB() * phuongTrinhBat2.getB()) - (4 * phuongTrinhBat2.getA() * phuongTrinhBat2.getC())) / 2 * phuongTrinhBat2.getA();
    }

    public double nghiem2() {
        return (-phuongTrinhBat2.getB()) - Math.sqrt((phuongTrinhBat2.getB() * phuongTrinhBat2.getB()) - (4 * phuongTrinhBat2.getA() * phuongTrinhBat2.getC())) / 2 * phuongTrinhBat2.getA();
    }

    public void giaiPT() {
        if (this.kiemTraNghiem() < 0) {
            System.out.println("phương trình vô nghiệm ");
        } else if (this.kiemTraNghiem() == 0) {
            System.out.println("phương trình bật 2 có nghiệm kép :" + this.nghiemKep());

        } else {
            System.out.println("phương trình có 2 nghiệm: \n" +
                    "nghiệm thứ nhất :" + this.nghiem1() +
                    "\n nghiệm thứ hai :" + this.nghiem2());
        }

    }
}
