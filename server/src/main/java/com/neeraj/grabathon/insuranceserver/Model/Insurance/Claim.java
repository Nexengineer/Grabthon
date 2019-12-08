package com.neeraj.grabathon.insuranceserver.Model.Insurance;

public class Claim {
    private String userID;
    private String policyID;

    public Claim(String userID, String policyID) {
        this.userID = userID;
        this.policyID = policyID;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getPolicyID() {
        return policyID;
    }

    public void setPolicyID(String policyID) {
        this.policyID = policyID;
    }
}
