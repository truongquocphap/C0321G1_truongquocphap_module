package model.service;

import model.repository.ServiceRepository;
import model.repository.ServiceRepositoryImpl;

import java.util.List;

public class ServiceServiceIplm implements ServiceService {
    ServiceRepository serviceRepository=new ServiceRepositoryImpl();
    @Override
    public void insertService(model.bean.Service service) {
serviceRepository.insertService(service);
    }

    @Override
    public model.bean.Service selectService(int id) {
        return serviceRepository.selectService(id);
    }

    @Override
    public List<model.bean.Service> selectAllService() {
        return serviceRepository.selectAllService();
    }

    @Override
    public boolean deleteService(int id) {
        return serviceRepository.deleteService(id);
    }

    @Override
    public boolean updateService(model.bean.Service service) {
        return serviceRepository.updateService(service);
    }

    @Override
    public List<model.bean.Service> searchName(String name) {
        return serviceRepository.searchName(name);
    }
}
