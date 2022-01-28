package com.aramb.parkandpee.services.impl;

import com.aramb.parkandpee.exceptions.ResourceNotFoundException;
import com.aramb.parkandpee.model.User;
import com.aramb.parkandpee.repo.UserRepo;
import com.aramb.parkandpee.services.ServiceUser;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class ServiceUserImpl implements ServiceUser {
    private final UserRepo userRepo;

    public ServiceUserImpl(UserRepo userRepo) {
        super();
        this.userRepo = userRepo;
    }

    @Override
    public User saveUser(User user) {
        return userRepo.save(user);
    }

    @Override
    public List<User> getAllUsers() {
        return userRepo.findAll();
    }

    @Override
    public User getUserById(int id) {
        Optional<User> user = userRepo.findById(id);
        if (user.isPresent()) return user.get();
        else throw new ResourceNotFoundException("User", "ID", id);
    }

    @Override
    public User updateUser(User user, int id) {
        User isThere = userRepo.findById(id).orElseThrow(() -> new ResourceNotFoundException("User", "Id",id));
        isThere.setName(user.getName());
        isThere.setNumber(user.getNumber());
        isThere.setPassword(user.getPassword());

        userRepo.save(user);
        return isThere;
    }

    @Override
    public void deleteUser(int id) {
        if(userRepo.existsById(id)) {
            userRepo.deleteById(id);
        }
        else throw new ResourceNotFoundException("User", "Id", id);
    }
}
