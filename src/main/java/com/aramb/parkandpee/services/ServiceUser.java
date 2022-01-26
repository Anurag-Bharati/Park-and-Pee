package com.aramb.parkandpee.services;

import com.aramb.parkandpee.model.User;

import java.util.List;

public interface ServiceUser{
    User saveUser(User user);
    List<User> getAllUsers();
    User getUserById(int id);
}
