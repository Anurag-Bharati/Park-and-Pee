package com.aramb.parkandpee.repo;

import com.aramb.parkandpee.model.Service;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ServiceRepo extends JpaRepository<Service, Integer> {

}
