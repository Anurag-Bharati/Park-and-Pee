package com.aramb.parkandpee.controllers;

import com.aramb.parkandpee.model.User;
import com.aramb.parkandpee.model.UserRepo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController

@RequestMapping("/api/user")
public class UserController {

    final Logger logger = LoggerFactory.getLogger(UserController.class);

    @Autowired
    private UserRepo userRepo;


    @PostMapping("/register")
    public User register(@RequestBody User user){
        logger.info(user.number + " has registered with \"" + user.password+"\" password");
        return userRepo.save(user);
    }
    @PostMapping("/login")
    public User login(@RequestBody User user){
        logger.info(user.number + " has logged with \"" + user.password+"\" password");
        User result = userRepo.findByNumberAndPassword(user.number, user.password);
        System.out.println(result);
        return result;
    }
    @GetMapping("/getInfo")
    public String sayHello() {
        return "[Apache-Tomcat-Server]: Running on port: 8080\n\tAPI: ARAMB | PARK & PEE \n\t";
    }

}
/*

 */