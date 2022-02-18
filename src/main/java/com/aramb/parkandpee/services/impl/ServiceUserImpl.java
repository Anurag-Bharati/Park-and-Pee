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
    public User getUserByNumberAndPassword(String number, String pass) {
        User user = userRepo.findByNumberAndPassword(number, pass);
        if (user!=null) return user;
        else throw new ResourceNotFoundException("User", "Number", number);
    }

    @Override
    public User updateUser(User user,int id) {
        User isThere = userRepo.findById(id).orElseThrow(() -> new ResourceNotFoundException("User", "Id",id));
        if(user.name!=null && user.name.length()>2) isThere.setName(user.getName());

        if (user.number!=null) isThere.setNumber(user.getNumber());
        if(user.password!=null) isThere.setPassword(user.getPassword());

        if(user.getServices()!=null) isThere.getServices().addAll(user.getServices());

        if(user.legal_name!=null) isThere.setLegal_name(user.getLegal_name());
        if(user.business_number!=null) isThere.setBusiness_number(user.getBusiness_number());
        if(user.current_address!=null) isThere.setCurrent_address(user.getCurrent_address());
        if(user.gender!=null) isThere.setGender(user.getGender());
        if(user.citizenship!=null) isThere.setCitizenship(user.getCitizenship());
        if(user.dob!=null) isThere.setDob(user.getDob());
        userRepo.save(isThere);
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
