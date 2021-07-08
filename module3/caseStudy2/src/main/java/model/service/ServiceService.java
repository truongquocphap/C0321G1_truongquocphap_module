package model.service;

import java.util.List;

public interface ServiceService {
    public void insertService(model.bean.Service service);
    public model.bean.Service selectService(int id);
    public List<model.bean.Service> selectAllService();
    public boolean deleteService(int id);
    public boolean updateService(model.bean.Service service);
    public List<model.bean.Service> searchName(String name);
}
