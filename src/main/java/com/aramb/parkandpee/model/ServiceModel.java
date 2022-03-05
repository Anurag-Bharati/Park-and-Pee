package com.aramb.parkandpee.model;

import lombok.Data;

import javax.persistence.*;

@Entity
@Data
public class ServiceModel {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    Integer service_id;

    Integer service_owner;

    @Column(nullable = false)
    public String name;

    @Column(nullable = false)
    public String location_type;

    @Column(nullable = false)
    public String service_type;

    @Column(nullable = false)
    public double latitude;

    @Column(nullable = false)
    public double longitude;

    @Column(nullable = false)
    public String amenities;

    @Column(nullable = false)
    public String main_pic_path;

    @Column(nullable = false)
    public String cover_pic_path;

}
