package com.aramb.parkandpee.services.impl;

import com.aramb.parkandpee.model.Service;
import com.aramb.parkandpee.services.ServiceService;
import org.springframework.data.domain.Page;

import java.util.List;

public class ServiceServiceImpl implements ServiceService {

    @Override
    public List<Service> getAllService() {
        return null;
    }

    @Override
    public List<Service> getAllServiceByType(String type) {
        return null;
    }

    @Override
    public Service getServiceById(int id) {
        return null;
    }

    @Override
    public void saveService(Service service) {

    }

    @Override
    public void deleteService(int id) {

    }

    @Override
    public Service updateService(Service service, int id) {
        return null;
    }

    @Override
    public Page<Service> findPaginated(int pageNo, int pageSize) {
        return null;
    }
}
