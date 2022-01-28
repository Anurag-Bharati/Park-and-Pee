package com.aramb.parkandpee.controllers;

import com.aramb.parkandpee.model.ServiceModel;
import com.aramb.parkandpee.services.ServiceService;
import org.springframework.data.domain.Page;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

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

    @GetMapping(value = "/page")
    public List<ServiceModel> findPaginated(@RequestParam("pageNo") int pageNo, @RequestParam(value = "pageSize") int pageSize) {
        Page<ServiceModel> page = service.findPaginated(pageNo, pageSize);
        return page.getContent();
    }

    @GetMapping("/range")
    public ResponseEntity<List<ServiceModel>> getAllClosestService(@RequestParam("myLat") double lat, @RequestParam("myLng") double lng) {
        return new ResponseEntity<>(service.getAllClosest(lat, lng), HttpStatus.OK);
    }
}
