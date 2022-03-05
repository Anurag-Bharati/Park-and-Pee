package com.aramb.parkandpee.repo;
import com.aramb.parkandpee.model.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepo extends JpaRepository<User,Integer>{
    User findByNumberAndPassword(String number, String password);
    User findByNumber(String number);
}