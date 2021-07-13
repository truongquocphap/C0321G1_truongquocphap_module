package model.repository;

import model.bean.PhongTro;

import java.util.List;

public interface PhongTroRepository {
    List<PhongTro> findAll();

    void save(PhongTro phongTro);

    void remove(int id);

    List<PhongTro> findByName(String name);
}
