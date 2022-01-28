package com.aramb.parkandpee.model;

import lombok.Data;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Data
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer user_id;

    @OneToMany(targetEntity = ServiceModel.class, cascade = CascadeType.ALL)
    @JoinColumn(name = "service_owner", referencedColumnName = "user_id")
    List<ServiceModel> services = new ArrayList<>();

    @Column(nullable = false)
    public String name;
    @Column(nullable = false)
    public String number;

    public String password;
}
