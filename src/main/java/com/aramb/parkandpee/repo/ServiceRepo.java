package com.aramb.parkandpee.repo;

import com.aramb.parkandpee.model.ServiceModel;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface ServiceRepo extends JpaRepository<ServiceModel, Integer>{
    // Put fricking 8 hr into it :( - .- -. ..- .-. .- --. / -... .... .- .-. .- - ..z
    @Query(value = "SELECT * FROM service_model WHERE (ABS(latitude-:lat) <= :distance)  AND (ABS(longitude-:lng) <= :distance)", nativeQuery = true)
     Page<ServiceModel> getAllClosest(@Param("lat") double lat, @Param("lng")double lng, Pageable page, double distance);

    @Query(value = "SELECT * FROM service_model WHERE (ABS(latitude-:lat) <= :distance) AND (ABS(longitude-:lng) <= :distance) AND service_type = 'Parking' ", nativeQuery = true)
    Page<ServiceModel> getClosestParkingService(@Param("lat") double lat, @Param("lng")double lng, Pageable page, double distance);

    @Query(value = "SELECT * FROM service_model WHERE (ABS(latitude-:lat) <= :distance) AND (ABS(longitude-:lng) <= :distance) AND service_type = 'Toilet' ", nativeQuery = true)
    Page<ServiceModel> getClosestPeeingService(@Param("lat") double lat, @Param("lng")double lng, Pageable page, double distance);
}
