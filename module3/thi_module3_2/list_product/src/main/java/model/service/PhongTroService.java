package model.service;

import model.bean.PhongTro;

import java.util.List;
import java.util.Map;

public interface PhongTroService {
    List<PhongTro> findAll();

    Map<String , String> save(PhongTro phongTro);

    void remove(int id);

    List<PhongTro> findByName(String name);
}
