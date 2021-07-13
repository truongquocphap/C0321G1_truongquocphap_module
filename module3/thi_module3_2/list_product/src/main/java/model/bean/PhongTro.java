package model.bean;

public class PhongTro {
    private int id;
    private String tenNguoiThue;

    private String soDienThoai;
    private String ngayBatDau;
    private int idHinhThuc;
    private String HinhThuc;
    private String ghiChu;

    public PhongTro(int id, String tenNguoiThue, String soDienThoai, String ngayBatDau, int idHinhThuc, String hinhThuc,String ghiChu) {
        this.id = id;
        this.tenNguoiThue = tenNguoiThue;
        this.soDienThoai = soDienThoai;
        this.ngayBatDau = ngayBatDau;
        this.idHinhThuc = idHinhThuc;
        HinhThuc = hinhThuc;
        this.ghiChu=ghiChu;
    }

    public PhongTro() {
    }

    public PhongTro(String tenNguoiThue, String soDienThoai, String ngayBatDau, int idHinhThuc, String hinhThuc,String ghiChu) {
        this.tenNguoiThue = tenNguoiThue;
        this.soDienThoai = soDienThoai;
        this.ngayBatDau = ngayBatDau;
        this.idHinhThuc = idHinhThuc;
        HinhThuc = hinhThuc;
        this.ghiChu=ghiChu;
    }



    public PhongTro(int id, String tenNguoiThue, String soDienThoai, String ngayBatDau, int idHinhThuc, String ghiChu) {
        this.id = id;
        this.tenNguoiThue = tenNguoiThue;
        this.soDienThoai = soDienThoai;
        this.ngayBatDau = ngayBatDau;
        this.idHinhThuc = idHinhThuc;
        this.ghiChu=ghiChu;
    }

    public PhongTro(String tenNguoiThue, String soDienThoai, String ngayBatDau, int idHinhThuc, String ghiChu) {
        this.tenNguoiThue = tenNguoiThue;
        this.soDienThoai = soDienThoai;
        this.ngayBatDau = ngayBatDau;
        this.idHinhThuc = idHinhThuc;
        this.ghiChu=ghiChu;

    }

    public String getGhiChu() {
        return ghiChu;
    }

    public void setGhiChu(String ghiChu) {
        this.ghiChu = ghiChu;
    }
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTenNguoiThue() {
        return tenNguoiThue;
    }

    public void setTenNguoiThue(String tenNguoiThue) {
        this.tenNguoiThue = tenNguoiThue;
    }

    public String getSoDienThoai() {
        return soDienThoai;
    }

    public void setSoDienThoai(String soDienThoai) {
        this.soDienThoai = soDienThoai;
    }

    public String getNgayBatDau() {
        return ngayBatDau;
    }

    public void setNgayBatDau(String ngayBatDau) {
        this.ngayBatDau = ngayBatDau;
    }

    public int getIdHinhThuc() {
        return idHinhThuc;
    }

    public void setIdHinhThuc(int idHinhThuc) {
        this.idHinhThuc = idHinhThuc;
    }

    public String getHinhThuc() {
        return HinhThuc;
    }

    public void setHinhThuc(String hinhThuc) {
        HinhThuc = hinhThuc;
    }
}
