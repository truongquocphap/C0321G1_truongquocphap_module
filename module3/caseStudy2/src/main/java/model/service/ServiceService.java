package model.service;

import java.util.List;
import java.util.Map;

public interface ServiceService {
    public Map<String,String> insertService(model.bean.Service service);
    public model.bean.Service selectService(int id);
    public List<model.bean.Service> selectAllService();
    public boolean deleteService(int id);
    public Map<String,String> updateService(model.bean.Service service);
    public List<model.bean.Service> searchName(String name);
}
