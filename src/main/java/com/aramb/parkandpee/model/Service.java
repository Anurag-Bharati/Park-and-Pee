package com.aramb.parkandpee.model;

import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
@Data
public class Service {
    @Id
    @GeneratedValue(generator = "service")
    Integer id;

    public String name, location_type, service_type, coordinates, amenities;
}
