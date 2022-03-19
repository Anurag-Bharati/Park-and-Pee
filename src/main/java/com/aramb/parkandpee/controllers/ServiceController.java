package com.aramb.parkandpee.controllers;

import com.aramb.parkandpee.model.ServiceModel;
import com.aramb.parkandpee.services.ServiceService;
import org.springframework.data.domain.Page;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api/service")
public class ServiceController {
    private final ServiceService service;

    public ServiceController(ServiceService service) {
        super();
        this.service = service;
    }

    @GetMapping
    public ResponseEntity<List<ServiceModel>> getAllService() {
        return new ResponseEntity<>(service.getAllService(), HttpStatus.OK);
    }


    @GetMapping("/all")
    public ResponseEntity<Page<ServiceModel>> getAllClosestService(
            @RequestParam("myLat") double lat,
            @RequestParam("myLng") double lng,
            @RequestParam(name = "pageNo", required = false, defaultValue = "0") int pageNo,
            @RequestParam(name = "pageSize", required = false, defaultValue = "10") int pageSize,
            @RequestParam(name = "distance", required = false, defaultValue = "500") double distance
    ) {

        double one_meter_degree = 0.000009009;
        double distance_to_degree = distance * one_meter_degree;
        return new ResponseEntity<>(
                service.getAllClosest(pageNo, pageSize, lat, lng, distance_to_degree),
                HttpStatus.OK);
    }

    @GetMapping("/parking")
    public ResponseEntity<Page<ServiceModel>> getAllClosestParkingService(
            @RequestParam("myLat") double lat,
            @RequestParam("myLng") double lng,
            @RequestParam(name = "pageNo", required = false, defaultValue = "0") int pageNo,
            @RequestParam(name = "pageSize", required = false, defaultValue = "10") int pageSize,
            @RequestParam(name = "distance", required = false, defaultValue = "500") double distance
    ) {
        double one_meter_degree = 0.000009009;
        double distance_to_degree = distance * one_meter_degree;
        return new ResponseEntity<>(service.getClosestPark(pageNo, pageSize, lat, lng, distance_to_degree), HttpStatus.OK);
    }

    @GetMapping("/peeing")
    public ResponseEntity<Page<ServiceModel>> getAllClosestPeeingService(
            @RequestParam("myLat") double lat,
            @RequestParam("myLng") double lng,
            @RequestParam(name = "pageNo", required = false, defaultValue = "0") int pageNo,
            @RequestParam(name = "pageSize", required = false, defaultValue = "10") int pageSize,
            @RequestParam(name = "distance", required = false, defaultValue = "500") double distance
    ) {
        double one_meter_degree = 0.000009009;
        double distance_to_degree = distance * one_meter_degree;
        return new ResponseEntity<>(service.getClosestPee(pageNo, pageSize, lat, lng, distance_to_degree), HttpStatus.OK);
    }
}
