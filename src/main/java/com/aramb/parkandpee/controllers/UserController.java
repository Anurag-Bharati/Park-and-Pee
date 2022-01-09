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
        if (user.name == null || user.number == null || user.password == null){
            logger.info("[REGISTER]: Invalid register parameter!");
            return null;
        }
        User result = userRepo.findByNumber(user.number);
        if (result!=null){
            logger.info("[REGISTER]: User already exist!");
            return null;
        }
        logger.info("[REGISTER]: "+user.name + " with " + user.number + " has registered with \"" + user.password+"\" password");
        return userRepo.save(user);
    }
    @PostMapping("/login")
    public User login(@RequestBody User user){
        User result = userRepo.findByNumberAndPassword(user.number, user.password);
        if (result!=null) {
            logger.info("[LOGIN]: "+result.name + " has logged with \"" + user.password+"\" password");
        } else {
            logger.info("[LOGIN]: User doesn't exists!");
        }
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