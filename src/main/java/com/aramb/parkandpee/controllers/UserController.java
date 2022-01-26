package com.aramb.parkandpee.controllers;

import com.aramb.parkandpee.model.User;
import com.aramb.parkandpee.services.ServiceUser;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/user")
public class UserController {
    private final ServiceUser userService;

    public UserController(ServiceUser userService) {
        super();
        this.userService = userService;
    }

    @PostMapping
    public ResponseEntity<User> saveUser(@RequestBody User user) {
        return new ResponseEntity<>(userService.saveUser(user), HttpStatus.CREATED);
    }

    @GetMapping
    public List<User> getAllUsers(){
        return userService.getAllUsers();
    }

    @GetMapping("{id}")
    public ResponseEntity<User> getUserByID(@PathVariable("id") int id){
        return new ResponseEntity<>(userService.getUserById(id),HttpStatus.OK);
    }
}
