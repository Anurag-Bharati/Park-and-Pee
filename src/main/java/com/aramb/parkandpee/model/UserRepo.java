package com.aramb.parkandpee.model;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepo extends JpaRepository<User,Integer>{
    User findByNumberAndPassword(String number, String password);
}