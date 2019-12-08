package com.neeraj.grabathon.insuranceserver.Model;

import com.neeraj.grabathon.insuranceserver.Model.Insurance.Insurance;

import java.util.List;

public class User {
    private String userID;
    private String name;
    private String lastName;
    private String Address;
    private List<Insurance> insurances;

    public User(String userID, String name, String lastName, String address, List<Insurance> insurances) {
        this.userID = userID;
        this.name = name;
        this.lastName = lastName;
        Address = address;
        this.insurances = insurances;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getAddress() {
        return Address;
    }

    public void setAddress(String address) {
        Address = address;
    }

    public List<Insurance> getInsurances() {
        return insurances;
    }

    public void setInsurances(List<Insurance> insurances) {
        this.insurances = insurances;
    }
}
