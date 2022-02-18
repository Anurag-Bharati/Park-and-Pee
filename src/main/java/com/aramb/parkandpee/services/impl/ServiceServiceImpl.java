package com.aramb.parkandpee.services.impl;

import com.aramb.parkandpee.model.ServiceModel;
import com.aramb.parkandpee.repo.ServiceRepo;
import com.aramb.parkandpee.services.ServiceService;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ServiceServiceImpl implements ServiceService {

    private final ServiceRepo serviceRepo;

    public ServiceServiceImpl(ServiceRepo serviceRepo) {
        super();
        this.serviceRepo = serviceRepo;
    }
    @Override
    public List<ServiceModel> getAllService() {
        return serviceRepo.findAll();
    }

    @Override

    public List<ServiceModel> getAllServiceByType(String type) {

        return null;
    }

    @Override
    public ServiceModel getServiceById(int id) {
        return null;
    }



    @Override
    public void deleteService(int id) {

    }

    @Override
    public ServiceModel updateService(ServiceModel service, int id) {
        return null;
    }

    @Override
    public Page<ServiceModel> getAllClosest(int pageNo, int pageSize,double lat, double lng, double distance) {

        Pageable pageable = PageRequest.of(pageNo, pageSize);
        return serviceRepo.getAllClosest(lat,lng, pageable,distance);
    }
    @Override
    public Page<ServiceModel> getClosestPark(int pageNo, int pageSize,double lat, double lng, double distance) {
        Pageable pageable = PageRequest.of(pageNo, pageSize);
        return serviceRepo.getClosestParkingService(lat,lng, pageable,distance);
    }
    @Override
    public Page<ServiceModel> getClosestPee(int pageNo, int pageSize,double lat, double lng, double distance) {
        Pageable pageable = PageRequest.of(pageNo, pageSize);
        return serviceRepo.getClosestPeeingService(lat,lng, pageable,distance);
    }

}
