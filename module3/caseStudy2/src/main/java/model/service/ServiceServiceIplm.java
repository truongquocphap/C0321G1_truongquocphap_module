package model.service;

import model.repository.ServiceRepository;
import model.repository.ServiceRepositoryImpl;
import model.service.common.Validate;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ServiceServiceIplm implements ServiceService {
    ServiceRepository serviceRepository=new ServiceRepositoryImpl();
    @Override
    public Map<String,String> insertService(model.bean.Service service) {
        Map<String, String> mapMessage = new HashMap<>();
        if (Validate.validateServiceCode(service.getService_code()) != null
                || Validate.validateNumber2(String.valueOf(service.getService_cost())) != null
                || Validate.validateNumber1(String.valueOf(service.getService_max_people())) != null
                || Validate.validateNumber2(String.valueOf(service.getPool_area())) != null
                || Validate.validateNumber1(String.valueOf(service.getNumber_of_floor())) != null
                || Validate.validateNumber2(String.valueOf(service.getService_area())) != null) {
            mapMessage.put("code", Validate.validateServiceCode(service.getService_code()));
            mapMessage.put("area", Validate.validateNumber2(String.valueOf(service.getService_area())));
            mapMessage.put("cost", Validate.validateNumber2(String.valueOf(service.getService_cost())));
            mapMessage.put("maxPeople", Validate.validateNumber1(String.valueOf(service.getService_max_people())));
            mapMessage.put("poolArea", Validate.validateNumber2(String.valueOf(service.getPool_area())));
            mapMessage.put("numberOfFloor", Validate.validateNumber1(String.valueOf(service.getNumber_of_floor())));
        } else {
            serviceRepository.insertService(service);
        }
        return mapMessage;
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
    public Map<String,String> updateService(model.bean.Service service) {
        Map<String, String> mapMessage = new HashMap<>();
        if (Validate.validateServiceCode(service.getService_code()) != null
                || Validate.validateNumber2(String.valueOf(service.getService_cost())) != null
                || Validate.validateNumber1(String.valueOf(service.getService_max_people())) != null
                || Validate.validateNumber2(String.valueOf(service.getPool_area())) != null
                || Validate.validateNumber1(String.valueOf(service.getNumber_of_floor())) != null
                || Validate.validateNumber2(String.valueOf(service.getService_area())) != null) {
            mapMessage.put("code", Validate.validateServiceCode(service.getService_code()));
            mapMessage.put("area", Validate.validateNumber2(String.valueOf(service.getService_area())));
            mapMessage.put("cost", Validate.validateNumber2(String.valueOf(service.getService_cost())));
            mapMessage.put("maxPeople", Validate.validateNumber1(String.valueOf(service.getService_max_people())));
            mapMessage.put("poolArea", Validate.validateNumber2(String.valueOf(service.getPool_area())));
            mapMessage.put("numberOfFloor", Validate.validateNumber1(String.valueOf(service.getNumber_of_floor())));
        } else {
            serviceRepository.updateService(service);
        }
        return mapMessage;
    }

    @Override
    public List<model.bean.Service> searchName(String name) {
        return serviceRepository.searchName(name);
    }
}
