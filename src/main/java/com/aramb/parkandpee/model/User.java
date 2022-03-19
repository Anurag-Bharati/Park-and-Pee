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
    public String profile_pic;

    @Column(nullable = false)
    public boolean is_so = false;

    public String legal_name;

    public String current_address;

    public String business_number;

    public String dob;

    public String citizenship;

    public String gender;

}
