package model.service;

import model.bean.PhongTro;
import model.repository.PhongTroRepository;
import model.repository.PhongTroRepositoryImlp;
import model.service.common.Validate;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class PhongTroServiceImlp implements PhongTroService {
    PhongTroRepository repository = new PhongTroRepositoryImlp();

    @Override
    public List<PhongTro> findAll() {
        return repository.findAll();
    }

    @Override
    public Map<String , String> save(PhongTro phongTro) {
       Map<String , String > map=new HashMap<>();
       if (Validate.validateTelephone(phongTro.getSoDienThoai()) != null
       || Validate.tenNguoiThue(phongTro.getGhiChu()) != null
       ||  Validate.ghiChu(phongTro.getTenNguoiThue()) != null){
           map.put("soDienThoai",Validate.validateTelephone(phongTro.getTenNguoiThue()));
           map.put("tenNguoiThue",Validate.tenNguoiThue(phongTro.getTenNguoiThue()));
           map.put("ghiChu",Validate.ghiChu(phongTro.getGhiChu()));
       }else {
           repository.save(phongTro);
       }
       return map;
    }

    @Override
    public void remove(int id) {
        repository.remove(id);
    }

    @Override
    public List<PhongTro> findByName(String name) {
        return repository.findByName(name);
    }
}
