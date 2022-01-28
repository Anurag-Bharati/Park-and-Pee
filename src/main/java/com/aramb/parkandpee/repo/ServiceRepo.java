package com.aramb.parkandpee.repo;

import com.aramb.parkandpee.model.ServiceModel;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface ServiceRepo extends JpaRepository<ServiceModel, Integer>{
    // Put fricking 8 hr into it :( - .- -. ..- .-. .- --. / -... .... .- .-. .- - ..
    @Query(value = "SELECT * FROM service_model as a WHERE (ABS(latitude-:lat) <= 0.0045045045) AND (ABS(longitude-:lng) <= 0.0045045045)", nativeQuery = true)
     List<ServiceModel> getAllClosest(@Param("lat") double lat, @Param("lng")double lng);

}
