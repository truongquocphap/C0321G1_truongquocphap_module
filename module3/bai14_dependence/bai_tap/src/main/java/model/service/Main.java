package model.service;

import model.bean.PhuongTrinhBat2;

import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        TinhToan tinhToan=new TinhToan();
        Scanner scanner = new Scanner(System.in);
        System.out.println("nhap vao gia tri a: ");
        double a = Integer.parseInt(scanner.nextLine());
        System.out.println("nhap vao gia tri b: ");
        double b = Integer.parseInt(scanner.nextLine());
        System.out.println("nhap vao gia tri c: ");
        double c = Integer.parseInt(scanner.nextLine());
        PhuongTrinhBat2 phuongTrinhBat2 = new PhuongTrinhBat2(a, b, c);
        tinhToan.giaiPT();

    }
}
