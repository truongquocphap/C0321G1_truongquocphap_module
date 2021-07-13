package model.repository;

import model.bean.PhongTro;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PhongTroRepositoryImlp implements PhongTroRepository {

    @Override
    public List<PhongTro> findAll() {
        List<PhongTro> phongTroList = new ArrayList<>();
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        if (connection != null) {
            try {
                statement = connection.prepareStatement("select * from phong_tro join hinh_thuc on phong_tro.id_hinh_thuc = hinh_thuc.id order by phong_tro.id");
                resultSet = statement.executeQuery();
                PhongTro phongTro = null;
                while (resultSet.next()) {
                    int id = resultSet.getInt("id");
                    String tenNguoiThue = resultSet.getString("ten_nguoi_thue");
                    String soDienThoai = resultSet.getString("so_dien_thoai");
                    String ngayBatDau = resultSet.getString("ngay_bat_dau");
                    int idHinhThuc = resultSet.getInt("id_hinh_thuc");
                    String ghiChu = resultSet.getString("ghi_chu");
              phongTro=new PhongTro(id,tenNguoiThue,soDienThoai,ngayBatDau,idHinhThuc,ghiChu);
                    phongTroList.add(phongTro);
                }
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
        return phongTroList;
    }

    @Override
    public void save(PhongTro phongTro) {
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = null;

        if (connection != null) {
            try {
                statement = connection.prepareStatement("insert into phong_tro(ten_nguoi_thue, so_dien_thoai, ngay_bat_dau, id_hinh_thuc,ghi_chu) values (?, ?, ?, ?, ?)");
                statement.setString(1, phongTro.getTenNguoiThue());
                statement.setString(2, phongTro.getSoDienThoai());
                statement.setString(3, phongTro.getNgayBatDau());
                statement.setInt(4, phongTro.getIdHinhThuc());
                statement.setString(5, phongTro.getGhiChu());
                statement.executeUpdate();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            } finally {
                try {
                    statement.close();
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
                DBConnection.close();
            }
        }
    }


    @Override
    public void remove(int id) {
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = null;

        if (connection != null) {
            try {
                statement = connection.prepareStatement("delete from phong_tro where id = ?");
                statement.setInt(1, id);
                statement.executeUpdate();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            } finally {
                try {
                    statement.close();
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
                DBConnection.close();
            }
        }
    }

    @Override
    public List<PhongTro> findByName(String name ) {
        List<PhongTro> phongTroList = new ArrayList<>();
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        if (connection != null) {
            try {
                statement = connection.prepareStatement("select * from phong_tro join hinh_thuc on phong_tro.id_hinh_thuc = hinh_thuc.id where name_product like ? 1");
                statement.setString(1, "%"+name+"%");
                resultSet = statement.executeQuery();
                PhongTro phongTro = null;

                while (resultSet.next()){
                    int id = resultSet.getInt("id");
                    String tenNguoiThue = resultSet.getString("ten_nguoi_thue");
                    String soDienThoai = resultSet.getString("so_dien_thoai");
                    String ngayBatDau = resultSet.getString("ngay_bat_dau");
                    String hinhThuc = resultSet.getString("hinh_thuc");
                    int idHinhThuc = resultSet.getInt("id_hinh_thuc");
                    String ghiChu = resultSet.getString("ghi_chu");
                    phongTro=new PhongTro(id,tenNguoiThue,soDienThoai,ngayBatDau,idHinhThuc,hinhThuc,ghiChu);
                    phongTroList.add(phongTro);
                }
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
        return phongTroList;
    }
}
