package model.repository;

import model.bean.Customer;
import model.bean.Service;

import java.util.List;

public interface ServiceRepository {
    public void insertService(Service service);
    public Service selectService(int id);
    public List<Service> selectAllService();
    public boolean deleteService(int id);
    public boolean updateService(Service service);
    public List<Service> searchName(String name);
}
