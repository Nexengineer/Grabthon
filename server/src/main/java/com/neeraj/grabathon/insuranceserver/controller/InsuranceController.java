package com.neeraj.grabathon.insuranceserver.controller;


import com.neeraj.grabathon.insuranceserver.Model.User;
import com.neeraj.grabathon.insuranceserver.Service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@RestController
@RequestMapping("api/v1/insurance")
public class InsuranceController {

    @Autowired
    private UserService userService;

    @RequestMapping("/users")
    List<User> getAllUsers(){
      return userService.getAllUsers();
    }

    @RequestMapping("/users/{id}")
    User getUserbyID(@PathVariable String id){
        return userService.getUserByID(id);
    }
}
