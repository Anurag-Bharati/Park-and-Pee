package com.aramb.parkandpee.model;

import lombok.Data;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
@Data
public class Service {

    @Id
    @GeneratedValue(generator = "service")
    Integer id;

    @Column(nullable = false)
    public String name;

    @Column(nullable = false)
    public String location_type;

    @Column(nullable = false)
    public String service_type;

    @Column(nullable = false)
    public String coordinates;

    @Column(nullable = false)
    public String amenities;

    @Column(nullable = false)
    public String mainPicPath;

    @Column(nullable = false)
    public String coverPicPath;

}
