package com.aramb.parkandpee.services;

import com.aramb.parkandpee.model.ServiceModel;
import org.springframework.data.domain.Page;

import java.util.List;

public interface ServiceService {
    List<ServiceModel> getAllService();
    List<ServiceModel> getAllServiceByType(String type);
    ServiceModel getServiceById(int id);
    void deleteService(int id);
    ServiceModel updateService(ServiceModel service, int id);
    Page<ServiceModel> getAllClosest(int pageNo, int pageSize,double lat, double lng, double distance);
    Page<ServiceModel> getClosestPark(int pageNo, int pageSize,double lat, double lng, double distance);
    Page<ServiceModel> getClosestPee(int pageNo, int pageSize,double lat, double lng, double distance);

}
