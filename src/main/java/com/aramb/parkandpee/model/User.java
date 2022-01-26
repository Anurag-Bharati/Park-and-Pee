package com.aramb.parkandpee.model;
import lombok.Data;

import javax.persistence.*;

@Entity
@Data
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(nullable = false)
    public String name;
    @Column(nullable = false)
    public String number;
    @Column(nullable = false)
    public String password;
}
