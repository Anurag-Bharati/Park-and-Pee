package com.aramb.parkandpee.services;

import com.aramb.parkandpee.model.Service;
import org.springframework.data.domain.Page;

import java.util.List;

public interface ServiceService {
    List<Service> getAllService();
    List<Service> getAllServiceByType(String type);
    Service getServiceById(int id);
    void saveService(Service service);
    void deleteService(int id);
    Service updateService(Service service, int id);
    Page<Service> findPaginated(int pageNo, int pageSize);

}
